-- 1. Utworz nowa baze danych nazywajac ja firma.

CREATE DATABASE firma;
USE firma;

-- 2. Dodaj nowy schemat o nazwie rozliczenia.

CREATE SCHEMA ksiegowosc;

-- 4. Dodaj cztery tabele.

--tabela pracownikow

CREATE TABLE ksiegowosc.pracownicy (
    id_pracownika integer  PRIMARY KEY NOT NULL,
    imie varchar(20)  NOT NULL,
    nazwisko varchar(20)  NOT NULL,
    adres varchar(50),
    telefon varchar(15)
);

--tabela godzin

CREATE TABLE ksiegowosc.godziny (
    id_godziny integer  PRIMARY KEY NOT NULL,
    dataa date  NOT NULL,
    liczba_godzin integer  NOT NULL,
    id_pracownika integer  NOT NULL
);

--tabela pensji

CREATE TABLE ksiegowosc.pensja (
    id_pensji integer PRIMARY KEY  NOT NULL,
    stanowisko varchar(20)  NOT NULL,
    kwota integer  NOT NULL
);

--tabela premii

CREATE TABLE ksiegowosc.premia (
    id_premii integer PRIMARY KEY NOT NULL,
    rodzaj varchar(20),
    kwota integer
);

--tabela wynagrodzen

CREATE TABLE ksiegowosc.wynagrodzenie (
    id_wynagrodzenia integer PRIMARY KEY NOT NULL,
    dataa date  NOT NULL,
    id_pracownika integer NOT NULL,
    id_godziny integer NOT NULL,
    id_pensji integer NOT NULL,
    id_premii integer NOT NULL
);

ALTER TABLE ksiegowosc.godziny
	ADD FOREIGN KEY (id_pracownika)
		REFERENCES ksiegowosc.pracownicy(id_pracownika)
		ON DELETE CASCADE;

ALTER TABLE ksiegowosc.wynagrodzenie
    ADD FOREIGN KEY (id_pracownika)
		REFERENCES ksiegowosc.pracownicy(id_pracownika)
		ON DELETE CASCADE;

ALTER TABLE ksiegowosc.wynagrodzenie
	ADD FOREIGN KEY (id_godziny) 
		REFERENCES ksiegowosc.godziny(id_godziny)
		ON DELETE CASCADE;

ALTER TABLE ksiegowosc.wynagrodzenie
	ADD FOREIGN KEY (id_pensji)
		REFERENCES ksiegowosc.pensja(id_pensji)
		ON DELETE CASCADE;

ALTER TABLE ksiegowosc.wynagrodzenie
	ADD FOREIGN KEY (id_premii)
		REFERENCES ksiegowosc.premia(id_premii)
		ON DELETE CASCADE;

-- 5. Wype�nij ka�d� tabel� 10. rekordami.
INSERT INTO ksiegowosc.pracownicy VALUES
	(0, 'Adam', 'Koj', 'Mickiewicza 8', '677877896'),
	(1, 'Ewa', 'Koc', 'Maki 6', '445667557'),
	(2, 'Stefan', 'Maj', 'Zwierzyniecka 5', '987654789'),
	(3, 'Mateusz', 'Kowalski', 'Dobczycka 5', '980678456'),
	(4, 'Katarzyna', 'Nowak', 'Dabrowska 80', '555666888'),
	(5, 'Jan', 'Adamczyk', 'Prosta 6', '555777666'),
	(6, 'Weronika', 'Kula', 'Magnoliowa 24', '456789023'),
	(7, 'Filip', 'Las', 'Zakatkowa 7', '444879034'),
	(8, 'Natalia', 'Drabek', 'Krotka 7', '666888444'),
	(9, 'Wojciech', 'Maj', 'Dabrowska 9', NULL);

INSERT INTO ksiegowosc.godziny VALUES
	(0, '2018-05-10', 150, 0),
	(1, '2018-07-17', 170, 1),
	(2, '2018-08-21', 160, 2),
	(3, '2018-09-11', 170, 3),
	(4, '2018-05-12', 175, 4),
	(5, '2018-06-13', 167, 5),
	(6, '2018-01-19', 168, 6),
	(7, '2018-02-27', 156, 7),
	(8, '2018-03-24', 152, 8),
	(9, '2018-04-28', 168, 9);

INSERT INTO ksiegowosc.pensja VALUES
	(0, 'piekarz', 2100),
	(1, 'spedytor', 1100),
	(2, 'kucharz', 3000),
	(3, 'kierowca', 3000),
	(4, 'kierowca', 3500),
	(5, 'piekarz', 4000),
	(6, 'kucharz', 4500),
	(7, 'sprzedawca', 3700),
	(8, 'kierownik', 5000),
	(9, 'kucharz', 2500);

INSERT INTO ksiegowosc.premia VALUES
	(0, 'motywacyjna', NULL),
	(1, 'indywidualna', 400),
	(2, 'indywidualna', NULL),
	(3, 'zespolowa', 600),
	(4, 'dlugoterminowa', 250),
	(5, 'indywidualna', 600),
	(6, 'powszechna', 400),
	(7, 'indywidualna', 350),
	(8, NULL, 300),
	(9, 'indywidualna', 400);

INSERT INTO ksiegowosc.wynagrodzenie VALUES
	(0, '2018-05-10', 0, 0, 0, 0),
	(1, '2018-07-17', 1, 1, 1, 1),
	(2, '2018-08-21', 2, 2, 2, 2),
	(3, '2018-09-11', 3, 3, 3, 3),
	(4, '2018-05-12', 4, 4, 4, 4),
	(5, '2018-06-13', 5, 5, 5, 5),
	(6, '2018-01-19', 6, 6, 6, 6),
	(7, '2018-02-27', 7, 7, 7, 7),
	(8, '2018-03-24', 8, 8, 8, 8),
	(9, '2018-04-28', 9, 9, 9, 9);

--6. Wykonaj nast�puj�ce zapytania:

--a) Wy�wietl tylko id pracownika oraz jego nazwisko.

SELECT id_pracownika, nazwisko
    FROM ksiegowosc.pracownicy;

--b) Wy�wietl id pracownik�w, kt�rych p�aca jest wi�ksza ni� 1000.

SELECT id_pracownika, kwota
    FROM ksiegowosc.wynagrodzenie
        JOIN ksiegowosc.pensja ON ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
    WHERE kwota > 1000;

--c) Wy�wietl id pracownik�w nieposiadaj�cych premii, kt�rych p�aca jest wi�ksza ni� 2000.

SELECT id_pracownika
    FROM ksiegowosc.wynagrodzenie
        JOIN ksiegowosc.premia ON ksiegowosc.premia.id_premii = ksiegowosc.wynagrodzenie.id_premii
        JOIN ksiegowosc.pensja ON ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
    WHERE ksiegowosc.pensja.kwota >2000 AND ksiegowosc.premia.kwota IS NULL;

--d) Wy�wietl pracownik�w, kt�rych pierwsza litera imienia zaczyna si� na liter� �J�.

SELECT * FROM ksiegowosc.pracownicy
    WHERE imie LIKE 'J%';

-- e) Wy�wietl pracownik�w, kt�rych nazwisko zawiera liter� �n� oraz imi� ko�czy si� na liter� �a�.

SELECT * FROM ksiegowosc.pracownicy
    WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';

--f) Wy�wietl imi� i nazwisko pracownik�w oraz liczb� ich nadgodzin, przyjmuj�c, i� standardowy czas pracy to 160 h miesi�cznie.

SELECT imie, nazwisko, ksiegowosc.godziny.liczba_godzin - 160 AS liczba_nadgodzin
    FROM ksiegowosc.pracownicy
        JOIN ksiegowosc.godziny ON ksiegowosc.godziny.id_pracownika = ksiegowosc.pracownicy.id_pracownika
    WHERE ksiegowosc.godziny.liczba_godzin > 160;

--g)  Wy�wietl imi� i nazwisko pracownik�w, kt�rych pensja zawiera si� w przedziale 1500 � 3000 PLN.

SELECT imie, nazwisko FROM ksiegowosc.pracownicy
    JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
    JOIN ksiegowosc.pensja ON pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
WHERE kwota > 1500 AND kwota < 3000;

--h) Wy�wietl imi� i nazwisko pracownik�w, kt�rzy pracowali w nadgodzinach i nie otrzymali premii.

SELECT imie, nazwisko, ksiegowosc.godziny.liczba_godzin - 160 AS liczba_nadgodzin, ksiegowosc.premia.kwota
    FROM ksiegowosc.pracownicy
    JOIN ksiegowosc.godziny ON ksiegowosc.godziny.id_pracownika = ksiegowosc.pracownicy.id_pracownika
    JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
    JOIN ksiegowosc.premia ON premia.id_premii = ksiegowosc.wynagrodzenie.id_premii
    WHERE ksiegowosc.godziny.liczba_godzin > 160 AND ksiegowosc.premia.kwota IS NULL;

-- i) Uszereguj pracownik�w wed�ug pensji.

SELECT imie, nazwisko, ksiegowosc.pensja.kwota
    FROM ksiegowosc.pracownicy
        JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
        JOIN ksiegowosc.pensja ON pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
    ORDER BY ksiegowosc.pensja.kwota;

-- j) Uszereguj pracownik�w wed�ug pensji i premii malej�co.

SELECT imie, nazwisko, ksiegowosc.pensja.kwota AS pensja, ksiegowosc.premia.kwota AS premia
    FROM ksiegowosc.pracownicy
        JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
        JOIN ksiegowosc.pensja ON pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
        JOIN ksiegowosc.premia ON premia.id_premii = ksiegowosc.wynagrodzenie.id_premii
    ORDER BY ksiegowosc.pensja.kwota DESC, ksiegowosc.premia.kwota DESC;

-- k) Zlicz i pogrupuj pracownik�w wed�ug pola �stanowisko�.

SELECT stanowisko, COUNT(*)
    FROM ksiegowosc.pracownicy
        JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
        JOIN ksiegowosc.pensja ON ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
    GROUP BY pensja.stanowisko;

-- l) Policz �redni�, minimaln� i maksymaln� p�ac� dla stanowiska �kierownik� (je�eli takiego nie masz, to przyjmij dowolne inne).

SELECT stanowisko, min(kwota), max(kwota), avg(kwota)
    FROM ksiegowosc.pensja
        WHERE stanowisko = 'kierownik'
    GROUP BY stanowisko;

-- m) Policz sum� wszystkich wynagrodze�.

SELECT sum((pensja.kwota + premia.kwota)) AS suma_wszystkich_wynagrodzen FROM ksiegowosc.wynagrodzenie
    JOIN ksiegowosc.pensja ON ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
    JOIN ksiegowosc.premia ON ksiegowosc.premia.id_premii = ksiegowosc.wynagrodzenie.id_premii;

-- n)  Policz sum� wynagrodze� w ramach danego stanowiska.

SELECT (pensja.kwota + coalesce(premia.kwota, 0)) AS suma_wynagrodzen, pensja.stanowisko FROM ksiegowosc.wynagrodzenie
    JOIN ksiegowosc.pensja ON ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
    JOIN ksiegowosc.premia ON ksiegowosc.premia.id_premii = ksiegowosc.wynagrodzenie.id_premii;

-- o) Wyznacz liczb� premii przyznanych dla pracownik�w danego stanowiska.

SELECT count(premia.id_premii), pensja.stanowisko 
    FROM ksiegowosc.premia
        JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.wynagrodzenie.id_premii = premia.id_premii
        JOIN ksiegowosc.pensja ON pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
    GROUP BY pensja.stanowisko

-- p) Usu� wszystkich pracownik�w maj�cych pensj� mniejsz� ni� 1200 z�.

DELETE pracownicy
	FROM ksiegowosc.pracownicy AS pracownicy
		JOIN ksiegowosc.wynagrodzenie AS wynagrodzenie
			ON  wynagrodzenie.id_pracownika = pracownicy.id_pracownika
		JOIN ksiegowosc.pensja AS pensja
			ON pensja.id_pensji = wynagrodzenie.id_pensji
	WHERE pensja.kwota < 2600

SELECT imie, nazwisko, kwota 
	FROM ksiegowosc.pracownicy AS pracownicy
	    JOIN ksiegowosc.wynagrodzenie AS wynagrodzenie
	ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	    JOIN ksiegowosc.pensja AS pensja
	ON wynagrodzenie.id_pensji = pensja.id_pensji

SELECT * FROM ksiegowosc.wynagrodzenie
