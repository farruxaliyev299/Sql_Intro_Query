CREATE DATABASE Sirket

USE Sirket

CREATE TABLE Isci(
	MKOD NVARCHAR(100),
	SAA NVARCHAR(100),
	VezifeID int,
	MAAS FLOAT,
	FOREIGN KEY (VezifeID) REFERENCES Vezife(ID),
)

CREATE TABLE Vezife(
	ID INT PRIMARY KEY IDENTITY,
	VEZIFE NVARCHAR(100)
)

CREATE TABLE Filial(
	ID INT PRIMARY KEY IDENTITY,
	FILIAL NVARCHAR(100)
)

CREATE TABLE Mehsul(
	ID INT PRIMARY KEY IDENTITY,
	AD NVARCHAR(100),
	ALIS FLOAT,
	SATIS FLOAT
)

CREATE TABLE Satis(
	ID INT PRIMARY KEY IDENTITY,
	MehsulID INT,
	IsciID INT,
	ENDIRIM FLOAT,
	TARIX DATE

	FOREIGN KEY (MehsulID) REFERENCES Mehsul(ID)
)


--Info

SELECT * FROM Isci

SELECT * FROM Vezife

SELECT * FROM Filial

SELECT * FROM Mehsul

SELECT * FROM Satis

--Isciler

INSERT INTO Isci
VALUES('Company1','Ferrux Aliyev',1,2999.76)

INSERT INTO Isci
VALUES('Company1','Samir Aliyev',2,1234.54)

INSERT INTO Isci
VALUES('Company1','Emil Haci',3,452.34)

INSERT INTO Isci
VALUES('Company1','Ali Valiyev',3,35.62)


--Vezife

INSERT INTO Vezife
VALUES('CEO')

INSERT INTO Vezife
VALUES('Senior')

INSERT INTO Vezife
VALUES('Middle')

--Filiallar

INSERT INTO Filial
VALUES('Filial1')

INSERT INTO Filial
VALUES('Filial2')

--Mehsullar

INSERT INTO Mehsul
VALUES('Monitor',350,600)

INSERT INTO Mehsul
VALUES('Printer',200,299)

INSERT INTO Mehsul
VALUES('Klaviatura',20,45)

--Satis

INSERT INTO Satis
VALUES(1,3,10.50,'2021/12/10')

INSERT INTO Satis
VALUES(2,4,1.40,'2022/01/21')

--1)Iscilerin Sayi

SELECT COUNT(SAA) AS IsciSay FROM Isci

--2)Maasa gore siralama

SELECT * FROM Isci
ORDER BY MAAS DESC;

--3)Mehsulu qiymete gore siralama

SELECT * FROM Mehsul
ORDER BY ALIS DESC;

--4)Satis Tarixine gore siralama

SELECT * FROM Satis
ORDER BY TARIX;

--5)Iscilerle Vezifelerini birlesdirmek

--Birlesdirilib


----------- II seviyye --------------------

--1)Qeribe Qurube isler

--2)Satislarin Cemi

SELECT SUM(SATIS) AS SatisCem
FROM Mehsul
INNER JOIN Satis ON Mehsul.ID = Satis.MehsulID;

--Qalanlarindan bir sey bawa dusmedim :(

