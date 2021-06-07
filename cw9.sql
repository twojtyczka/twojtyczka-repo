CREATE DATABASE geochronologia;
USE geochronologia;

CREATE TABLE GeoEon(
	id_eon integer PRIMARY KEY NOT NULL,
	nazwa_eon varchar(30) NOT NULL,
);
CREATE TABLE GeoEra(
	id_era integer PRIMARY KEY NOT NULL,
	id_eon integer NOT NULL,
	nazwa_era varchar(30) NOT NULL,
);
CREATE TABLE GeoOkres(
	id_okres integer PRIMARY KEY NOT NULL,
	id_era integer NOT NULL,
	nazwa_okres varchar(30) NOT NULL,
);
CREATE TABLE GeoEpoka(
	id_epoka integer PRIMARY KEY NOT NULL,
	id_okres integer NOT NULL,
	nazwa_epoka varchar(30) NOT NULL,
);
CREATE TABLE GeoPietro(
	id_pietro integer PRIMARY KEY NOT NULL,
	id_epoka integer NOT NULL,
	nazwa_pietro varchar(30) NOT NULL,
);

INSERT INTO GeoEon VALUES
	(0, 'Fanerozoik');

INSERT INTO GeoEra VALUES
	(0, 0, 'Paleozoik'),
	(1, 0, 'Mezozoik'),
	(2, 0, 'Kenozoik');

INSERT INTO GeoOkres VALUES
	(0, 0, 'Dewon'),
	(1, 0, 'Karbon'),
	(2, 0, 'Perm'),
	(3, 1, 'Trias'),
	(4, 1, 'Jura'),
	(5, 1, 'Kreda'),
	(6, 2, 'Paleogen'),
	(7, 2, 'Neogen'),
	(8, 2, 'Czwartorzed');

INSERT INTO GeoEpoka VALUES
	(0, 0, 'Dolny'),
	(1, 0, 'Srodkowy'),
	(2, 0, 'Gorny'),
	(3, 1, 'Dolny'),
	(4, 1, 'Gorny'),
	(5, 2, 'Dolny'),
	(6, 2, 'Srodkowy'),
	(7, 2, 'Gorny'),
	(8, 3, 'Dolny'),
	(9, 3, 'Srodkowy'),
	(10, 3, 'Gorny'),
	(11, 4, 'Dolna'),
	(12, 4, 'Srodkowa'),
	(13, 4, 'Gorna'),
	(14, 5, 'Dolna'),
	(15, 5, 'Gorna'),
	(16, 6, 'Paleocen'),
	(17, 6, 'Eocen'),
	(18, 6, 'Oligocen'),
	(19, 7, 'Miocen'),
	(20, 7, 'Pliocen'),
	(21, 8, 'Plejstocen'),
	(22, 8, 'Holocen');

INSERT INTO GeoPietro VALUES
	(0, 0, 'Lochkow'),
	(1, 0, 'Prag'),
	(2, 0, 'Ems'),
	(3, 1, 'Eifel'),
	(4, 1, 'Zywet'),
	(5, 2, 'Fran'),
	(6, 2, 'Famen'),
	(7, 3, 'Turnej'),
	(8, 3, 'Wizen'),
	(9, 4, 'Serpuchow'),
	(10, 4, 'Baszkir'),
	(11, 4, 'Moskow'),
	(12, 4, 'Kasimow'),
	(13, 4, 'Gzel'),
	(14, 5, 'Assel'),
	(15, 5, 'Sakmar'),
	(16, 5, 'Artinsk'),
	(17, 5, 'Kongul'),
	(18, 6, 'Road'),
	(19, 6, 'Word'),
	(20, 6, 'Kapitan'),
	(21, 7, 'Wucziaping'),
	(22, 7, 'Czangsing'),
	(23, 8, 'Ind'),
	(24, 8, 'Olenek'),
	(25, 9, 'Anizyk'),
	(26, 9, 'Ladyn'),
	(27, 10, 'Karnik'),
	(28, 10, 'Noryk'),
	(29, 10, 'Retyk'),
	(30, 11, 'Hettang'),
	(31, 11, 'Synemur'),
	(32, 11, 'Pliensbach'),
	(33, 11, 'Toark'),
	(34, 12, 'Aalen'),
	(35, 12, 'Bajos'),
	(36, 12, 'Baton'),
	(37, 12, 'Kelowej'),
	(38, 13, 'Oksford'),
	(39, 13, 'Kimeryd'),
	(40, 13, 'Tyton'),
	(41, 14, 'Berrias'),
	(42, 14, 'Walanzyn'),
	(43, 14, 'Hoteryw'),
	(44, 14, 'Barrem'),
	(45, 14, 'Apt'),
	(46, 14, 'Alb'),
	(47, 15, 'Cenoman'),
	(48, 15, 'Turon'),
	(49, 15, 'Koniak'),
	(50, 15, 'Santon'),
	(51, 15, 'Kampan'),
	(52, 15, 'Mastrycht'),
	(53, 16, 'Dan'),
	(54, 16, 'Zeland'),
	(55, 16, 'Tanet'),
	(56, 17, 'Iprez'),
	(57, 17, 'Lutet'),
	(58, 17, 'Barton'),
	(59, 17, 'Priabon'),
	(60, 18, 'Rupel'),
	(61, 18, 'Szat'),
	(62, 19, 'Akwitan'),
	(63, 19, 'Burdygal'),
	(64, 19, 'Lang'),
	(65, 19, 'Serrawal'),
	(66, 19, 'Torton'),
	(67, 19, 'Messyn'),
	(68, 20, 'Zankl'),
	(69, 20, 'Piacent'),
	(70, 21, 'Gelas'),
	(71, 21, 'Kalabr'),
	(72, 21, 'Chiban'),
	(73, 21, 'Pozny'),
	(74, 22, 'Grenland'),
	(75, 22, 'Northgrip'),
	(76, 22, 'Megalaj');
	
ALTER TABLE GeoEra
	ADD FOREIGN KEY (id_eon) 
		REFERENCES GeoEon(id_eon);
	
ALTER TABLE GeoOkres
	ADD FOREIGN KEY (id_era) 
		REFERENCES GeoEra(id_era);

ALTER TABLE GeoEpoka
	ADD FOREIGN KEY (id_okres) 
		REFERENCES GeoOkres(id_okres);

ALTER TABLE GeoPietro
	ADD FOREIGN KEY (id_epoka) 
		REFERENCES GeoEpoka(id_epoka);

CREATE TABLE GeoTabela(
	id_pietro integer PRIMARY KEY NOT NULL,
	nazwa_pietro VARCHAR(30) NOT NULL,
	id_epoka integer NOT NULL,
	nazwa_epoka VARCHAR(30) NOT NULL,
	id_okres integer NOT NULL,
	nazwa_okres VARCHAR(30) NOT NULL,
	id_era integer NOT NULL,
	nazwa_era VARCHAR(30) NOT NULL,
	id_eon integer NOT NULL,
	nazwa_eon varchar(30) NOT NULL
);

INSERT INTO GeoTabela VALUES
	(0, 'Lochkow', 0, 'Dolny', 0, 'Dewon', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(1, 'Prag', 0, 'Dolny', 0, 'Dewon', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(2, 'Ems', 0, 'Dolny', 0, 'Dewon', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(3, 'Eifel', 1, 'Srodkowy', 0, 'Dewon', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(4, 'Zywet', 1, 'Srodkowy', 0, 'Dewon', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(5, 'Fran', 2, 'Gorny', 0, 'Dewon', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(6, 'Famen', 2, 'Gorny', 0, 'Dewon', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(7, 'Turnej', 3, 'Dolny', 1, 'Karbon', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(8, 'Wizen', 3, 'Dolny', 1, 'Karbon', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(9, 'Serpuchow', 4, 'Dolny', 1, 'Karbon', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(10, 'Baszkir', 4, 'Gorny', 1, 'Karbon', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(11, 'Moskow', 4, 'Gorny', 1, 'Karbon', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(12, 'Kasimow', 4, 'Gorny', 1, 'Karbon', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(13, 'Gzel', 4, 'Gorny', 1, 'Karbon', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(14, 'Assel', 5, 'Dolny', 2, 'Perm', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(15, 'Sakmar', 5, 'Dolny', 2, 'Perm', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(16, 'Artinsk', 5, 'Dolny', 2, 'Perm', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(17, 'Kungur', 5, 'Dolny', 2, 'Perm', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(18, 'Road', 6, 'Dolny', 2, 'Perm', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(19, 'Word', 6, 'Dolny', 2, 'Perm', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(20, 'Kapitan', 6, 'Dolny', 2, 'Perm', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(21, 'Wucziaping', 7, 'Gorny', 2, 'Perm', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(22, 'Czangsing', 7, 'Gorny', 2, 'Perm', 0, 'Paleozoik', 0, 'Fanerozoik'),
	(23, 'Ind', 8, 'Dolna', 3, 'Trias', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(24, 'Olenek', 8, 'Dolna', 3, 'Trias', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(25, 'Anizyk', 9, 'Srodkowa', 3, 'Trias', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(26, 'Ladyn', 9, 'Srodkowa', 3, 'Trias', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(27, 'Karnik', 10, 'Gorna', 3, 'Trias', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(28, 'Noryk', 10, 'Gorna', 3, 'Trias', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(29, 'Retyk', 10, 'Gorna', 3, 'Trias', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(30, 'Hettang', 11, 'Dolna', 4, 'Jura', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(31, 'Synemur', 11, 'Dolna', 4, 'Jura', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(32, 'Pliensbach', 11, 'Dolna', 4, 'Jura', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(33, 'Toark', 11, 'Dolna', 4, 'Jura', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(34, 'Aalen', 12, 'Srodkowa', 4, 'Jura', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(35, 'Bajos', 12, 'Srodkowa', 4, 'Jura', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(36, 'Baton', 12, 'Srodkowa', 4, 'Jura', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(37, 'Kelowej', 12, 'Srodkowa', 4, 'Jura', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(38, 'Oksford', 13, 'Gorna', 4, 'Jura', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(39, 'Kimeryd', 13, 'Gorna', 4, 'Jura', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(40, 'Tyton', 13, 'Gorna', 4, 'Jura', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(41, 'Berrias', 14, 'Dolna', 5, 'Kreda', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(42, 'Walanzyn', 14, 'Dolna', 5, 'Kreda', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(43, 'Hoteryw', 14, 'Dolna', 5, 'Kreda', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(44, 'Barrem', 14, 'Dolna', 5, 'Kreda', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(45, 'Apt', 14, 'Dolna', 5, 'Kreda', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(46, 'Alb', 14, 'Dolna', 5, 'Kreda', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(47, 'Cenoman', 15, 'Gorna', 5, 'Kreda', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(48, 'Turon', 15, 'Gorna', 5, 'Kreda', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(49, 'Koniak', 15, 'Gorna', 5, 'Kreda', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(50, 'Santon', 15, 'Gorna', 5, 'Kreda', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(51, 'Kampan', 15, 'Gorna', 5, 'Kreda', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(52, 'Mastrycht', 15, 'Gorna', 5, 'Kreda', 1, 'Mezozoik', 0, 'Fanerozoik'),
	(53, 'Dan', 16, 'Paleocen', 6, 'Paleogen', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(54, 'Zeland', 16, 'Paleocen', 6, 'Paleogen', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(55, 'Tanet', 16, 'Paleocen', 6, 'Paleogen', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(56, 'Iprez', 17, 'Eocen', 6, 'Paleogen', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(57, 'Lutet', 17, 'Eocen', 6, 'Paleogen', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(58, 'Barton', 17, 'Eocen', 6, 'Paleogen', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(59, 'Priabon', 17, 'Eocen', 6, 'Paleogen', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(60, 'Rupel', 18, 'Oligocen', 6, 'Paleogen', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(61, 'Szat', 18, 'Oligocen', 6, 'Paleogen', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(62, 'Akwitan', 19, 'Miocen', 7, 'Neogen', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(63, 'Burdygal', 19, 'Miocen', 7, 'Neogen', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(64, 'Lang', 19, 'Miocen', 7, 'Neogen', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(65, 'Serrawal', 19, 'Miocen', 7, 'Neogen', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(66, 'Torton', 19, 'Miocen', 7, 'Neogen', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(67, 'Messyn', 19, 'Miocen', 7, 'Neogen', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(68, 'Zankl', 20, 'Pliocen', 7, 'Neogen', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(69, 'Piacent', 20, 'Pliocen', 7, 'Neogen', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(70, 'Gelas', 21, 'Plejstocen', 8, 'Czwartorzed', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(71, 'Kalabr', 21, 'Plejstocen', 8, 'Czwartorzed', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(72, 'Chiban', 21, 'Plejstocen', 8, 'Czwartorzed', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(73, 'Pozny', 21, 'Plejstocen', 8, 'Czwartorzed', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(74, 'Grenland', 22, 'Holocen', 8, 'Czwartorzed', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(75, 'Northgrip', 22, 'Holocen', 8, 'Czwartorzed', 2, 'Kenozoik', 0, 'Fanerozoik'),
	(76, 'Megalaj', 22, 'Holocen', 8, 'Czwartorzed', 2, 'Kenozoik', 0, 'Fanerozoik');
	
CREATE TABLE Dziesiec(cyfra int, bit int);

INSERT INTO Dziesiec VALUES 
	(0,0),
	(1,1),
	(2,1),
	(3,0),
	(4,1),
	(5,0),
	(6,1),
	(7,0),
	(8,0),
	(9,1);

CREATE TABLE Milion(liczba int,cyfra int, bit int);

INSERT INTO Milion SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra + 10000*a5.cyfra + 100000*a6.cyfra AS liczba , a1.cyfra AS cyfra, a1.bit AS bit 
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec a6;

SELECT COUNT(*) FROM Milion INNER JOIN GeoTabela ON 
(Milion.liczba % 68 = (GeoTabela.id_pietro));

SELECT COUNT(*) FROM Milion INNER JOIN GeoPietro ON 
(Milion.liczba % 68 = GeoPietro.id_pietro) JOIN GeoEpoka ON GeoPietro.id_epoka = GeoEpoka.id_epoka 
JOIN GeoOkres ON GeoEpoka.id_okres = GeoOkres.id_okres JOIN GeoEra ON GeoOkres.id_era = GeoEra.id_era
JOIN GeoEon ON GeoEra.id_eon = GeoEon.id_eon;
	
SELECT COUNT(*) FROM Milion WHERE Milion.liczba % 68 = 
(SELECT id_pietro FROM GeoTabela WHERE Milion.liczba % 68 = id_pietro);	
	
SELECT COUNT(*) FROM Milion WHERE Milion.liczba % 68 =
(SELECT id_pietro FROM GeoPietro JOIN GeoEpoka ON GeoPietro.id_epoka = GeoEpoka.id_epoka 
JOIN GeoOkres ON GeoEpoka.id_okres = GeoOkres.id_okres JOIN GeoEra ON GeoOkres.id_era = GeoEra.id_era 
JOIN GeoEon ON GeoEra.id_eon = GeoEon.id_eon);

CREATE NONCLUSTERED INDEX ix_id_epoka ON GeoPietro(id_epoka)
CREATE NONCLUSTERED INDEX ix_nazwa_pietro ON GeoPietro(nazwa_pietro)
CREATE NONCLUSTERED INDEX ix_id_okres ON GeoEpoka(id_okres)
CREATE NONCLUSTERED INDEX ix_nazwa_epoka ON GeoEpoka(nazwa_epoka)
CREATE NONCLUSTERED INDEX ix_id_era ON GeoOkres(id_era)
CREATE NONCLUSTERED INDEX ix_nazwa_okres ON GeoOkres(nazwa_okres)
CREATE NONCLUSTERED INDEX ix_id_eon ON GeoEra(id_eon)
CREATE NONCLUSTERED INDEX ix_nazwa_era ON GeoEra(nazwa_era)
CREATE NONCLUSTERED INDEX ix_nazwa_eon ON GeoEon(nazwa_eon)

CREATE NONCLUSTERED INDEX ix_geotabela0 ON GeoTabela(nazwa_pietro)
CREATE NONCLUSTERED INDEX ix_geotabela1 ON GeoTabela(id_epoka)
CREATE NONCLUSTERED INDEX ix_geotabela2 ON GeoTabela(nazwa_epoka)
CREATE NONCLUSTERED INDEX ix_geotabela3 ON GeoTabela(id_okres)
CREATE NONCLUSTERED INDEX ix_geotabela4 ON GeoTabela(nazwa_okres)
CREATE NONCLUSTERED INDEX ix_geotabela5 ON GeoTabela(id_era)
CREATE NONCLUSTERED INDEX ix_geotabela6 ON GeoTabela(nazwa_era)
CREATE NONCLUSTERED INDEX ix_geotabela7 ON GeoTabela(id_eon)
CREATE NONCLUSTERED INDEX ix_geotabela8 ON GeoTabela(nazwa_eon)

CREATE NONCLUSTERED INDEX ix_milion ON Milion(liczba)