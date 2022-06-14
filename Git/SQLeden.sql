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
	Scl_Arc char,
	R_Scl_Str smallint,
	R_Scl_Dex smallint,
	R_Scl_Int smallint,
	R_Scl_Fai smallint,
	R_Scl_Arc smallint,
	SKill_Cost nvarchar(20),
	SNames nvarchar(20),
	ET_ID nvarchar(10) NOT NULL FOREIGN KEY REFERENCES Equipment_Type(ET_ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
)

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
	Phy_guard float,	
	Phy_slash float,
	Phy_strike float,
	Phy_thurst float,
	Mag_guard float,	
	Fie_guard float,	
	Holy_guard float,	
	Light_guard float,
	Weigth float not null,
	ET_ID nvarchar(10) NOT NULL FOREIGN KEY REFERENCES Equipment_Type(ET_ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
)

GO
CREATE TABLE Ring
(
	Ring_ID nvarchar(10) PRIMARY KEY,
	Ring_Name nvarchar(50) NOT NULL,
	Weigth float not null,
	Effect nvarchar(100),
)
GO
INSERT INTO Ring
VALUES (0,'Place holder',1,'TEST TEST TEST')
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
	Arc smallint NOT NULL,
	Levels smallint NOT NULL,
)

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
	Stat_ID int PRIMARY KEY,
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
INSERT INTO Stat (Stat_ID,HP,FP,Stamina,Eload)
VALUES (1,300,40,80,45.0),
(2,304,43,81,45.0),
(3,312,46,82,45.0),
(4,322,49,84,45.0),
(5,334,52,85,45.0),
(6,347,55,87,45.0),
(7,362,58,88,45.0),
(8,378,62,92,45.0),
(9,396,75,94,46.6),
(10,414,78,96,48.2),
(11,434,82,97,49.8),
(12,455,85,99,51.4),
(13,476,88,101,52.9),
(14,499,91,103,54.5),
(15,522,95,105,56.1),
(16,547,100,106,57.7),
(17,572,105,108,59.3),
(18,598,110,110,60.9),
(19,624,116,111,62.5),
(20,652,121,113,64.1),
(21,680,126,115,65.6),
(22,709,131,116,67.2),
(23,738,137,118,68.8),
(24,769,142,120,70.4),
(25,800,147,121,72.0),
(26,833,152,123,73.0),
(27,870,158,125,74.1),
(28,910,163,126,75.2),
(29,951,168,128,76.4),
(30,994,173,130,77.6),
(31,1037,179,131,78.9),
(32,1081,184,132,80.2),
(33,1125,189,133,81.5),
(34,1170,194,135,82.8),
(35,1216,200,136,84.1),
(36,1262,207,137,85.4),
(37,1308,214,138,86.8),
(38,1355,221,140,88.1),
(39,1402,228,141,89.5),
(40,1450,235,142,90.9),
(41,1476,242,143,92.3),
(42,1503,248,145,93.7),
(43,1529,255,146,95.1),
(44,1555,262,147,96.5),
(45,1581,268,148,97.9),
(46,1606,275,150,99.4),
(47,1631,281,151,100.8),
(48,1656,287,152,102.2),
(49,1680,293,153,103.7),
(50,1704,300,155,105.2),
(51,1727,305,155,106.6),
(52,1750,311,155,108.1),
(53,1772,317,155,109.6),
(54,1793,322,156,111.0),
(55,1814,328,156,112.5),
(56,1834,333,156,114.0),
(57,1853,338,157,115.5),
(58,1871,342,157,117.0),
(59,1887,346,157,118.5),
(60,1900,350,158,120.0),
(61,1906,352,158,121.0),
(62,1912,355,158,122.1),
(63,1918,357,158,123.1),
(64,1924,360,159,124.1),
(65,1930,362,159,125.1),
(66,1936,365,159,126.2),
(67,1942,367,160,127.2),
(68,1948,370,160,128.2),
(69,1954,373,160,129.2),
(70,1959,375,161,130.3),
(71,1965,378,161,131.3),
(72,1971,380,161,132.3),
(73,1977,383,162,133.3),
(74,1982,385,162,134.4),
(75,1988,388,162,135.4),
(76,1993,391,162,136.4),
(77,1999,393,163,137.4),
(78,2004,396,163,138.5),
(79,2010,398,163,139.5),
(80,2015,401,164,140.5),
(81,2020,403,164,141.5),
(82,2026,406,164,142.6),
(83,2031,408,165,143.6),
(84,2036,411,165,144.6),
(85,2041,414,165,145.6),
(86,2046,416,166,146.7),
(87,2051,419,166,147.7),
(88,2056,421,166,148.7),
(89,2060,424,166,149.7),
(90,2065,426,167,150.8),
(91,2070,429,167,151.8),
(92,2074,432,167,152.8),
(93,2078,434,168,153.8),
(94,2082,437,168,154.9),
(95,2086,439,168,155.9),
(96,2090,442,169,156.9),
(97,2094,444,169,157.9),
(98,2097,447,169,159.0),
(99,2100,450,170,160.0)
GO
INSERT INTO Equipment_Type
VALUES ('W-Dag','Dagger'),
('W-StrS','Straight Swords'),
('W-GrS','Greatswords'),
('W-ColS','Colossal Swords '),
('W-ThrS','Thrusting Swords'),
('W-HThrS','Heavy Thrusting Swords'),
('W-CurS','Curved Swords'),
('W-CurGS','Curved Greatswords'),
('W-Kata','Katanas'),
('W-TwB','Twinblades'),
('W-Axe','Axes'),
('W-GAxe','Greataxes'),
('W-Ham','Hammers'),
('W-Flai','Flails'),
('W-GHam','Great Hammers'),
('W-ColW','Colossal Weapons'),
('W-Spr','Spears'),
('W-Gspr','Great Spears'),
('W-Hal','Halberds'),
('W-Reap','Reapers'),
('W-Whip','Whips'),
('W-Fist','Fists'),
('W-Claw','Claws'),
('W-LBow','Light Bows'),
('W-Bow','Bows'),
('W-GBow','Greatbows'),
('W-CrBow','Crossbows'),
('W-Bali','Ballistae'),
('W-Glin','Glintstone Staffs'),
('W-SSeal','Sacred Seals'),
('W-Torc','Torches'),
('A-Hel','Helms'),
('A-Che','Chest'),
('A-Gau','Gauntlets'),
('A-Leg','Legs')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SNames,SKill_Cost,ET_ID)
VALUES ('Dag-1', 'Black Knife',66,26 ,0,15 ,0,15 ,0,15 ,65,42 ,110,15 ,8,'E' ,12,'D' ,0,0 ,18,'D' ,0,0 ,2.0,  25,'Blade of Death', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SNames,SKill_Cost,ET_ID)
VALUES ('Dag-2', 'Blade of Calling',71,31 ,0,18 ,0,18 ,0,18 ,43,30 ,110,15 ,6,'D' ,13,'D' ,0,0 ,15,'C' ,0,0 ,1.5,  20,'Blade of Gold', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SNames,SKill_Cost,ET_ID)
VALUES ('Dag-3', 'Bloodstained Dagger',81,36 ,0,21 ,0,21 ,0,21 ,0,21 ,110,15 ,9,'C' ,12,'E' ,0,0 ,0,0 ,0,0 ,2.0,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SNames,SKill_Cost,ET_ID)
VALUES ('Dag-4', 'Celebrants Sickle',79,35 ,0,20 ,0,20 ,0,20 ,0,20 ,100,15 ,6,'E' ,11,'C' ,0,0 ,0,0 ,0,0 ,1.5,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SNames,SKill_Cost,ET_ID)
VALUES ('Dag-5', 'Cinquedea',98,43 ,0,25 ,0,25 ,0,25 ,0,25 ,100,18 ,10,'D' ,10,'E' ,0,0 ,0,0 ,0,0 ,3.5,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SNames,SKill_Cost,ET_ID)
VALUES ('Dag-6', 'Crystal Knife',82,32 ,53,31 ,0,18 ,0,18 ,0,18 ,100,15 ,8,'D' ,12,'D' ,9,'D' ,0,0 ,0,0 ,2.0,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SNames,SKill_Cost,ET_ID)
VALUES ('Dag-7', 'Dagger',74,35 ,0,20 ,0,20 ,0,20 ,0,20 ,130,15 ,5,'D' ,9,'C' ,0,0 ,0,0 ,0,0 ,1.5,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SNames,SKill_Cost,ET_ID)
VALUES ('Dag-8', 'Erdsteel Dagger',67,36 ,0,21 ,0,21 ,0,21 ,0,21 ,110,15 ,7,'D' ,12,'D' ,0,0 ,14,'D' ,0,0 ,2.0,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SNames,SKill_Cost,ET_ID)
VALUES ('Dag-9', 'Glintstone Kris',57,23 ,68,45 ,0,14 ,0,14 ,0,14 ,110,15 ,5,'E' ,12,'D' ,16,'D' ,0,0 ,0,0 ,1.5,  10 ,'Glintstone Dart', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SNames,SKill_Cost,ET_ID)
VALUES ('Dag-10', 'Great Knife',75,35 ,0,20 ,0,20 ,0,20 ,0,20 ,110,15 ,6,'E' ,12,'C' ,0,0 ,0,0 ,0,0 ,1.5,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SNames,SKill_Cost,ET_ID)
VALUES ('Dag-11', 'Ivory Sickle',60,26 ,60,42 ,0,15 ,0,15 ,0,15 ,100,15 ,6,'E' ,11,'D' ,13,'D' ,0,0 ,0,0 ,2.0,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SNames,SKill_Cost,ET_ID)
VALUES ('Dag-12', 'Misericorde',92,36 ,0,21 ,0,21 ,0,21 ,0,21 ,140,15 ,7,'E' ,12,'D' ,0,0 ,0,0 ,0,0 ,2.0,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SNames,SKill_Cost,ET_ID)
VALUES ('Dag-13', 'Parrying Dagger',75,35 ,0,20 ,0,20 ,0,20 ,0,20 ,110,15 ,5,'E' ,14,'C' ,0,0 ,0,0 ,0,0 ,1.5,  0,'Parry', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SNames,SKill_Cost,ET_ID)
VALUES ('Dag-14', 'Reduvia',79,38 ,0,22 ,0,22 ,0,22 ,0,22 ,110,16 ,5,'E' ,13,'D' ,0,0 ,0,0 ,13,'D' ,2.5,  4,'Blood Blade', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SNames,SKill_Cost,ET_ID)
VALUES ('Dag-15', 'Scorpions Stinger',79,38 ,0,22 ,0,22 ,0,22 ,0,22 ,110,16 ,6,'D' ,12,'C' ,0,0 ,0,0 ,0,0 ,2.5,  7,'Repeating Thrust', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SNames,SKill_Cost,ET_ID)
VALUES ('Dag-16', 'Wakizashi',94,42 ,0,24 ,0,24 ,0,24 ,0,24 ,100,18 ,9,'D' ,13,'D' ,0,0 ,0,0 ,0,0 ,3.0,  3,'Quickstep', 'W-Dag')
GO
Insert into Armor_info(A_ID,A_Name,Phy_guard,Phy_strike,Phy_slash,Phy_thurst,Mag_guard,Fie_guard,Light_guard,Holy_guard,Inmunity,Robustness,Focus,Vitality,Poise,Weigth,ET_ID)
VALUES
('Che-1', 'All-Knowing Greaves',7.4 ,6.8 ,7.7 ,6.8 ,7.1 ,5.4 ,5.8 ,5.4 ,17 ,29 ,13 ,13 ,10 ,6.6 , 'A-Che'),
 ('Che-2', 'Alberichs Trousers',3 ,2.3 ,3 ,3 ,7.3 ,6.8 ,7.2 ,7.3 ,26 ,14 ,41 ,44 ,1 ,2.5 , 'A-Che'),
 ('Che-3', 'Astrologer Trousers',3.8 ,3.4 ,3.4 ,3.4 ,7.7 ,7.4 ,7.6 ,7.4 ,31 ,15 ,56 ,47 ,3 ,3.9 , 'A-Che'),
 ('Che-4', 'Bandit Boots',4.0 ,4.5 ,5.0 ,5.4 ,5.4 ,5.4 ,5.8 ,5.0 ,34 ,20 ,35 ,35 ,2 ,4.4 , 'A-Che'),
 ('Che-5', 'Banished Knight Greaves',10.8 ,8.6 ,11.1 ,10.1 ,7.7 ,7.7 ,7.4 ,7.6 ,37 ,51 ,24 ,26 ,17 ,10.8 , 'A-Che'),
 ('Che-6', 'Beast Champion Greaves',10.1 ,9.4 ,10.8 ,10.6 ,7.4 ,7.9 ,7.3 ,7.7 ,35 ,56 ,26 ,24 ,17 ,10.8 , 'A-Che'),
 ('Che-7', 'Black Knife Greaves',6.5 ,6.2 ,7.1 ,7.1 ,5 ,5.4 ,3.8 ,6.5 ,17 ,29 ,14 ,14 ,8 ,5.7 , 'A-Che'),
 ('Che-8', 'Blackflame Monk Greaves',7.7 ,6.5 ,8.4 ,7.4 ,5.8 ,7.4 ,4.5 ,5.8 ,20 ,34 ,13 ,20 ,11 ,7.3 , 'A-Che'),
 ('Che-9', 'Bloodhound Knight Greaves',7.1 ,6.5 ,8.0 ,7.7 ,5.4 ,5.8 ,4.0 ,5.8 ,20 ,31 ,14 ,14 ,8 ,6.6 , 'A-Che'),
 ('Che-10', 'Briar Greaves',7.4 ,6.5 ,7.7 ,7.2 ,6.2 ,7.1 ,7.1 ,6.2 ,22 ,44 ,15 ,15 ,9 ,7.3 , 'A-Che'),
 ('Che-11', 'Bull-Goat Greaves',11.9 ,11.8 ,10.6 ,10.6 ,7.6 ,7.7 ,8.5 ,7.3 ,44 ,51 ,29 ,34 ,28 ,16.4 , 'A-Che'),
 ('Che-12', 'Champion Gaiters',3.8 ,5 ,4 ,4.5 ,4.5 ,5.4 ,5.8 ,5.4 ,31 ,20 ,26 ,24 ,3 ,3.9 , 'A-Che'),
 ('Che-13', 'Carian Knight Greaves',6.8 ,6.2 ,7.1 ,6.8 ,7.1 ,6.8 ,5.4 ,6.8 ,17 ,29 ,13 ,14 ,7 ,6.6 , 'A-Che'),
 ('Che-14', 'Chain Leggings',6.8 ,5 ,7.4 ,6.8 ,4 ,6.2 ,3.4 ,4.5 ,16 ,26 ,7 ,11 ,7 ,5.5 , 'A-Che'),
 ('Che-15', 'Cleanrot Greaves',8.4 ,7.6 ,9.2 ,10.1 ,7.2 ,7.3 ,6.5 ,7.7 ,39 ,41 ,17 ,20 ,13 ,9.3 , 'A-Che'),
 ('Che-16', 'Cloth Trousers',3 ,2.3 ,1.5 ,2.3 ,7.3 ,7.1 ,6.8 ,7.1 ,26 ,14 ,37 ,37 ,1 ,2 , 'A-Che'),
 ('Che-17', 'Commoners Shoes',1.5 ,3 ,3 ,2.3 ,7.1 ,6.5 ,6.8 ,7.1 ,22 ,14 ,39 ,41 ,1 ,2 , 'A-Che'),
 ('Che-18', 'Confessor Boots',4.5 ,5.8 ,4.5 ,5 ,6.2 ,6.2 ,6.8 ,5.4 ,37 ,29 ,29 ,31 ,3 ,4.8 , 'A-Che'),
 ('Che-19', 'Consorts Trousers',3.0 ,2.3 ,2.3 ,3.0 ,7.4 ,7.1 ,7.1 ,7.3 ,29 ,15 ,41 ,39 ,1 ,2.5 , 'A-Che'),
 ('Che-20', 'Crucible Greaves',10.1 ,8 ,9.6 ,9.6 ,7.4 ,7.3 ,6.5 ,7.7 ,31 ,44 ,22 ,16 ,14 ,9.6 , 'A-Che'),
 ('Che-21', 'Eccentrics Breeches',6.5 ,4.5 ,6.2 ,6.5 ,4.5 ,5.0 ,3.0 ,4.0 ,15 ,31 ,7 ,7 ,6 ,5.1 , 'A-Che'),
 ('Che-22', 'Elden Lord Greaves',6.5 ,5.8 ,6.2 ,6.8 ,4.5 ,6.2 ,3.8 ,4 ,16 ,31 ,7 ,11 ,7 ,5.5 , 'A-Che'),
 ('Che-23', 'Errant Sorcerer Boots',3 ,3 ,3.8 ,3 ,7.6 ,7.3 ,7.2 ,7.6 ,24 ,15 ,47 ,51 ,1 ,3.1 , 'A-Che'),
 ('Che-24', 'Exile Greaves',7.1 ,5.4 ,7.4 ,7.1 ,4.5 ,6.2 ,3.8 ,5.4 ,17 ,34 ,13 ,11 ,8 ,5.7 , 'A-Che'),
 ('Che-25', 'Finger Maiden Shoes',3 ,2.3 ,2.3 ,1.5 ,7.6 ,7.2 ,7.3 ,7.6 ,24 ,13 ,39 ,39 ,1 ,2.5 , 'A-Che'),
 ('Che-26', 'Fire Monk Greaves',8 ,7.1 ,7.7 ,7.1 ,6.2 ,7.6 ,5.4 ,5.4 ,20 ,34 ,15 ,15 ,10 ,7.3 , 'A-Che'),
 ('Che-27', 'Foot Soldier Greaves',5.4 ,5.8 ,5.4 ,5.4 ,6.2 ,6.5 ,6.8 ,6.2 ,39 ,26 ,34 ,34 ,4 ,5.1 , 'A-Che'),
 ('Che-28', 'Fur Leggings',3.4 ,3.8 ,3.4 ,3.4 ,3.8 ,4 ,5 ,4 ,39 ,26 ,34 ,24 ,1 ,3.1 , 'A-Che'),
 ('Che-29', 'Gelmir Knight Greaves',7.7 ,6.5 ,8.0 ,7.7 ,6.2 ,7.1 ,5.8 ,6.2 ,22 ,34 ,15 ,14 ,11 ,7.3 , 'A-Che'),
 ('Che-30', 'Godrick Knight Greaves',7.7 ,6.8 ,8 ,7.4 ,6.2 ,6.8 ,5.4 ,6.2 ,22 ,35 ,15 ,15 ,11 ,7.3 , 'A-Che'),
 ('Che-31', 'Godskin Apostle Trousers',3.4 ,3.0 ,3.0 ,1.5 ,7.2 ,6.8 ,7.1 ,7.9 ,26 ,13 ,41 ,39 ,1 ,2.5 , 'A-Che'),
 ('Che-32', 'Guardian Greaves',6.2 ,5.8 ,5.8 ,5.4 ,6.8 ,6.5 ,6.8 ,6.8 ,47 ,31 ,37 ,35 ,3 ,5.5 , 'A-Che'),
 ('Che-33', 'Haligtree Greaves',7.4 ,6.8 ,7.1 ,7.4 ,5.4 ,5.8 ,4.5 ,5.8 ,20 ,34 ,14 ,15 ,9 ,6.6 , 'A-Che'),
 ('Che-34', 'Hoslows Greaves',8 ,6.8 ,7.7 ,7.1 ,6.2 ,6.8 ,5.8 ,5.8 ,24 ,37 ,15 ,15 ,10 ,7.3 , 'A-Che'),
 ('Che-35', 'Kaiden Trousers',6.5 ,4.6 ,6.5 ,6.5 ,4.0 ,4.5 ,3.8 ,4.0 ,15 ,26 ,7 ,7 ,7 ,5.1 , 'A-Che'),
 ('Che-36', 'Knight Greaves',7.1 ,6.8 ,7.7 ,7.7 ,6.2 ,6.2 ,5.4 ,5 ,17 ,31 ,11 ,11 ,11 ,6.6 , 'A-Che'),
 ('Che-37', 'Land of Reeds Greaves',5 ,5.4 ,6.8 ,5.4 ,5.8 ,6.5 ,6.8 ,6.2 ,37 ,31 ,31 ,34 ,4 ,5.1 , 'A-Che'),
 ('Che-38', 'Leather Trousers',6.5 ,5.4 ,6.8 ,6.8 ,5 ,5.4 ,3.4 ,4.5 ,16 ,29 ,11 ,7 ,8 ,5.5 , 'A-Che'),
 ('Che-39', 'Lionels Greaves',10.1 ,9.4 ,11.1 ,11.4 ,7.7 ,8.5 ,7.4 ,7.7 ,39 ,61 ,26 ,31 ,22 ,13.1 , 'A-Che'),
 ('Che-40', 'Malformed Dragon Greaves',9.6 ,8.6 ,10.1 ,9.6 ,7.4 ,7.4 ,7.9 ,7.4 ,35 ,47 ,24 ,24 ,16 ,9.9 , 'A-Che'),
 ('Che-41', 'Malikeths Greaves',7.7 ,6.8 ,8 ,7.7 ,6.2 ,6.5 ,5.4 ,7.3 ,22 ,35 ,15 ,31 ,11 ,7.9 , 'A-Che'),
 ('Che-42', 'Millicents Boots',2.3 ,2.3 ,2.3 ,1.5 ,7.2 ,6.8 ,7.1 ,7.2 ,24 ,13 ,0 ,39 ,0 ,2 , 'A-Che'),
 ('Che-43', 'Mushroom Legs',3.4 ,4.0 ,1.5 ,3.0 ,7.6 ,3.0 ,7.4 ,7.4 ,63 ,15 ,56 ,47 ,1 ,3.1 , 'A-Che'),
 ('Che-44', 'Nobles Trousers',3.4 ,3.8 ,3.4 ,3.8 ,7.6 ,7.7 ,7.4 ,7.6 ,29 ,15 ,47 ,51 ,1 ,3.9 , 'A-Che'),
 ('Che-45', 'Omenkiller Boots',5.0 ,4.5 ,4.0 ,4.0 ,4.0 ,5.4 ,6.5 ,5.8 ,41 ,17 ,29 ,29 ,4 ,4.4 , 'A-Che'),
 ('Che-46', 'Queens Leggings',2.3 ,1.5 ,1.5 ,0.3 ,7.6 ,6.8 ,7.1 ,7.3 ,22 ,14 ,37 ,41 ,1 ,2 , 'A-Che'),
 ('Che-47', 'Page Trousers',3.4 ,3 ,2.3 ,2.3 ,7.2 ,7.1 ,7.3 ,7.3 ,24 ,13 ,44 ,44 ,1 ,2.5 , 'A-Che'),
 ('Che-48', 'Preceptors Trousers',3.4 ,3.8 ,3.4 ,3.4 ,8.3 ,7.6 ,7.3 ,7.3 ,31 ,15 ,51 ,47 ,2 ,3.9 , 'A-Che'),
 ('Che-49', 'Prisoner Trousers',2.3 ,3 ,3 ,2.3 ,6.8 ,6.5 ,6.5 ,7.2 ,26 ,14 ,39 ,39 ,1 ,2 , 'A-Che'),
 ('Che-50', 'Prophet Trousers',3 ,3.4 ,3.4 ,3 ,7.6 ,7.3 ,7.2 ,7.6 ,26 ,14 ,47 ,51 ,1 ,3.1 , 'A-Che'),
 ('Che-51', 'Radahns Greaves',10.8 ,8.6 ,10.6 ,10.1 ,7.7 ,8.1 ,7.2 ,7.7 ,37 ,61 ,26 ,24 ,17 ,10.8 , 'A-Che'),
 ('Che-52', 'Radahn Soldier Greaves',7.7 ,6.2 ,7.1 ,6.8 ,5.8 ,6.5 ,4.5 ,5.4 ,20 ,31 ,14 ,15 ,10 ,6.6 , 'A-Che'),
 ('Che-53', 'Raging Wolf Greaves',7.5 ,6.6 ,7.5 ,7.2 ,5.6 ,6.3 ,3.8 ,5.2 ,19 ,34 ,11 ,11 ,9 ,6.3 , 'A-Che'),
 ('Che-54', 'Raya Lucarian Greaves',7.4 ,6.2 ,7.7 ,7.4 ,6.2 ,6.2 ,4 ,5 ,20 ,34 ,14 ,14 ,10 ,6.6 , 'A-Che'),
 ('Che-55', 'Rotten Duelist Greaves',7.4 ,6.2 ,7.7 ,7.1 ,6.2 ,6.5 ,5.8 ,6.2 ,35 ,35 ,15 ,15 ,10 ,7.3 , 'A-Che'),
 ('Che-56', 'Sage Trousers',3.4 ,3 ,3 ,1.5 ,7.6 ,7.1 ,7.3 ,7.6 ,22 ,13 ,39 ,41 ,1 ,2.5 , 'A-Che'),
 ('Che-57', 'Sanguine Noble Waistcloth',3 ,2.3 ,2.3 ,2.3 ,7.4 ,6.5 ,7.3 ,7.6 ,29 ,11 ,44 ,41 ,1 ,2.5 , 'A-Che'),
 ('Che-58', 'Scaled Greaves',9.2 ,8.0 ,9.6 ,9.2 ,7.7 ,8.1 ,7.4 ,7.7 ,35 ,51 ,24 ,24 ,16 ,9.9 , 'A-Che'),
 ('Che-59', 'Snow Witch Skirt',3 ,3.4 ,3.4 ,2.3 ,7.4 ,7.4 ,7.3 ,7.4 ,24 ,20 ,44 ,44 ,1 ,3.1 , 'A-Che'),
 ('Che-60', 'Sorcerer Leggings',1.7 ,1.1 ,2.1 ,1.4 ,4.2 ,6.4 ,2.8 ,5.6 ,15 ,25 ,25 ,0 ,0 ,2 , 'A-Che'),
 ('Che-61', 'Travelers Slops',3.0 ,3.0 ,2.3 ,1.5 ,7.3 ,7.3 ,7.1 ,7.3 ,34 ,13 ,41 ,39 ,1 ,2.5 , 'A-Che'),
 ('Che-62', 'Traveling Maiden Boots',3 ,3.4 ,3.4 ,2.3 ,7.6 ,7.3 ,7.4 ,7.6 ,29 ,15 ,47 ,51 ,1 ,3.1 , 'A-Che'),
 ('Che-63', 'Twinned Greaves',7.7 ,7.1 ,8.4 ,6.8 ,6.5 ,6.5 ,5.0 ,5.8 ,20 ,34 ,13 ,34 ,10 ,7.3 , 'A-Che'),
 ('Che-64', 'Warrior Greaves',5.4 ,5.4 ,4.5 ,4.5 ,5.8 ,6.2 ,6.8 ,5.4 ,39 ,26 ,31 ,31 ,4 ,4.8 , 'A-Che'),
 ('Che-65', 'Vagabond Knight Greaves',7.4 ,5.8 ,6.8 ,6.5 ,5 ,5.8 ,4.5 ,4.5 ,20 ,34 ,13 ,13 ,8 ,5.7 , 'A-Che'),
 ('Che-66', 'Veterans Greaves',10.8 ,9.8 ,10.8 ,10.1 ,7.7 ,8.1 ,7.3 ,7.6 ,39 ,56 ,29 ,29 ,22 ,11.7 , 'A-Che'),
 ('Che-67', 'White Reed Greaves',5.4 ,5.4 ,6.5 ,5.0 ,6.2 ,6.2 ,6.8 ,5.8 ,41 ,26 ,34 ,31 ,4 ,5.1 , 'A-Che'),
 ('Che-68', 'Zamor Legwraps',6.5 ,5 ,6.8 ,5.8 ,4.5 ,4.5 ,3 ,4 ,11 ,37 ,0 ,7 ,7 ,5.1 , 'A-Che'),
 ('Che-69', 'Drake Knight Greaves',6.5 ,5.4 ,6.8 ,6.5 ,5.8 ,6.5 ,5 ,5.8 ,16 ,29 ,13 ,13 ,8 ,5.7 , 'A-Che'),
 ('Che-70', 'Perfumer Sarong',2.3 ,3.4 ,3 ,2.3 ,7.3 ,6.8 ,7.1 ,7.3 ,37 ,11 ,39 ,41 ,1 ,2.5 , 'A-Che'),
 ('Che-71', 'Spellblades Trousers',2.9 ,2.2 ,2.9 ,2.9 ,7.3 ,6.7 ,7 ,7.3 ,25 ,13 ,38 ,41 ,1 ,2.6 , 'A-Che'),
 ('Che-72', 'Ronins Greaves',6.2 ,6.2 ,6.5 ,6.2 ,6.8 ,7.1 ,7.3 ,6.8 ,46 ,35 ,36 ,38 ,5 ,5.7 , 'A-Che'),
 ('Che-73', 'Blaidds Greaves',8.4 ,7.3 ,8.4 ,8.8 ,6.5 ,7.3 ,6.2 ,6.8 ,24 ,39 ,16 ,16 ,14 ,8.5 , 'A-Che'),
 ('Che-74', 'Nights Cavalry Greaves',8 ,7.3 ,8 ,7.7 ,6.2 ,7.2 ,6.2 ,7.2 ,24 ,35 ,15 ,15 ,12 ,7.9 , 'A-Che'),
 ('Che-75', 'Blue Silver Mail Skirt',6.8 ,5 ,7.1 ,6.2 ,5.8 ,5.4 ,4 ,4 ,15 ,35 ,7 ,7 ,7 ,5.5 , 'A-Che'),
 ('Che-76', 'Nomadic Merchants Trousers',4.5 ,5 ,4 ,3.8 ,5.4 ,5.4 ,5.4 ,5 ,35 ,20 ,44 ,29 ,2 ,4.4 , 'A-Che'),
 ('Che-77', 'Tree Sentinel Greaves',10.8 ,8.6 ,10.8 ,10.1 ,7.4 ,9.9 ,7.2 ,8.1 ,41 ,56 ,26 ,29 ,17 ,11.7 , 'A-Che'),
 ('Che-78', 'Royal Knight Greaves',9.2 ,8.3 ,10.1 ,9.6 ,8.1 ,7.6 ,7.1 ,7.4 ,31 ,41 ,22 ,22 ,14 ,9.6 , 'A-Che'),
 ('Che-79', 'Nox Greaves',5.4 ,5.8 ,5.4 ,5 ,7.1 ,6.8 ,6.8 ,5.8 ,39 ,26 ,31 ,31 ,4 ,5.1 , 'A-Che'),
 ('Che-80', 'Shaman Leggings',3 ,3.4 ,3 ,4.5 ,4.5 ,4 ,4.5 ,3.8 ,39 ,26 ,34 ,22 ,1 ,3.1 , 'A-Che'),
 ('Che-81', 'Duelist Greaves',8 ,7.1 ,8 ,7.4 ,5.8 ,6.8 ,5.4 ,6.2 ,29 ,31 ,15 ,15 ,11 ,7.3 , 'A-Che'),
 ('Che-82', 'Fire Prelate Greaves',11.1 ,9.8 ,10.6 ,10.6 ,7.7 ,11.5 ,7.4 ,7.6 ,41 ,39 ,56 ,31 ,24 ,15.3 , 'A-Che'),
 ('Che-83', 'Aristocrat Boots',4.3 ,4.8 ,4.3 ,4.3 ,3.6 ,3.8 ,4.3 ,3.6 ,29 ,21 ,23 ,19 ,1 ,2.9 , 'A-Che'),
 ('Che-84', 'Old Aristocrat Shoes',3.4 ,3.4 ,3 ,3.4 ,4.5 ,5 ,4.5 ,3.4 ,22 ,15 ,17 ,20 ,1 ,2 , 'A-Che'),
 ('Che-85', 'Vulgar Militia Greaves',5.4 ,6.2 ,5.8 ,5 ,6.2 ,6.2 ,6.5 ,6.2 ,44 ,24 ,34 ,34 ,4 ,5.1 , 'A-Che'),
 ('Che-86', 'Godskin Noble Trousers',2.3 ,4.5 ,3 ,2.3 ,7.2 ,6.5 ,6.8 ,7.7 ,24 ,14 ,39 ,41 ,1 ,2.5 , 'A-Che'),
 ('Che-87', 'Depraved Perfumer Trousers',3.9 ,3.9 ,3.7 ,3.3 ,7.8 ,7.5 ,7.3 ,7.5 ,46 ,15 ,40 ,58 ,2 ,4.3 , 'A-Che'),
 ('Che-88', 'Old Sorcerers Legwraps',3.4 ,1.5 ,3.4 ,1.5 ,8.1 ,6.8 ,7.2 ,7.3 ,24 ,13 ,39 ,44 ,1 ,2.5 , 'A-Che'),
 ('Che-89', 'Ragged Loincloth',4 ,4.5 ,4 ,4 ,5 ,5.4 ,5.8 ,5 ,34 ,20 ,26 ,26 ,2 ,3.1 , 'A-Che'),
 ('Che-90', 'War Surgeon Trousers',3.9 ,4.4 ,4.9 ,3.9 ,5.3 ,5.7 ,6.1 ,5.7 ,33 ,23 ,23 ,31 ,3 ,4.2 , 'A-Che'),
 ('Che-91', 'Royal Remains Greaves',6.8 ,6.5 ,7.4 ,6.8 ,5.4 ,5.8 ,4.5 ,5 ,22 ,35 ,15 ,7 ,9 ,6.6 , 'A-Che'),
 ('Che-92', 'Braves Legwraps',3.4 ,3.4 ,3.4 ,3 ,7.4 ,7.2 ,7.3 ,7.4 ,29 ,15 ,47 ,47 ,1 ,3.1 , 'A-Che'),
 ('Che-93', 'Malenias Greaves',7.1 ,5.4 ,7.4 ,6.5 ,4.5 ,5.4 ,3.8 ,6.2 ,31 ,26 ,11 ,11 ,8 ,5.7 , 'A-Che'),
 ('Che-94', 'Fingerprint Greaves',7.7 ,6.8 ,6.8 ,6.8 ,5.4 ,7.2 ,3.8 ,5.4 ,20 ,37 ,7 ,14 ,11 ,6.6 , 'A-Che'),
 ('Che-95', 'Omen Greaves',10.6 ,8.6 ,10.8 ,10.8 ,7.4 ,8.3 ,8.5 ,7.9 ,41 ,39 ,35 ,47 ,24 ,14.3 , 'A-Che'),
 ('Che-96', 'Battlemage Legwraps',3 ,3.4 ,2.3 ,3 ,7.4 ,6.8 ,7.1 ,7.2 ,26 ,14 ,39 ,44 ,1 ,2.5 , 'A-Che'),
 ('Che-97', 'Travelers Boots',3.8 ,3.4 ,3 ,2.3 ,7.7 ,7.3 ,7.4 ,7.2 ,24 ,15 ,47 ,47 ,1 ,3.1 , 'A-Che'),
 ('Che-98', 'Gold Waistwrap',4 ,3.8 ,3.8 ,3 ,7.6 ,7.4 ,7.6 ,8.1 ,35 ,15 ,56 ,56 ,3 ,4.4 , 'A-Che'),
 ('Che-99', 'Leather Boots',4.5 ,5.4 ,4.5 ,5 ,5.4 ,5.4 ,5.8 ,5.8 ,37 ,22 ,26 ,31 ,1 ,4.4 , 'A-Che'),
 ('Che-100', 'Godrick Soldier Greaves',7.4 ,6.5 ,7.4 ,7.1 ,5.8 ,6.2 ,4.5 ,5.4 ,20 ,34 ,14 ,14 ,10 ,6.6 , 'A-Che'),
 ('Che-101', 'Leyndell Soldier Greaves',7.4 ,6.8 ,7.1 ,7.4 ,5.4 ,5.8 ,5 ,5.4 ,20 ,34 ,14 ,14 ,10 ,6.6 , 'A-Che'),
 ('Che-102', 'Mausoleum Greaves',7.4 ,6.2 ,7.7 ,7.1 ,5.8 ,5.8 ,5 ,5.8 ,20 ,31 ,14 ,13 ,11 ,6.6 , 'A-Che'),
 ('Che-103', 'Cuckoo Knight Greaves',7.7 ,6.5 ,8.4 ,7.7 ,7.1 ,6.8 ,5 ,5.8 ,20 ,35 ,15 ,15 ,11 ,7.3 , 'A-Che'),
 ('Che-104', 'Leyndell Knight Greaves',7.7 ,7.1 ,7.7 ,7.7 ,5.8 ,6.5 ,5.8 ,6.2 ,22 ,35 ,15 ,15 ,11 ,7.3 , 'A-Che'),
 ('Che-105', 'Redmane Knight Greaves',7.7 ,6.5 ,7.7 ,7.1 ,6.2 ,7.3 ,5.4 ,6.2 ,22 ,34 ,15 ,15 ,11 ,7.3 , 'A-Che'),
 ('Che-106', 'Mausoleum Knight Greaves',7.7 ,6.5 ,8.4 ,7.4 ,6.2 ,6.5 ,5.8 ,6.5 ,22 ,34 ,15 ,14 ,12 ,7.3 , 'A-Che'),
 ('Che-107', 'Haligtree Knight Greaves',7.7 ,7.1 ,7.7 ,7.7 ,5.8 ,6.5 ,5.4 ,6.5 ,22 ,35 ,15 ,15 ,10 ,7.3 , 'A-Che')

GO

INSERT INTO Classes (Levels,Vigor,Mind,Endurance,Strength,Dex,Intell,Fai,Arc,Class_Name,Class_ID)
VALUES (6,9,15,9,8,12,16,7,9,'Astrologer','1'),
(5,10,11,10,9,13,9,8,14,'Bandit','2'),
(10,10,13,10,12,12,9,14,9,'Confessor','3'),
(7,14,9,12,16,9,7,8,11,'Hero','4'),
(9,11,12,11,11,14,14,6,9,'Prisoner','5'),
(7,10,14,8,11,10,7,16,11,'Prophet','6'),
(9,12,11,14,12,15,9,8,8,'Samurai','7'),
(9,15,10,11,14,13,9,9,7,'Vagabond','8'),
(8,11,12,11,10,16,10,8,9,'Warrior','9'),
(1,10,10,10,10,10,10,10,10,'Wretch','10')











