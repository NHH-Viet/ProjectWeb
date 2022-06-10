CREATE DATABASE EDEN_RING
GO 
USE EDEN_RING
GO
CREATE TABLE Equipment_Type
(
	ET_ID nvarchar(10) PRIMARY KEY,
	Type_Names nvarchar(50) NOT NULL,
)
GO
CREATE TABLE Equipment_info
(
	E_ID nvarchar(10) PRIMARY KEY,
	E_Name nvarchar(50) NOT NULL,
	Phy_dame smallint NOT NULL,
	Phy_guard smallint,
	Mag_dame smallint,
	Mag_guard smallint,
	Fire_dame smallint,
	Fire_guard smallint,
	Ligh_dame smallint,
	Ligh_guard smallint,
	Holy_dame smallint,
	Holy_guard smallint,
	Critboot smallint,
	Guardboot smallint,
	Weigth float,
	Scl_Str char,
	Scl_Dex char,
	Scl_Int char,
	Scl_Fai char,
	R_Scl_Str smallint,
	R_Scl_Dex smallint,
	R_Scl_Int smallint,
	R_Scl_Fai smallint,
	SKill_Cost nvarchar(20),
	ET_ID nvarchar(10) NOT NULL FOREIGN KEY REFERENCES Equipment_Type(ET_ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
)
GO
ALTER TABLE Equipment_info
ADD Scl_Arc char;
GO
ALTER TABLE Equipment_info
ADD R_Scl_Arc smallint;
GO
ALTER TABLE Equipment_info
ADD CONSTRAINT Min_check CHECK (Weigth>0);
GO
CREATE TABLE Armor_info
(
	A_ID nvarchar(10) PRIMARY KEY,
	A_Name nvarchar(50) NOT NULL,
	Inmunity smallint,
	Robustness smallint,
	Focus smallint,
	Vitality smallint,
	Poise smallint,
	Phy_guard smallint,	
	Phy_slash smallint,
	Phy_strike smallint,
	Phy_thurst smallint,
	Mag_guard smallint,	
	Fie_guard smallint,	
	Holy_guard smallint,	
	Weigth float not null,
	ET_ID nvarchar(10) NOT NULL FOREIGN KEY REFERENCES Equipment_Type(ET_ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
)
GO
ALTER TABLE Armor_info
ALTER COLUMN Phy_guard float;
GO
ALTER TABLE Armor_info
ALTER COLUMN Phy_slash float;
GO
ALTER TABLE Armor_info
ALTER COLUMN Phy_strike float;
GO
ALTER TABLE Armor_info
ALTER COLUMN Phy_thurst float;
GO
ALTER TABLE Armor_info
ALTER COLUMN Holy_guard float;
GO
ALTER TABLE Armor_info
ALTER COLUMN Fie_guard float;
GO
ALTER TABLE Armor_info
ALTER COLUMN Mag_guard float;
GO
ALTER TABLE Armor_info
ADD Light_guard float;
GO
CREATE TABLE Ring
(
	Ring_ID nvarchar(10) PRIMARY KEY,
	Ring_Name nvarchar(50) NOT NULL,
	Weigth float not null,
	Effect nvarchar(100),
)
GO
ALTER TABLE Ring
ADD CONSTRAINT Min_check CHECK (Weigth>0);
GO
CREATE TABLE Classes
(
	Class_ID nvarchar(10) PRIMARY KEY,
	Class_Name nvarchar(50) NOT NULL,
	Vigor smallint NOT NULL,	
	Mind smallint NOT NULL,
	Endurance smallint NOT NULL,
	Strength smallint NOT NULL,
	Dex smallint NOT NULL,
	Intell smallint NOT NULL,
	Fai smallint NOT NULL,
	Levels smallint NOT NULL,
)
GO
ALTER TABLE Classes
ADD Arc smallint NOT NULL;
GO
ALTER TABLE Classes
ADD CONSTRAINT Min_check CHECK (Level>0);
GO
CREATE TABLE Users
(
	User_ID varchar(50) PRIMARY KEY,
	HoTen nvarchar(50) not null,
	DiaChi nvarchar(50) ,
	DoB date not null,
	Password nvarchar(50) not null,
	Token varchar(20) NULL,
	Admin bit DEFAULT '0',
)
GO
CREATE TABLE Classes_build
(
	Build_ID varchar(10) PRIMARY KEY,
	User_ID varchar(50) FOREIGN KEY REFERENCES Users(User_ID) ,
	Class_ID nvarchar(10) NOT NULL FOREIGN KEY REFERENCES Classes(Class_ID),
	Head_ID nvarchar(10) FOREIGN KEY REFERENCES Armor_info(A_ID),
	Chest_ID nvarchar(10)  FOREIGN KEY REFERENCES Armor_info(A_ID),
	Hand_ID nvarchar(10)  FOREIGN KEY REFERENCES Armor_info(A_ID),
	Leg_ID nvarchar(10)  FOREIGN KEY REFERENCES Armor_info(A_ID),
	Left_hand1_ID nvarchar(10)  FOREIGN KEY REFERENCES Equipment_info(E_ID),
	Left_hand2_ID nvarchar(10)  FOREIGN KEY REFERENCES Equipment_info(E_ID),
	Left_hand3_ID nvarchar(10)	FOREIGN KEY REFERENCES Equipment_info(E_ID),
	Right_hand1_ID nvarchar(10) FOREIGN KEY REFERENCES Equipment_info(E_ID),
	Right_hand2_ID nvarchar(10) FOREIGN KEY REFERENCES Equipment_info(E_ID),
	Right_hand3_ID nvarchar(10) FOREIGN KEY REFERENCES Equipment_info(E_ID),
	Ring1_ID nvarchar(10) FOREIGN KEY REFERENCES Ring(Ring_ID) ,
	Ring2_ID nvarchar(10) FOREIGN KEY REFERENCES Ring(Ring_ID) ,
	Ring3_ID nvarchar(10) FOREIGN KEY REFERENCES Ring(Ring_ID) ,
	Ring4_ID nvarchar(10) FOREIGN KEY REFERENCES Ring(Ring_ID) ,
	Levels smallint NOT NULL,
	Vigor smallint NOT NULL,	
	Mind smallint NOT NULL,
	Endurance smallint NOT NULL,
	Strength smallint NOT NULL,
	Dex smallint NOT NULL,
	Intell smallint NOT NULL,
	Fai smallint NOT NULL,	
)
GO

CREATE TABLE Comment
(
	Comment_ID varchar(20) PRIMARY KEY,
	Pages nvarchar NOT null,
	User_ID varchar(50) NOT NULL FOREIGN KEY REFERENCES Users(User_ID) ,
	Texts nvarchar,
	C_Date date,
	Likes int,
)
GO
CREATE TABLE Likes
(
	Like_ID varchar(20) PRIMARY KEY,
	Comment_ID varchar(20) FOREIGN KEY REFERENCES Comment(Comment_ID) ,
)
GO
CREATE TABLE User_Feed
(
	Feed_ID varchar(20) PRIMARY KEY,
	Comment_ID varchar(20) NOT NULL FOREIGN KEY REFERENCES Comment(Comment_ID) ,
	User_ID varchar(50) NOT NULL FOREIGN KEY REFERENCES Users(User_ID) ,
	Feed_Date date ,
)
go
alter table Classes_build
add HienThi bit DEFAULT '0'
GO
CREATE TABLE Stat
(
	Stat_ID int,
	HP int,
	FP int,
	Stamina int,
	Eload float,
	Phy_def float,
	Mag_def float,
	Holy_def float,
	Arc_vita float,
)
GO
INSERT INTO Stat (HP,FP,Stamina,Eload)
VALUES (300,40,80,45.0),
(304,43,81,45.0),
(312,46,82,45.0),
(322,49,84,45.0),
(334,52,85,45.0),
(347,55,87,45.0),
(362,58,88,45.0),
(378,62,92,45.0),
(396,75,94,46.6),
(414,78,96,48.2),
(434,82,97,49.8),
(455,85,99,51.4),
(476,88,101,52.9),
(499,91,103,54.5),
(522,95,105,56.1),
(547,100,106,57.7),
(572,105,108,59.3),
(598,110,110,60.9),
(624,116,111,62.5),
(652,121,113,64.1),
(680,126,115,65.6),
(709,131,116,67.2),
(738,137,118,68.8),
(769,142,120,70.4),
(800,147,121,72.0),
(833,152,123,73.0),
(870,158,125,74.1),
(910,163,126,75.2),
(951,168,128,76.4),
(994,173,130,77.6),
(1037,179,131,78.9),
(1081,184,132,80.2),
(1125,189,133,81.5),
(1170,194,135,82.8),
(1216,200,136,84.1),
(1262,207,137,85.4),
(1308,214,138,86.8),
(1355,221,140,88.1),
(1402,228,141,89.5),
(1450,235,142,90.9),
(1476,242,143,92.3),
(1503,248,145,93.7),
(1529,255,146,95.1),
(1555,262,147,96.5),
(1581,268,148,97.9),
(1606,275,150,99.4),
(1631,281,151,100.8),
(1656,287,152,102.2),
(1680,293,153,103.7),
(1704,300,155,105.2),
(1727,305,155,106.6),
(1750,311,155,108.1),
(1772,317,155,109.6),
(1793,322,156,111.0),
(1814,328,156,112.5),
(1834,333,156,114.0),
(1853,338,157,115.5),
(1871,342,157,117.0),
(1887,346,157,118.5),
(1900,350,158,120.0),
(1906,352,158,121.0),
(1912,355,158,122.1),
(1918,357,158,123.1),
(1924,360,159,124.1),
(1930,362,159,125.1),
(1936,365,159,126.2),
(1942,367,160,127.2),
(1948,370,160,128.2),
(1954,373,160,129.2),
(1959,375,161,130.3),
(1965,378,161,131.3),
(1971,380,161,132.3),
(1977,383,162,133.3),
(1982,385,162,134.4),
(1988,388,162,135.4),
(1993,391,162,136.4),
(1999,393,163,137.4),
(2004,396,163,138.5),
(2010,398,163,139.5),
(2015,401,164,140.5),
(2020,403,164,141.5),
(2026,406,164,142.6),
(2031,408,165,143.6),
(2036,411,165,144.6),
(2041,414,165,145.6),
(2046,416,166,146.7),
(2051,419,166,147.7),
(2056,421,166,148.7),
(2060,424,166,149.7),
(2065,426,167,150.8),
(2070,429,167,151.8),
(2074,432,167,152.8),
(2078,434,168,153.8),
(2082,437,168,154.9),
(2086,439,168,155.9),
(2090,442,169,156.9),
(2094,444,169,157.9),
(2097,447,169,159.0),
(2100,450,170,160.0)

GO
DROP TABLE Stat








