USE master;
GO

IF EXISTS(select * from sys.databases where name='Mozi')
	DROP DATABASE Mozi

SET DATEFORMAT YMD

CREATE DATABASE Mozi;
GO

USE Mozi;
GO

CREATE TABLE Szineszek(
	SzineszID INT IDENTITY,
	VezetekNev VARCHAR(50),
	KeresztNev VARCHAR(50),
	SzulDatum DATE,
	EmailCim VARCHAR(50) DEFAULT 'student@unknown.com',
	CONSTRAINT PK_Szineszek PRIMARY KEY (SzineszID)
)

CREATE TABLE Mufajok(
	MufajID INT IDENTITY,
	MufajNev VARCHAR(100) 
		CONSTRAINT U_MufajNev UNIQUE(MufajNev),
	CONSTRAINT PK_Mufajok PRIMARY KEY (MufajID),
)

CREATE TABLE Studiok(
	StudioID INT IDENTITY,
	StudioNev VARCHAR(50)
		CONSTRAINT U_StudioNev UNIQUE(StudioNev),
	StudioCim VARCHAR(50),
	Bevetel DECIMAL(18,2)
		CONSTRAINT CK_Bevetel CHECK(Bevetel>=0),
	CONSTRAINT PK_Studiok PRIMARY KEY (StudioID)
)

CREATE TABLE Filmek(
	FilmID INT IDENTITY,
	FilmCim VARCHAR(100),
	StudioID INT,
	MufajID INT,
	Csillag INT 
		CONSTRAINT CK_Csillag CHECK(Csillag BETWEEN 1 AND 5),
	MegjEv INT,
	Hossz INT
		CONSTRAINT CK_Hossz CHECK(Hossz > 0),
	Aktiv BIT DEFAULT 1,
	CONSTRAINT PK_Filmek PRIMARY KEY (FilmID),
	CONSTRAINT FK_Filmek_Studiok FOREIGN KEY (StudioID) REFERENCES Studiok(StudioID),
	CONSTRAINT FK_Filmek_Mufajok FOREIGN KEY (MufajID) REFERENCES Mufajok(MufajID)
)

CREATE TABLE Szerepel(
	SzineszID INT,
	FilmID INT,
	CONSTRAINT PK_Szerepel PRIMARY KEY (SzineszID,FilmID),
	CONSTRAINT FK_Szerepel_Szineszek FOREIGN KEY (SzineszID) REFERENCES Szineszek(SzineszID),
	CONSTRAINT FK_Szerepel_Filmek FOREIGN KEY (FilmID) REFERENCES Filmek(FilmID)
)

CREATE TABLE Vetites(
	VetitesID INT IDENTITY,
	FilmID INT,
	VetitesIdopontja DATETIME,
	Terem INT
		CONSTRAINT CK_Terem CHECK(Terem>=1),
	Ar DECIMAL(18,2)
		CONSTRAINT CK_Ar CHECK(Ar>=0), 
	CONSTRAINT PK_Vetites PRIMARY KEY (VetitesID),
	CONSTRAINT FK_Vetites_Filmek FOREIGN KEY (FilmID) REFERENCES Filmek(FilmID)
)

INSERT INTO Szineszek (VezetekNev, KeresztNev, SzulDatum, EmailCim) VALUES 
		('Crowe', 'Russel', '1964-04-07', 'russel@email.com'),
		('Affleck', 'Ben', '1972-08-15', 'ben@testmail.com'),
		('Hathaway', 'Anne', '1982-11-12', 'anne@testmail.com'),
		('Diaz', 'Cameron', '1972-08-30', 'cameron@email.com'),
		('Cruise', 'Tom', '1962-07-03', 'tom@email.com'),
		('Barrymore', 'Drew', '1975-02-22', 'drew@email.com'),
		('Roberts', 'Julia', '1967-10-28', 'julia@email.com')

INSERT INTO Mufajok (MufajNev) VALUES ('sci-fi'), ('drama'), ('crime'),
									  ('romantic comedy'), ('thriller')

INSERT INTO Studiok (StudioNev, StudioCim, Bevetel) VALUES 
		('Paramount Pictures', 'Hollywood, Los Angeles', 80000),
		('Colombia Pictures', 'Hollywood, Los Angeles', 60000),
		('London Film Studio', 'London', 10000),
		('Walt Disney Productions', 'Hollywood, Los Angeles', 770000),
		('Universal Pictures', 'Singapore', 880000)

INSERT INTO Filmek (FilmCim, StudioID, MufajID, Csillag, MegjEv, Hossz, Aktiv) VALUES 
		('Les Miserables', 1, 2, 5, 2012, 158, 1),
		('Gladiator', 5, 2, 4, 2000, 155, 0),
		('Argo', 2, 5, 3, 2012, 120, 0),
		('Vanilla Sky', 1, 1, 4, 2001, 115,0),
		('Gone girl', 5, 5, 3, 2014, 115,0),
		('Ticket to paradise', 5, 4, 3, 2022, 104,1),
		('No time to die', 5, 3, 5, 2021, 163,1),
		('Oblivion', 5, 1, 3, 2013, 100,0)

INSERT INTO Szerepel (SzineszID, FilmID) VALUES (1, 1), (1, 2),
												(2, 3), (4, 4),
												(5, 4), (2, 5),
												(5, 8), (7,6)

INSERT INTO Vetites (FilmID, VetitesIdopontja, Terem, Ar) VALUES 
		(1, '2012-12-12 18:00:00', 3, 10),
		(1, '2018-12-12 18:00:00', 6, 15),
		(1, '2019-12-12 18:00:00', 7, 18),
		(1, '2019-11-12 16:30:00', 3, 14),
		(2, '2019-11-12 18:00:00', 1, 15),
		(4, '2019-11-12 22:15:00', 4, 16),
		(6, '2022-09-16 18:00:00', 2, 21),		
		(6, '2022-09-16 22:00:00', 2, 24),				
		(6, '2022-09-22 20:00:00', 5, 25),	
		(6, '2022-09-22 22:00:00', 2, 25)
