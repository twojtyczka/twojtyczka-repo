-- a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodaj�c do niego kierunkowy dla Polski w nawiasie (+48)

USE firma
UPDATE ksiegowosc.pracownicy SET telefon = '+48' + telefon

-- b) Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony by� my�lnikami wg wzoru: �555-222-333�

UPDATE ksiegowosc.pracownicy
    SET telefon = CONCAT(SUBSTRING(telefon,1,3),' ',SUBSTRING(telefon,3,3),'-',SUBSTRING(telefon,6,3),'-',SUBSTRING(telefon,9,3))

-- c) Wy�wietl dane pracownika, kt�rego nazwisko jest najd�u�sze, u�ywaj�c du�ych liter

SELECT TOP 1 UPPER(nazwisko) AS nazwisko,
    id_pracownika,
	imie,
    adres,
    telefon
    FROM ksiegowosc.pracownicy
    ORDER BY len(nazwisko) DESC;

-- d) Wy�wietl dane pracownik�w i ich pensje zakodowane przy pomocy algorytmu md5 

SELECT HashBytes('MD5', CAST(id_pracownika AS VARCHAR)) AS id_pracownika,
       HashBytes('MD5', imie) AS imie,
       HashBytes('MD5',nazwisko) AS nazwisko,
	   HashBytes('MD5', CAST(adres AS VARCHAR)) AS adres,
	   HashBytes('MD5',CAST(telefon AS VARCHAR)) AS telefon,
       HashBytes('MD5', CAST(kwota AS VARCHAR)) AS pensja
    FROM ksiegowosc.pracownicy
        JOIN ksiegowosc.pensja ON pensja.id_pensji = pracownicy.id_pracownika;

-- e) Wy�wietl pracownik�w, ich pensje oraz premie. Wykorzystaj z��czenie lewostronne.

SELECT pracownicy.id_pracownika, imie, nazwisko, adres, telefon, pensja.kwota AS pensja, premia.kwota AS premia
    FROM ksiegowosc.pracownicy
        LEFT JOIN ksiegowosc.pensja ON pensja.id_pensji = pracownicy.id_pracownika
        LEFT JOIN ksiegowosc.premia ON premia.id_premii = pracownicy.id_pracownika;

-- f) Wygeneruj raport (zapytanie), kt�re zwr�ci w wyniki tre�� wg poni�szego szablonu: Pracownik Jan Nowak, w dniu 7.08.2017 otrzyma� pensj� ca�kowit� na kwot� 7540 z�, gdzie wynagrodzenie zasadnicze wynosi�o: 5000 z�, premia: 2000 z�, nadgodziny: 540 z�

ALTER TABLE ksiegowosc.godziny
ADD nadgodziny INTEGER;
UPDATE ksiegowosc.godziny
SET nadgodziny = liczba_godzin - 160
WHERE liczba_godzin > 160;

SELECT CONCAT('Pracownik ', imie, ' ', nazwisko, ', w dniu ', godziny.dataa , ' otrzyma� pensj� ca�kowit� na kwot� ', pensja.kwota + premia.kwota, ' z�, gdzie wynagrodzenie zasadnicze wynosi�o: ', pensja.kwota, 'z�, premia: ', premia.kwota, 'z�, nadgodziny: ', (godziny.nadgodziny)*30, 'z�.' ) AS RAPORT
FROM ksiegowosc.pracownicy AS pracownicy
	JOIN ksiegowosc.wynagrodzenie AS wynagrodzenie
		ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	JOIN ksiegowosc.pensja AS pensja
		ON pensja.id_pensji = wynagrodzenie.id_pensji
	JOIN ksiegowosc.premia AS premia
		ON premia.id_premii = wynagrodzenie.id_premii
	JOIN ksiegowosc.godziny AS godziny
		ON godziny.id_godziny = wynagrodzenie.id_godziny
