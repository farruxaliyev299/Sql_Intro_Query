CREATE DATABASE Sirket

USE Sirket

CREATE TABLE Vezife(
	Id int primary key identity,
	Ad nvarchar(100)
)

CREATE TABLE Filial(
	Id int primary key identity,
	Ad nvarchar(100)
)

CREATE TABLE Isci(
	Id int primary key identity,
	SAA nvarchar(50),
	VezifeId int REFERENCES Vezife(Id),
	Maas float,
)

CREATE TABLE Mehsul(
	Id int primary key identity,
	Ad nvarchar(100),
	Alis float,
	Satis float
)

CREATE TABLE Satis(
	Id int primary key identity,
	MehsulId int REFERENCES Mehsul(Id),
	IsciId int REFERENCES Isci(Id),
	FilialId int REFERENCES Filial(Id),
	Tarix DATE
)

--DROP TABLE Vezife
--DROP TABLE Filial
--DROP TABLE Isci
--DROP TABLE Mehsul
--DROP TABLE Satis

--Vezifeler
INSERT INTO Vezife 
VALUES('CEO')

INSERT INTO Vezife 
VALUES('Manager')

INSERT INTO Vezife 
VALUES('TeamLead')

INSERT INTO Vezife 
VALUES('Developer')

--Filiallar
INSERT INTO Filial 
VALUES('Filial1')

INSERT INTO Filial 
VALUES('Filial2')

INSERT INTO Filial 
VALUES('Filial3')

--Isciler

INSERT INTO Isci 
VALUES('Ferrux Aliyev',1,4999)

INSERT INTO Isci 
VALUES('Samir Aliyev',2,3099)

INSERT INTO Isci 
VALUES('Emil Haci',3,1560)

INSERT INTO Isci 
VALUES('Ali Vali Pirvali',4,999)

INSERT INTO Isci 
VALUES('Mehemmed Jafar',4,4999)

--Mehsullar
INSERT INTO Mehsul 
VALUES('Monitor',300,500)

INSERT INTO Mehsul 
VALUES('Printer',150,200)

INSERT INTO Mehsul 
VALUES('Klaviatura',100,140)

INSERT INTO Mehsul 
VALUES('Mouse',60,80)

INSERT INTO Mehsul 
VALUES('SesUcaldan',20,29)

--Satis
INSERT INTO Satis 
VALUES(1,2,1,'2021/12/26')

INSERT INTO Satis 
VALUES(2,3,2,'2022/01/02')

INSERT INTO Satis 
VALUES(3,4,3,'2022/02/12')

INSERT INTO Satis 
VALUES(4,5,2,'2022/02/19')

INSERT INTO Satis 
VALUES(1,1,1,'2022/04/03')

INSERT INTO Satis 
VALUES(5,2,1,'2022/04/10')

INSERT INTO Satis 
VALUES(5,3,2,'2022/04/12')

--1
SELECT Isci.SAA 'Isci',Filial.Ad 'Filial',Mehsul.Alis 'Alis',Mehsul.Satis 'Satis' FROM Satis
JOIN Mehsul
ON Mehsul.Id = Satis.MehsulId
JOIN Isci
ON Isci.Id = Satis.IsciId
JOIN Filial
ON Filial.Id = Satis.FilialId

--2
SELECT SUM(Mehsul.Satis) 'UmumiSatis' FROM Satis
JOIN Mehsul
ON Mehsul.Id = Satis.MehsulId

--3
SELECT SUM(Mehsul.Satis) 'CariSatis' FROM Satis
JOIN Mehsul
ON Mehsul.Id = Satis.MehsulId
WHERE MONTH(Satis.Tarix)=4

--4
SELECT Isci.SAA 'Isci',COUNT(Mehsul.Satis) 'SatisSayi' FROM Satis
JOIN Mehsul
ON Mehsul.Id = Satis.MehsulId
JOIN Isci
ON Isci.Id = Satis.IsciId
GROUP BY Isci.SAA

--5
SELECT TOP 1 WITH TIES t.FilAd,MAX(SatisSay) AS SatisSayi FROM 
(
	SELECT Filial.Ad AS FilAd,COUNT(Mehsul.Satis) AS SatisSay FROM Satis
	LEFT JOIN Mehsul
	ON Mehsul.Id = Satis.MehsulId
	LEFT JOIN Filial
	ON Filial.Id = Satis.FilialId
	WHERE DAY(Satis.Tarix) = 12
	GROUP BY Filial.Ad
)t
GROUP BY SatisSay,FilAd 
ORDER BY SatisSay DESC ;

--6
SELECT TOP 1 WITH TIES MehAd,SatisSay AS SatisSay FROM
(
SELECT Mehsul.Ad as MehAd,COUNT(Mehsul.Satis) AS SatisSay FROM Satis
JOIN Mehsul
ON Mehsul.Id = Satis.MehsulId
WHERE MONTH(Satis.Tarix) = 4
GROUP BY Mehsul.Ad
)t
GROUP BY SatisSay,MehAd
ORDER BY SatisSay DESC;