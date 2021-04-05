-- 1. Utworz nowa baze danych nazywajac ja firma.

CREATE DATABASE firma;
USE firma;

-- 2. Dodaj nowy schemat o nazwie rozliczenia.

CREATE SCHEMA rozliczenia;

-- 3. Do schematu rozliczenia dodaj 4 tabele.

CREATE TABLE rozliczenia.pracownicy(
	id_pracownika integer PRIMARY KEY NOT NULL,
	imie varchar(20) NOT NULL,
	nazwisko varchar(30) NOT NULL,
	adres varchar(50) NOT NULL,
	telefon varchar(20)
);

CREATE TABLE rozliczenia.godziny(
	id_godziny integer PRIMARY KEY NOT NULL,
	dataa date NOT NULL,
	liczba_godzin integer NOT NULL,
	id_pracownika integer NOT NULL
);

CREATE TABLE rozliczenia.pensje(
	id_pensji integer PRIMARY KEY NOT NULL, 
	stanowisko varchar(30), 
	kwota integer NOT NULL, 
	id_premii integer NOT NULL
);

CREATE TABLE rozliczenia.premie(
	id_premii integer PRIMARY KEY NOT NULL, 
	rodzaj varchar(20), 
	kwota integer NOT NULL
);

-- 4. Wypelnij kazda tabele 10 rekordami.

INSERT INTO rozliczenia.pracownicy VALUES
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

INSERT INTO rozliczenia.godziny VALUES
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


INSERT INTO rozliczenia.pensje VALUES
	(0, 'piekarz', 2500, 0),
	(1, 'spedytor', 3000, 1),
	(2, 'kucharz', 3000, 2),
	(3, 'kierowca', 3000, 3),
	(4, 'kierowca', 3500, 4),
	(5, 'piekarz', 4000, 5),
	(6, 'kucharz', 4500, 6),
	(7, 'sprzedawca', 3700, 7),
	(8, 'kierownik', 5000, 8),
	(9, NULL, 2500, 9);

INSERT INTO rozliczenia.premie VALUES
	(0, 'motywacyjna', 200),
	(1, 'indywidualna', 400),
	(2, 'indywidualna', 350),
	(3, 'zespolowa', 600),
	(4, 'dlugoterminowa', 250),
	(5, 'indywidualna', 600),
	(6, 'powszechna', 400),
	(7, 'indywidualna', 350),
	(8, NULL, 300),
	(9, 'indywidualna', 400);

-- Dodanie kluczy obcych.

ALTER TABLE rozliczenia.godziny
	ADD FOREIGN KEY (id_pracownika) 
		REFERENCES rozliczenia.pracownicy(id_pracownika);

ALTER TABLE rozliczenia.pensje
	ADD FOREIGN KEY (id_premii) 
		REFERENCES rozliczenia.premie(id_premii);

-- 5. Za pomoca zapytania SQL wyswietl nazwiska pracownikow i ich adresy.

SELECT nazwisko, adres FROM rozliczenia.pracownicy;

-- 6. Napisz zapytanie, ktore przekonwertuje date w tabeli godziny tak, aby wyswietlana byla informacja jaki to dzien tygodnia i jaki miesiac (funkcja DATEPART x2).

SELECT DATEPART(WEEKDAY, dataa) AS 'Dzien', DATEPART(MONTH, dataa) AS 'Miesiac' from rozliczenia.godziny

-- 7. W tabeli pensje zmien nazwe atrybutu kwota na kwota_brutto oraz dodaj nowy o nazwie kwota_netto. Oblicz kwote netto i zaktualizuj wartosci w tabeli.

EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN';
ALTER TABLE rozliczenia.pensje
	ADD kwota_netto integer;
UPDATE rozliczenia.pensje
	SET kwota_netto = 0.81 * kwota_brutto;
SELECT * FROM rozliczenia.pensje;