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
	SKill_name nvarchar(20),
	SCost nvarchar(20),
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
	User_ID varchar(50) FOREIGN KEY REFERENCES Users(User_ID),
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
	HienThi bit DEFAULT '0',
)
GO

CREATE TABLE Comment
(
	Comment_ID varchar(20) PRIMARY KEY,
	Pages nvarchar NOT null,
	User_ID varchar(50) NOT NULL FOREIGN KEY REFERENCES Users(User_ID) 
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	Texts nvarchar,
	C_Date date,
	Likes int,
)
GO
CREATE TABLE Likes
(
	Like_ID varchar(20) PRIMARY KEY,
	Comment_ID varchar(20) FOREIGN KEY REFERENCES Comment(Comment_ID) 
	ON UPDATE CASCADE
	ON DELETE CASCADE,
)
GO
CREATE TABLE User_Feed
(
	Feed_ID varchar(20) PRIMARY KEY,
	Comment_ID varchar(20) NOT NULL FOREIGN KEY REFERENCES Comment(Comment_ID) ,
	User_ID varchar(50) NOT NULL FOREIGN KEY REFERENCES Users(User_ID) ,
	Feed_Date date ,
)
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
INSERT INTO Equipment_Type
VALUES
('S-Small','Small shields'),
('S-Med','Medium shields'),
('S-Big','Greatshields')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Small-1', 'Rickety Shield',61,70 ,29,0 ,24,0 ,34,0 ,34,0 ,37,100 ,8,'E' ,0 ,0 ,0 ,0,0,0,0,0 ,1.0  ,0,'Parry', 'S-Small')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Small-2', 'Riveted Wooden Shield',74,72 ,43,0 ,31,0 ,24,0 ,45,0 ,39,100 ,8,'E' ,0 ,0 ,0 ,0,0,0,0,0 ,2.0  ,0,'Parry', 'S-Small')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Small-3', 'Blue-White Wooden Shield',73,72 ,45,0 ,35,0 ,22,0 ,42,0 ,39,100 ,8,'E' ,0 ,0 ,0 ,0,0,0,0,0 ,2.0 ,0, 'No Skill', 'S-Small')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Small-4', 'Scripture Wooden Shield',70,70 ,40,0 ,22,0 ,37,0 ,45,0 ,38,100 ,8,'E' ,0 ,0 ,0 ,0,0,0,0,0 ,1.5  ,0,'Parry', 'S-Small')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Small-5', 'Red Thorn Roundshield',68,70 ,32,0 ,42,0 ,37,0 ,37,0 ,38,100 ,8,'E' ,0 ,0 ,0 ,0,0,0,0,0 ,1.5  ,0,'Parry', 'S-Small')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Small-6', 'Pillory Shield',68,71 ,46,0 ,23,0 ,38,0 ,46,0 ,40,100 ,10,'E' ,0 ,0 ,0 ,0,0,0,0,0 ,3.5  ,0,'No Skill', 'S-Small')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Small-7', 'Buckler',61,68 ,30,0 ,30,0 ,16,0 ,30,0 ,37,100 ,8,'E' ,13,'D' ,0 ,0 ,0,0,0,0 ,1.5  ,0,'Buckler Parry', 'S-Small')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Small-8', 'Iron Roundshield',80,74 ,42,0 ,42,0 ,18,0 ,42,0 ,41,100 ,8,'E' ,0 ,0 ,0 ,0,0,0,0,0 ,3.0  ,0,'No Skill', 'S-Small')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Small-9', 'Gilded Iron Shield',78,74 ,40,0 ,38,0 ,17,0 ,51,0 ,41,100 ,8,'E' ,0 ,0 ,0 ,0,0,0,0,0 ,3.0  ,0,'Parry', 'S-Small')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Small-10', 'Man-Serpents Shield',75,70 ,35,0 ,48,0 ,18,0 ,33,0 ,39,100 ,8,'E' ,0 ,0 ,0 ,0,0,0,0,0 ,2.0 ,0, 'No skill', 'S-Small')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Small-11', 'Ice Crest Shield',77,74 ,57,0 ,41,0 ,18,0 ,35,0 ,41,100 ,9,'E' ,0 ,0 ,0 ,0,0,0,0,0 ,3.0 ,0, 'No Skill', 'S-Small')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Small-12', 'Rift Shield',76,70 ,33,0 ,37,0 ,18,0 ,37,0 ,38,100 ,8,'E' ,0 ,0 ,0 ,0,0,0,0,0 ,2.0  ,0,'Parry', 'S-Small')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Small-13', 'Perfumers Shield',66,67 ,35,0 ,35,0 ,16,0 ,35,0 ,37,100 ,8,'E' ,0 ,0 ,0 ,0,0,0,0,0 ,1.5  ,0,'Parry', 'S-Small')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Small-14', 'Shield of the Guilty',68,75 ,36,0 ,36,0 ,31,0 ,37,0 ,33,100 ,8,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,2 , 10,'Shield Bash', 'S-Small')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Small-15', 'Spiralhorn Shield',61,75 ,35,0 ,39,0 ,39,0 ,32,0 ,35,100 ,8,'E' ,10,0 ,0 ,0 ,0,0,0,0 ,2.0  ,0,'Parry', 'S-Small')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Small-16', 'Smoldering Shield',79,58 ,38,0 ,56,37 ,14,0 ,38,0 ,41,100 ,10,'E' ,9,0 ,0 ,12,0 ,'D',0,0,3.0 , 10,'Shield Bash', 'S-Small')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Small-17', 'Coil Shield',65,92 ,38,0 ,29,0 ,35,0 ,36,0 ,29,100 ,10,'E' ,10,'E' ,0 ,0 ,0,0,0,0 ,1.5 , 8,'Viper Bite', 'S-Small')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-1', 'Hawk Crest Wooden Shield',90,76 ,44,0 ,32,0 ,44,0 ,44,0 ,45,100 ,8,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,3.5,  '-Parry', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-2', 'Horse Crest Wooden Shield',87,76 ,50,0 ,32,0 ,43,0 ,42,0 ,47,100 ,8,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,3.5  ,'No Skill', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-3', 'Candletree Wooden Shield',88,76 ,42,0 ,32,0 ,50,0 ,43,0 ,47,100 ,8,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,3.5  ,'-Parry', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-4', 'Flame Crest Wooden Shield',89,76 ,43,0 ,32,0 ,42,0 ,50,0 ,47,100 ,8,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,3.5  ,'-Parry', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-5', 'Marred Wooden Shield',86,76 ,52,0 ,27,0 ,50,0 ,49,0 ,48,100 ,8,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,4  ,'No Skill', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-6', 'Sun Realm Shield',86,74 ,44,0 ,27,0 ,40,0 ,56,0 ,48,100 ,8,'D' ,0 ,0 ,0 , 0,0,0,0,0,3.5  ,'-Parry', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-7', 'Round Shield',88,76 ,50,0 ,37,0 ,43,0 ,50,0 ,47,100 ,8,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,4,  'Parry', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-8', 'Large Leather Shield',85,75 ,49,0 ,36,0 ,45,0 ,45,0 ,46,100 ,8,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,3 , 'Parry', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-9', 'Black Leather Shield',88,75 ,34,0 ,31,0 ,46,0 ,47,0 ,44,100 ,8,'D',10 ,0,0 ,0,0 ,0,0 ,0 ,3  ,'No Skill', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-10', 'Marred Leather Shield',81,75 ,49,0 ,36,0 ,45,0 ,45,0 ,46,100 ,8,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,3  ,'No Skill', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-11', 'Heater Shield',100,77 ,43,0 ,43,0 ,27,0 ,43,0 ,49,100 ,10,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,3.5  ,'-Parry', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-12', 'Blue Crest Heater Shield',100,77 ,43,0 ,42,0 ,32,0 ,50,0 ,50,100 ,10,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,3.5  ,'-Parry', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-13', 'Red Crest Heater Shield',100,77 ,42,0 ,50,0 ,32,0 ,43,0 ,50,100 ,10,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,3.5  ,'-Parry', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-14', 'Beast Crest Heater Shield',100,77 ,50,0 ,43,0 ,32,0 ,42,0 ,51,100 ,10,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,3.5  ,'-Parry', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-15', 'Inverted Hawk Heater Shield',100,77 ,49,0 ,49,0 ,34,0 ,49,0 ,50,100 ,10,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,3.5  ,'-Parry', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-16', 'Eclipse Crest Heater Shield',100,77 ,44,0 ,44,0 ,37,0 ,44,0 ,51,100 ,10,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,3.5  ,'No Skill', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-17', 'Kite Shield',100,78 ,47,0 ,47,0 ,33,0 ,47,0 ,51,100 ,12,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,4.5  ,'No Skill', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-18', 'Blue-Gold Kite Shield',100,80 ,47,0 ,53,0 ,35,0 ,45,0 ,53,100 ,12,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,5  ,'-Parry', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-19', 'Scorpion Kite Shield',100,78 ,45,0 ,46,0 ,33,0 ,50,0 ,52,100 ,12,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,4.5  ,'-Parry', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-20', 'Twinbird Kite Shield',100,72 ,49,0 ,50,0 ,28,0 ,35,0 ,50,100 ,12,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,4.5  ,'No Skill', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-21', 'Brass Shield',100,84 ,55,0 ,59,0 ,39,0 ,54,0 ,56,100 ,16,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,7  ,'No Skill', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-22', 'Banished Knights Shield',100,81 ,49,0 ,57,0 ,31,0 ,48,0 ,55,100 ,14,'D' ,0,0 ,0,0 ,0,0 ,0,0 ,6  ,'No Skill', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-23', 'Albinauric Shield',100,78 ,66,0 ,42,0 ,23,0 ,47,0 ,51,100 ,11,'D' ,0,0 ,0,0 ,0,0 ,0,0 ,4.5  ,'-Parry', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-24', 'Beastmans Jar-Shield',95,71 ,30,0 ,55,0 ,60,0 ,55,0 ,50,100 ,10,'E' ,0 ,0 ,0 ,0,0,0,0,0 ,5  ,'No Skill', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-25', 'Carian Knights Shield',100,70 ,71,0 ,28,0 ,19,0 ,54,0 ,49,100 ,10,'D' ,10,0 ,15,'D' ,0 ,0,0,0 ,4.5  ,'No Skill', 'S-Med')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Guardboot,Critboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Med-26', 'Silver Mirrorshield',100,70 ,89,45 ,31,0 ,19,0 ,27,0 ,45,100 ,12,'D' ,10,0 ,10,'D' ,0,0 ,0,0 ,3.5  ,'No Skill', 'S-Med')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-1', 'Wooden Greatshield',95,91 ,0,49.0 ,0,41.0 ,0,51.0 ,0,47.0 ,100,56 ,14,'D' ,0 ,0 ,0 ,0,0,0,0,0 ,8.0 , 'No Skill', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-2', 'Lordsworns Shield',99,94 ,0,51 ,0,44 ,0,52 ,0,0,52 ,100,60 ,'D',16 ,0 ,0 ,0 ,0,0,0,0 ,10.0  ,'10,Shield Bash', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-3', 'Briar Greatshield',98,93 ,0,50 ,0,43 ,0,50 ,0,0,50 ,100,58 ,'D',21 ,0 ,0 ,0 ,0,0,0,0 ,9.5 , '10,Shield Bash', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-4', 'Spiked Palisade Shield',116,95 ,0,51 ,0,45 ,0,54 ,0,0,50 ,100,59 ,'D',20 ,0 ,0 ,0 ,0,0,0,0 ,11.5 , '10,Shield Bash', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-5', 'Icon Shield',160,95 ,0,49 ,0,45 ,0,51 ,0,0,48 ,100,59 ,'D',22 ,0 ,0 ,0 ,0,0,0,0 ,11.5  ,'No Skill', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-6', 'Golden Beast Crest Shield',104,100 ,0,55 ,0,55 ,0,48 ,0,0,55 ,100,60 ,'D',24 ,0 ,0 ,0 ,0,0,0,0 ,12.5 , 'No Skill', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-7', 'Manor Towershield',111,100 ,0,66 ,0,66 ,0,51 ,0,0,56 ,100,67 ,'D',30 ,0 ,0 ,0 ,0,0,0,0 ,16  ,'10,Shield Bash', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-8', 'Crossed-Tree Towershield',111,100 ,0,56 ,0,66 ,0,53 ,0,0,66 ,100,67 ,'D',30 ,0 ,0 ,0 ,0,0,0,0 ,16  ,'10,Shield Bash', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-9', 'Inverted Hawk Towershield',111,100 ,0,66 ,0,56 ,0,54 ,0,0,66 ,100,65 ,'D',30 ,0 ,0 ,0 ,0,0,0,0 ,16  ,'10,Shield Bash', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-10', 'Dragon Towershield',115,100 ,0,61 ,0,67 ,0,55 ,0,0,64 ,100,69 ,'D',30 ,0 ,0 ,0 ,0,0,0,0 ,17.5  ,'10,Shield Bash', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-11', 'Distinguished Greatshield',112,100.0 ,0,65.0 ,0,63.0 ,0,54.0 ,0,0,60.0 ,100,68 ,'D',32 ,0 ,0 ,0 ,0,0,0,0 ,17.0  ,'No Skill', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-12', 'Gilded Greatshield',115,100 ,0,60 ,0,66 ,0,54 ,0,0,65 ,100,69 ,'D',36 ,0 ,0 ,0 ,0,0,0,0 ,17.5  ,'No Skill', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-13', 'Cuckoo Greatshield',110,100 ,0,70 ,0,56 ,0,52 ,0,0,60 ,100,64 ,'D',32 ,0 ,0 ,0 ,0,0,0,0 ,15  ,'No Skill', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-14', 'Redmane Greatshield',108,100 ,0,54 ,0,70 ,0,53 ,0,0,52 ,100,65 ,'D',30 ,0 ,0 ,0 ,0,0,0,0 ,14 , 'No Skill', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-15', 'Golden Greatshield',113,100 ,0,57 ,0,60 ,0,57 ,0,0,68 ,100,70 ,'D',34 ,0 ,0 ,0 ,0,0,0,0 ,17 , 'No Skill', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-16', 'Haligtree Crest Greatshield',116,100 ,0,61 ,0,67 ,0,55 ,0,0,79 ,100,71 ,'D',36 ,0 ,0 ,0 ,0,0,0,0 ,18.5  ,'No Skill', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-17', 'Crucible Hornshield',147,100 ,0,51 ,0,50 ,0,46 ,0,0,64 ,100,60 ,'D',26 ,0 ,0 ,0 ,0,0,0,0 ,11.5  ,'10,Shield Bash', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-18', 'Dragonclaw Shield',118,100 ,0,52.0 ,0,52.0 ,76,76.0 ,0,0,47.0 ,100,61 ,'D',28 ,'E',12 ,0 ,0 ,0 ,0,0,13.5  ,'10,Shield Bash', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-19', 'Fingerprint Stone Shield',158,100 ,0,77 ,0,81 ,0,79 ,0,0,75 ,100,81 ,'D',48 ,0 ,0 ,0 ,0,0,0,0 ,29 ,' 10,Shield Bash', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-20', 'Eclipse Crest Greatshield',110,100 ,0,72 ,0,57 ,0,51 ,0,0,59 ,100,67 ,'D',32 ,0 ,0 ,0 ,0,0,0,0 ,15  ,'No Skill', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-21', 'Ants Skull Plate',136,100 ,0,47 ,0,42 ,0,57 ,0,0,57 ,100,63 ,'D',28 ,0,0 ,0,0 ,0,0 ,0 ,13.5 ,' 10,Shield Bash', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-22', 'Erdtree Greatshield',120,100 ,0,66 ,0,49 ,0,45 ,78,0,76 ,100,60 ,'D',30 ,0 ,0 ,'D',12 ,0,0,0 ,13.5 , '4,Golden Retaliation', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-23', 'Jellyfish Shield',123,100 ,0,52 ,0,52 ,0,40 ,0,0,48 ,100,52 ,'D',20 ,0,0,14 ,0 ,0 ,0,0 ,8  ,'9,Contagious Fury', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-24', 'Visage Shield',186,100 ,0,62 ,0,81 ,0,65 ,0,0,62 ,100,75 ,'D',44 ,0 ,0 ,0 ,0,0,0,0 ,24.0  ,'5,Tongues of Fire', 'S-Big')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,Skill_name,ET_ID)
VALUES ('Big-25', 'One-Eyed Shield',175,100 ,0,57 ,0,69 ,0,59 ,0,0,63 ,100,67 ,'D',36 ,0 ,0 ,0 ,0,0,0,0 ,20.5  ,'28,Flame Spit', 'S-Big')

GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Dag-1', 'Black Knife',66,26 ,0,15 ,0,15 ,0,15 ,65,42 ,110,15 ,8,'E' ,12,'D' ,0,0 ,18,'D' ,0,0 ,2.0,  25,'Blade of Death', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Dag-2', 'Blade of Calling',71,31 ,0,18 ,0,18 ,0,18 ,43,30 ,110,15 ,6,'D' ,13,'D' ,0,0 ,15,'C' ,0,0 ,1.5,  20,'Blade of Gold', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Dag-3', 'Bloodstained Dagger',81,36 ,0,21 ,0,21 ,0,21 ,0,21 ,110,15 ,9,'C' ,12,'E' ,0,0 ,0,0 ,0,0 ,2.0,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Dag-4', 'Celebrants Sickle',79,35 ,0,20 ,0,20 ,0,20 ,0,20 ,100,15 ,6,'E' ,11,'C' ,0,0 ,0,0 ,0,0 ,1.5,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Dag-5', 'Cinquedea',98,43 ,0,25 ,0,25 ,0,25 ,0,25 ,100,18 ,10,'D' ,10,'E' ,0,0 ,0,0 ,0,0 ,3.5,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Dag-6', 'Crystal Knife',82,32 ,53,31 ,0,18 ,0,18 ,0,18 ,100,15 ,8,'D' ,12,'D' ,9,'D' ,0,0 ,0,0 ,2.0,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Dag-7', 'Dagger',74,35 ,0,20 ,0,20 ,0,20 ,0,20 ,130,15 ,5,'D' ,9,'C' ,0,0 ,0,0 ,0,0 ,1.5,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Dag-8', 'Erdsteel Dagger',67,36 ,0,21 ,0,21 ,0,21 ,0,21 ,110,15 ,7,'D' ,12,'D' ,0,0 ,14,'D' ,0,0 ,2.0,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Dag-9', 'Glintstone Kris',57,23 ,68,45 ,0,14 ,0,14 ,0,14 ,110,15 ,5,'E' ,12,'D' ,16,'D' ,0,0 ,0,0 ,1.5,  10 ,'Glintstone Dart', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Dag-10', 'Great Knife',75,35 ,0,20 ,0,20 ,0,20 ,0,20 ,110,15 ,6,'E' ,12,'C' ,0,0 ,0,0 ,0,0 ,1.5,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Dag-11', 'Ivory Sickle',60,26 ,60,42 ,0,15 ,0,15 ,0,15 ,100,15 ,6,'E' ,11,'D' ,13,'D' ,0,0 ,0,0 ,2.0,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Dag-12', 'Misericorde',92,36 ,0,21 ,0,21 ,0,21 ,0,21 ,140,15 ,7,'E' ,12,'D' ,0,0 ,0,0 ,0,0 ,2.0,  3,'Quickstep', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Dag-13', 'Parrying Dagger',75,35 ,0,20 ,0,20 ,0,20 ,0,20 ,110,15 ,5,'E' ,14,'C' ,0,0 ,0,0 ,0,0 ,1.5,  0,'Parry', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Dag-14', 'Reduvia',79,38 ,0,22 ,0,22 ,0,22 ,0,22 ,110,16 ,5,'E' ,13,'D' ,0,0 ,0,0 ,13,'D' ,2.5,  4,'Blood Blade', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Dag-15', 'Scorpions Stinger',79,38 ,0,22 ,0,22 ,0,22 ,0,22 ,110,16 ,6,'D' ,12,'C' ,0,0 ,0,0 ,0,0 ,2.5,  7,'Repeating Thrust', 'W-Dag')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Dag-16', 'Wakizashi',94,42 ,0,24 ,0,24 ,0,24 ,0,24 ,100,18 ,9,'D' ,13,'D' ,0,0 ,0,0 ,0,0 ,3.0,  3,'Quickstep', 'W-Dag')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Axe-1', 'Hand Axe',113,42 ,0,28 ,0,28 ,0,28 ,0,28 ,100,28 ,9,'D' ,8,'D' ,0,0 ,0,0 ,0,0 ,3.5,  3,'Quickstep', 'W-Axe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Axe-2', 'Forked Hatchet',101,40 ,0,27 ,0,27 ,0,27 ,0,27 ,100,27 ,9,'D' ,14,'D' ,0,0 ,0,0 ,0,0 ,2.5,  3,'Quickstep', 'W-Axe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Axe-3', 'Battle Axe',123,47 ,0,31 ,0,31 ,0,31 ,0,31 ,100,31 ,12,'D' ,8,'D' ,0,0 ,0,0 ,0,0 ,4.5,  1,'Wild Strikes', 'W-Axe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Axe-4', 'Warped Axe',118,56 ,0,37 ,0,37 ,0,37 ,0,37 ,100,43 ,24,'C' ,8,0 ,0,0 ,0,0 ,0,0 ,7.5,  16,'War Cry', 'W-Axe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Axe-5', 'Jawbone Axe',124,49 ,0,33 ,0,33 ,0,33 ,0,33 ,100,36 ,14,'D' ,8,'E' ,0,0 ,0,0 ,0,0 ,5.5,  1 ,'Wild Strikes', 'W-Axe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Axe-6', 'Iron Cleaver',120,51 ,0,34 ,0,34 ,0,34 ,0,34 ,100,34 ,15,'C' ,7,'E' ,0,0 ,0,0 ,0,0 ,6 , 1 ,'Wild Strikes', 'W-Axe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Axe-7', 'Highland Axe',123,47 ,0,31 ,0,31 ,0,31 ,0,31 ,110,31 ,12,'D' ,9,'D' ,0,0 ,0,0 ,0,0 ,4.5,  16,'War Cry', 'W-Axe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Axe-8', 'Celebrants Cleaver',119,47 ,0,31 ,0,31 ,0,31 ,0,31 ,100,33 ,12,'D' ,8,'D' ,0,0 ,0,0 ,0,0 ,4.5,  2 ,'Wild Strikes', 'W-Axe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Axe-9', 'Sacrificial Axe',128,49 ,0,33 ,0,33 ,0,33 ,0,33 ,100,33 ,16,'D' ,10,'D' ,0,0 ,0,0 ,0,0 ,5.5,  2 ,'Wild Strikes', 'W-Axe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Axe-10', 'Icerind Hatchet',111,40 ,0,27 ,0,27 ,0,27 ,0,27 ,100,27 ,11,'E' ,16,'D' ,0,0 ,0,0 ,0,0 ,3.0,  10,'Hoarfrost Stomp', 'W-Axe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Axe-11', 'Ripple Blade',70,47 ,0,31 ,0,31 ,0,31 ,0,31 ,100,31 ,11,0 ,11,0 ,0,0 ,0,0 ,20,'A' ,4.5,  2,'Wild Strikes', 'W-Axe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Axe-12', 'Stormhawk Axe',130,49 ,0,33 ,0,33 ,0,33 ,0,33 ,100,31 ,19,'D' ,15,'D' ,0,0 ,0,0 ,0,0 ,5.5,  19 ,'Thunderstorm', 'W-Axe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Axe-13', 'Rosuss Axe',106,44 ,68,44 ,0,30 ,0,30 ,0,30 ,100,33 ,18,'D' ,10,'E' ,18,'D' ,0,0 ,0,0 ,5.5,  15,'Rosuss Summons', 'W-Axe')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,SCost,Weigth,Skill_name,ET_ID)
VALUES ('Bali-1', 'Hand Ballista',135,0 ,0,0 ,0,0 ,0,0 ,0,0 ,100,50,0 ,30,0 ,14,0 ,0,0 ,0,0 ,0,0 ,10.0 ,'Kick', 'W-Bali')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,SCost,Weigth,Skill_name,ET_ID)
VALUES ('Bali-2', 'Jar Cannon',192,0 ,0,0 ,0,0 ,0,0 ,0,0 ,100,50,0 ,34,0 ,12,0 ,0,0 ,0,0 ,0,0 ,15.0 ,'Kick', 'W-Bali')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Claw-1', 'Hookclaws',89,35 ,0,20 ,0,20 ,0,20 ,0,20 ,110,20 ,8,'E' ,14,'C' ,0,0 ,0,0 ,0,0 ,2.0,  3,'Quickstep', 'W-Claw')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Claw-2', 'Bloodhound Claws',94,38 ,0,22 ,0,22 ,0,22 ,0,22 ,110,22 ,10,'D' ,15,'D' ,0,0 ,0,0 ,0,0 ,3.0,  5,'Bloodhounds Step', 'W-Claw')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Claw-3', 'Venomous Fang',92,36 ,0,21 ,0,21 ,0,21 ,0,21 ,100,19 ,9,'D' ,9,'D' ,0,0 ,0,0 ,0,0 ,2.5,  3,'Quickstep', 'W-Claw')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Claw-4', 'Raptor Talons',83,33 ,0,19 ,0,19 ,0,19 ,0,19 ,110,19 ,6,'E' ,14,'C' ,0,0 ,0,0 ,0,0 ,1.5,  3,'Quickstep', 'W-Claw')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColS-1', 'Zweihander',141,67 ,0,40 ,0,40 ,0,40 ,0,40 ,100,45 ,19,'D' ,11,'D' ,0,0 ,0,0 ,0,0 ,15.5, 5,'Stamp (Upward Cut)', 'W-ColS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColS-2', 'Greatsword',164,84 ,0,50 ,0,50 ,0,50 ,0,50 ,100,56 ,31,'C' ,12,'E' ,0,0 ,0,0 ,0,0 ,23,  5 ,'Stamp (Upward Cut)', 'W-ColS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColS-3', 'Watchdogs Greatsword',142,82 ,0,49 ,0,49 ,0,49 ,0,49 ,100,55 ,30,'C' ,10,'E' ,0,0 ,0,0 ,0,0 ,22 , 5 ,'Stamp (Upward Cut)', 'W-ColS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColS-4', 'Trolls Golden Sword',155,76 ,0,46 ,0,46 ,0,46 ,0,46 ,100,51 ,29,'D' ,10,'D' ,0,0 ,0,0 ,0,0 ,19 , 22,'Trolls Roar', 'W-ColS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColS-5', 'Troll Knights Sword',124,70 ,80,55 ,0,43 ,0,43 ,0,43 ,100,50 ,20,'D' ,14,'D' ,18,'D' ,0,0 ,0,0 ,18 , 22,'Trolls Roar', 'W-ColS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColS-6', 'Royal Greatsword',112,71 ,134,63 ,0,44 ,0,44 ,0,44 ,100,52 ,26,'D' ,18,'E' ,22,'D' ,0,0 ,0,0 ,20,  20,'Wolfs Assault', 'W-ColS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColS-7', 'Grafted Blade Greatsword',162,80 ,0,48 ,0,48 ,0,48 ,0,48 ,100,53 ,40,'C' ,14,'E' ,0,0 ,0,0 ,0,0 ,21,  20,'Oath of Vengeance', 'W-ColS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColS-8', 'Ruins Greatsword',124,82 ,37,56 ,0,50 ,0,50 ,0,50 ,100,56 ,50,'B' ,0,0 ,16,'E' ,0,0 ,0,0 ,23,  25,'Wave of Destruction', 'W-ColS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColS-9', 'Starscourge Greatsword',129,65 ,83,47 ,0,34 ,0,34 ,0,34 ,100,52 ,38,'D' ,12,'D' ,15,'E' ,0,0 ,0,0 ,20,  20 ,'Starcaller Cry', 'W-ColS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColS-10', 'Godslayers Greatsword',119,63 ,0,38 ,77,49 ,0,38 ,0,38 ,100,45 ,20,'D' ,22,'D' ,0,0 ,20,'D' ,0,0 ,17.5,  15,'The Queens', 'W-ColS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColS-11', 'Malikeths Black Blade',127,68 ,0,36 ,0,36 ,0,36 ,82,49 ,100,55 ,34,'D' ,12,'E' ,0,0 ,20,'D' ,0,0 ,22 , 40,'Destined Death', 'W-ColS')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColW-1', 'Duelist Greataxe',170,78 ,0,47 ,0,47 ,0,47 ,0,47 ,100,52 ,30,'E' ,10,'D' ,0,0 ,0,0 ,0,0 ,20 , 9,'Endure', 'W-ColW')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColW-2', 'Rotten Greataxe',162,78 ,0,47 ,0,47 ,0,47 ,0,47 ,100,52 ,30,'E' ,10,'D' ,0,0 ,0,0 ,0,0 ,20 , 9,'Endure', 'W-ColW')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColW-3', 'Golems Halberd',158,75 ,0,45 ,0,45 ,0,45 ,0,45 ,100,50 ,36,'D' ,14,'D' ,0,0 ,0,0 ,0,0 ,21.5,  16,'Charge Forth', 'W-ColW')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColW-4', 'Giant-Crusher',155,88 ,0,52 ,0,52 ,0,52 ,0,52 ,100,58 ,60,'C' ,0,0 ,0,0 ,0,0 ,0,0 ,26.5,  9,'Strike', 'W-ColW')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColW-5', 'Prelates Inferno Crozier',156,82 ,0,49 ,0,49 ,0,49 ,0,49 ,100,55 ,45,'C' ,8,'E' ,0,0 ,0,0 ,0,0 ,23.5,  20,'Prelates Charge', 'W-ColW')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColW-6', 'Great Club',154,71 ,0,42 ,0,42 ,0,42 ,0,42 ,100,47 ,35,'C' ,0,0 ,0,0 ,0,0 ,0,0 ,17.0,  16 ,'Golden Land', 'W-ColW')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColW-7', 'Trolls Hammer',153,66 ,0,41 ,45,46 ,0,41 ,0,41 ,100,46 ,28,'C' ,8,'E' ,0,0 ,10,'D' ,0,0 ,16.0,  22,'Trolls Roar', 'W-ColW')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColW-8', 'Dragon Greatclaw',120,66 ,0,40 ,0,40 ,78,52 ,0,40 ,100,47 ,30,'D' ,14,'D' ,0,0 ,0,0 ,0,0 ,16.0,  9,'Endure', 'W-ColW')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColW-9', 'Watchdogs Staff',165,75 ,0,45 ,0,45 ,0,45 ,0,45 ,100,50 ,34,'D' ,10,'D' ,0,0 ,0,0 ,0,0 ,19,  15,'Sorcery', 'W-ColW')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColW-10', 'Staff of the Avatar',113,73 ,0,45 ,0,45 ,0,45 ,73,57 ,100,52 ,34,'C' ,8,'E' ,0,0 ,24,'D' ,0,0 ,20.0,  19,'Erdtree Slam', 'W-ColW')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColW-11', 'Rotten Staff',165,75 ,0,45 ,0,45 ,0,45 ,0,45 ,100,50 ,34,'D' ,8,'E' ,0,0 ,0,0 ,0,0 ,18 , 19,'Erdtree Slam', 'W-ColW')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColW-12', 'Envoys Greathorn',121,70 ,0,43 ,0,43 ,0,43 ,78,55 ,100,50 ,28,'D' ,12,'D' ,0,0 ,24,'E' ,0,0 ,19.5,  28,'Great Oracular', 'W-ColW')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColW-13', 'Ghizas Wheel',156,73 ,0,43 ,0,43 ,0,43 ,0,43 ,100,48 ,28,'D' ,18,'D' ,0,0 ,0,0 ,0,0 ,19.0,  4,'Spinning Wheel', 'W-ColW')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColW-14', 'Fallingstar Beast Jaw',131,70 ,85,55 ,0,43 ,0,43 ,0,43 ,100,50 ,34,'D' ,12,'D' ,20,'E' ,0,0 ,0,0 ,21.5,  13 ,'Gravity Bolt', 'W-ColW')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ColW-15', 'Axe of Godfrey',165,75 ,0,45 ,0,45 ,0,45 ,0,45 ,100,50 ,42,'D' ,14,'D' ,0,0 ,0,0 ,0,0 ,18.0,  25,'Regal Roar', 'W-ColW')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurGS-1', 'Dismounter',138,65 ,0,35 ,0,35 ,0,35 ,0,35 ,100,42 ,19,'D' ,16,'D' ,0,0 ,0,0 ,0,0 ,10.0,  6 ,'Spinning Slash', 'W-CurGS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurGS-2', 'Omen Cleaver',142,68 ,0,36 ,0,36 ,0,36 ,0,36 ,100,44 ,19,'D' ,16,'D' ,0,0 ,0,0 ,0,0 ,11.5,  6 ,'Spinning Slash', 'W-CurGS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurGS-3', 'Monks Flameblade',134,61 ,0,33 ,0,33 ,0,33 ,0,33 ,100,39 ,18,'D' ,18,'D' ,0,0 ,0,0 ,0,0 ,9.0,  6 ,'Spinning Slash', 'W-CurGS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurGS-4', 'Beastmans Cleaver',143,81 ,0,43 ,0,43 ,0,43 ,0,43 ,100,52 ,25,'C' ,14,0 ,0,0 ,0,0 ,0,0 ,16.5,  6 ,'Spinning Slash', 'W-CurGS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurGS-5', 'Bloodhounds Fang',141,68 ,0,36 ,0,36 ,0,36 ,0,36 ,100,44 ,18,'D' ,17,'C' ,0,0 ,0,0 ,0,0 ,11.5,  8 ,'Bloodhounds Finesse', 'W-CurGS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurGS-6', 'Onyx Lords Greatsword',118,57 ,76,42 ,0,29 ,0,29 ,0,29 ,100,44 ,20,'D' ,16,'E' ,16,'D' ,0,0 ,0,0 ,11.5,  27,'Onyx Lords Repulsion', 'W-CurGS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurGS-7', 'Zamor Curved Sword',125,61 ,0,33 ,0,33 ,0,33 ,0,33 ,100,39 ,16,'D' ,18,'D' ,0,0 ,0,0 ,0,0 ,9.0,  15,'Zamor Ice Storm', 'W-CurGS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurGS-8', 'Magma Wyrms Scalesword',114,66 ,0,33 ,74,48 ,0,33 ,0,33 ,100,50 ,24,'C' ,15,'D' ,0,0 ,18,'D' ,0,0 ,15.0,  20 ,'Magma Guillotine', 'W-CurGS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurGS-9', 'Morgotts Cursed Sword',120,55 ,0,29 ,0,29 ,0,29 ,0,29 ,110,35 ,14,'E' ,35,'C' ,0,0 ,0,0 ,17,'D' ,7.5,  20 ,'Cursed-Blood Slice', 'W-CurGS')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurS-1', 'Scimitar',106,40 ,0,30 ,0,30 ,0,30 ,0,30 ,100,25 ,7,'D' ,13,'D' ,0,0 ,0,0 ,0,0 ,3.0,  6,'Spinning Slash', 'W-CurS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurS-2', 'Falchion',109,42 ,0,31 ,0,31 ,0,31 ,0,31 ,100,26 ,9,'D' ,13,'D' ,0,0 ,0,0 ,0,0 ,3.5,  6 ,'Spinning Slash', 'W-CurS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurS-3', 'Shamshir',108,42 ,0,31 ,0,31 ,0,31 ,0,31 ,100,28 ,7,'D' ,13,'D' ,0,0 ,0,0 ,0,0 ,3.5,  6 ,'Spinning Slash', 'W-CurS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurS-4', 'Grossmesser',115,46 ,0,34 ,0,34 ,0,34 ,0,34 ,100,28 ,14,'D' ,12,'D' ,0,0 ,0,0 ,0,0 ,4.5,  6 ,'Spinning Slash', 'W-CurS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurS-5', 'Bandits Curved Sword',118,48 ,0,36 ,0,36 ,0,36 ,0,36 ,100,30 ,11,'D' ,13,'D' ,0,0 ,0,0 ,0,0 ,5.0,  6,'Spinning Slash', 'W-CurS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurS-6', 'Shotel',96,37 ,0,27 ,0,27 ,0,27 ,0,27 ,100,22 ,9,'E' ,19,'D' ,0,0 ,0,0 ,0,0 ,2.0,  6 ,'Spinning Slash', 'W-CurS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurS-7', 'Scavengers Curved Sword',105,40 ,0,30 ,0,30 ,0,30 ,0,30 ,100,25 ,9,'D' ,14,'D' ,0,0 ,0,0 ,0,0 ,3.5,  6 ,'Spinning Slash', 'W-CurS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurS-8', 'Mantis Blade',112,44 ,0,33 ,0,33 ,0,33 ,0,33 ,100,27 ,10,'D' ,12,'D' ,0,0 ,0,0 ,0,0 ,4.0,  6 ,'Spinning Slash', 'W-CurS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurS-9', 'Beastmans Curved Sword',113,44 ,0,33 ,0,33 ,0,33 ,0,33 ,100,27 ,13,'C' ,11,'E' ,0,0 ,0,0 ,0,0 ,4.0,  6 ,'Spinning Slash', 'W-CurS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurS-10', 'Flowing Curved Sword',109,42 ,0,31 ,0,31 ,0,31 ,0,31 ,100,26 ,9,'D' ,17,'D' ,0,0 ,0,0 ,0,0 ,3.5,  6 ,'Spinning Slash', 'W-CurS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurS-11', 'Serpent-Gods Curved Sword',113,44 ,0,33 ,0,33 ,0,33 ,0,33 ,100,27 ,13,'D' ,9,'E' ,0,0 ,0,0 ,0,0 ,4 , 6 ,'Spinning Slash', 'W-CurS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurS-12', 'Magma Blade',96,44 ,0,30 ,62,44 ,0,30 ,0,30 ,100,27 ,9,'D' ,15,'D' ,0,0 ,16,'D' ,0,0 ,4.0,  12,'Magma Shower', 'W-CurS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurS-13', 'Nox Flowing Sword',112,40 ,0,30 ,0,30 ,0,30 ,0,30 ,100,25 ,8,'E' ,15,'D' ,0,0 ,0,0 ,0,0 ,3.5,  9,'Flowing Form', 'W-CurS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurS-14', 'Wing of Astel',65,28 ,78,52 ,0,23 ,0,23 ,0,23 ,100,23 ,7,'E' ,17,'D' ,20,'D' ,0,0 ,0,0 ,2.5,  2.5,'Nebula', 'W-CurS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('CurS-15', 'Eclipse Shotel',77,35 ,0,25 ,0,25 ,0,25 ,77,50 ,100,25 ,10,'E' ,25,'D' ,0,0 ,30,'D' ,0,0 ,3.0,  16 ,'Death Flare', 'W-CurS')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Fist-1', 'Caestus',90,35 ,0,20 ,0,20 ,0,20 ,0,20 ,100,20 ,8,'D' ,8,'D' ,0,0 ,0,0 ,0,0 ,1.5,  9,'Endure', 'W-Fist')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Fist-2', 'Spiked Caestus',91,35 ,0,20 ,0,20 ,0,20 ,0,20 ,100,20 ,8,'D' ,10,'D' ,0,0 ,0,0 ,0,0 ,2 , 9,'Endure', 'W-Fist')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Fist-3', 'Katar',97,36 ,0,21 ,0,21 ,0,21 ,0,21 ,110,21 ,8,'D' ,10,'D' ,0,0 ,0,0 ,0,0 ,2.5,  14,'Impaling Thrust', 'W-Fist')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Fist-4', 'Iron Ball',101,38 ,0,22 ,0,22 ,0,22 ,0,22 ,100,22 ,11,'D' ,8,'E' ,0,0 ,0,0 ,0,0 ,2.5,  16,'Braggarts Roar', 'W-Fist')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Fist-5', 'Star Fist',105,41 ,0,23 ,0,23 ,0,23 ,0,23 ,0,23 ,12,'D' ,8,'E' ,0,0 ,0,0 ,0,0 ,3.0,  9,'Endure', 'W-Fist')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Fist-6', 'Clinging Bone',80,31 ,24,36 ,0,17 ,0,17 ,0,17 ,100,21 ,8,'E' ,22,'C' ,0,0 ,0,0 ,16,'D' ,3.0,  14,'Lifesteal Fist', 'W-Fist')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Fist-7', 'Veterans Prosthesis',83,30 ,0,20 ,0,20 ,53,48 ,0,20 ,100,24 ,15,'D' ,12,'D' ,0,0 ,0,0 ,0,0 ,4,  15,'Storm Kick', 'W-Fist')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Fist-8', 'Cipher Pata',0,9 ,0,14 ,0,14 ,0,14 ,85,61 ,100,19 ,0,0 ,0,0 ,0,0 ,30,'C' ,0,0 ,0.1,  17,'Unblockable Blade', 'W-Fist')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Fist-9', 'Grafted Dragon',89,27 ,0,18 ,57,44 ,0,18 ,0,18 ,100,22 ,20,'D' ,14,'D' ,0,0 ,16,'D' ,0,0 ,2.5,  20,'Bear Witness!', 'W-Fist')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Flai-1', 'Flail',109,36 ,0,24 ,0,24 ,0,24 ,0,24 ,100,20 ,10,'D' ,18,'D' ,0,0 ,0,0 ,0,0 ,5.0,  8 ,'Spinning Chain', 'W-Flai')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Flai-2', 'Nightrider Flail',112,37 ,0,25 ,0,25 ,0,25 ,0,25 ,100,21 ,10,'E' ,24,'C' ,0,0 ,0,0 ,0,0 ,6.0,  8 ,'Spinning Chain', 'W-Flai')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Flai-3', 'Chainlink Flail',109,43 ,0,28 ,0,28 ,0,28 ,0,28 ,100,24 ,18,'C' ,12,'E' ,0,0 ,0,0 ,0,0 ,8,  8 ,'Spinning Chain', 'W-Flai')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Flai-4', 'Family Heads',87,37 ,56,36 ,0,26 ,0,26 ,0,26 ,100,20 ,8,'E' ,18,'C' ,16,'E' ,0,0 ,0,0 ,5.5,  25,'Familial Rancor', 'W-Flai')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Flai-5', 'Bastards Stars',65,32 ,78,48 ,0,24 ,0,24 ,0,24 ,100,20 ,8,'E' ,22,'D' ,22,'C' ,0,0 ,0,0 ,5.5,  25,'Nebula', 'W-Flai')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GAxe-1', 'Greataxe',151,69 ,0,37 ,0,37 ,0,37 ,0,37 ,100,45 ,30,'D' ,8,'D' ,0,0 ,0,0 ,0,0 ,13.0,  16,'Barbaric Roar', 'W-GAxe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GAxe-2', 'Crescent Moon Axe',146,68 ,0,36 ,0,36 ,0,36 ,0,36 ,100,44 ,25,'D' ,15,'D' ,0,0 ,0,0 ,0,0 ,12.5,  16,'War Cry', 'W-GAxe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GAxe-3', 'Longhaft Axe',146,68 ,0,36 ,0,36 ,0,36 ,0,36 ,100,44 ,24,'D' ,8,'D' ,0,0 ,0,0 ,0,0 ,12.5,  12,'War Cry', 'W-GAxe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GAxe-4', 'Executioners Greataxe',150,74 ,0,40 ,0,40 ,0,40 ,0,40 ,115,48 ,34,'C' ,8,'E' ,0,0 ,0,0 ,0,0 ,15 , 16,'War Cry', 'W-GAxe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GAxe-5', 'Great Omenkiller Cleaver',142,63 ,0,33 ,0,33 ,0,33 ,0,45 ,100,42 ,23,'D' ,12,'D' ,0,0 ,0,0 ,0,0 ,11.0,  2 ,'Wild Strike', 'W-GAxe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GAxe-6', 'Rusted Anchor',147,68 ,0,36 ,0,36 ,0,36 ,0,36 ,100,44 ,26,'C' ,9,'E' ,0,0 ,0,0 ,0,0 ,12.5,  16,'Barbaric Roar', 'W-GAxe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GAxe-7', 'Butchering Knife',134,58 ,0,31 ,0,31 ,0,31 ,96,31 ,100,37 ,16,'E' ,20,'C' ,0,0 ,0,0 ,0,0 ,8.5,  16,'Barbaric Roar', 'W-GAxe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GAxe-8', 'Gargoyles Great Axe',123,58 ,0,31 ,0,31 ,0,31 ,0,31 ,100,37 ,24,'C' ,8,'E' ,0,0 ,0,0 ,0,0 ,8.5,  16,'War Cry', 'W-GAxe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GAxe-9', 'Gargoyles Black Axe',100,49 ,0,27 ,0,27 ,0,27 ,120,54 ,100,37 ,24,'D' ,8,'E' ,0,0 ,22,'D' ,0,0 ,8.5,  16,'War Cry', 'W-GAxe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GAxe-10', 'Winged Greathorn',130,65 ,0,35 ,0,35 ,0,35 ,0,35 ,100,42 ,30,'D' ,20,'D' ,0,0 ,0,0 ,0,0 ,11.0,  12,'Soul Stifler', 'W-GAxe')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GAxe-11', 'Axe of Godrick',142,65 ,0,35 ,0,35 ,0,35 ,0,35 ,100,42 ,34,'D' ,22,'D' ,0,0 ,0,0 ,0,0 ,11 , 15 ,'I Command Thee,Knel!', 'W-GAxe')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GHam-1', 'Large Club',131,60 ,0,32 ,0,32 ,0,32 ,0,32 ,100,38 ,22,'C' ,0,0 ,0,0 ,0,0 ,0,0 ,8.5,  16,'Barbaric Roar', 'W-GHam')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GHam-2', 'Curved Great Club',145,68 ,0,36 ,0,36 ,0,36 ,0,36 ,100,44 ,24,'D' ,10,'D' ,0,0 ,0,0 ,0,0 ,10.0,   16,'Barbaric Roar', 'W-GHam')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GHam-3', 'Great Mace',134,71 ,0,38 ,0,38 ,0,38 ,0,38 ,100,46 ,28,'C' ,0,0 ,0,0 ,0,0 ,0,0 ,11.5,  9,'Endure', 'W-GHam')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GHam-4', 'Pickaxe',144,68 ,0,36 ,0,36 ,0,36 ,0,36 ,100,44 ,22,'D' ,10,'D' ,0,0 ,0,0 ,0,0 ,10.0,  9,'Endure', 'W-GHam')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GHam-5', 'Brick Hammer',122,74 ,0,40 ,0,40 ,0,40 ,0,40 ,100,48 ,31,'B' ,0,0 ,0,0 ,0,0 ,0,0 ,12.5,  16,'Barbaric Roar', 'W-GHam')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GHam-6', 'Battle Hammer',131,68 ,0,36 ,0,36 ,0,36 ,0,36 ,100,44 ,26,'C' ,8,'E' ,0,0 ,0,0 ,0,0 ,10.0,  16,'Braggarts Roar', 'W-GHam')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GHam-7', 'Rotten Battle Hammer',126,68 ,0,36 ,0,36 ,0,36 ,0,36 ,100,44 ,26,'C' ,8,'E' ,0,0 ,0,0 ,0,0 ,10.0,  16,'Braggarts Roar', 'W-GHam')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GHam-8', 'Celebrants Skull',138,63 ,0,34 ,0,34 ,0,34 ,0,34 ,100,40 ,18,'E' ,12,'D' ,0,0 ,0,0 ,0,0 ,8.5,  16,'Barbaric Roar', 'W-GHam')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GHam-9', 'Great Stars',135,68 ,0,36 ,0,36 ,0,36 ,0,36 ,100,44 ,22,'D' ,12,'D' ,0,0 ,0,0 ,0,0 ,10.0,  9,'Endure', 'W-GHam')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GHam-10', 'Greathorn Hammer',134,65 ,0,35 ,0,35 ,0,35 ,0,35 ,100,42 ,22,'D' ,10,'D' ,0,0 ,0,0 ,0,0 ,10.0,  16,'Barbaric Roar', 'W-GHam')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GHam-11', 'Envoys Long Horn',120,58 ,0,31 ,0,31 ,0,31 ,78,42 ,100,39 ,23,'D' ,11,'D' ,0,0 ,18,'D' ,0,0 ,9.5,  12,'Bubble Shower', 'W-GHam')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GHam-12', 'Cranial Vessel Candlestand',98,71 ,0,37 ,98,51 ,0,37 ,0,37 ,100,48 ,26,'D' ,8,'E' ,0,0 ,22,'D' ,0,0 ,12.5,  15 ,'Surge of Faith', 'W-GHam')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GHam-13', 'Beastclaw Greathammer',116,62 ,0,33 ,0,33 ,0,33 ,0,33 ,100,42 ,20,'D' ,10,'D' ,0,0 ,18,'D' ,0,0 ,9.0,  20,'Regal Beastclaw', 'W-GHam')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GHam-14', 'Devourers Scepter',112,62 ,0,33 ,69,45 ,0,33 ,0,33 ,100,42 ,24,'D' ,20,'D' ,0,0 ,25,'D' ,0,0 ,11.5,  35,'Devourer of Worlds', 'W-GHam')

GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-1', 'Astrologers Staff',25,25  ,0,15 ,0,15 ,0,15 ,0,15 ,100,15 ,7,'E' ,0,0 ,16,'C' ,0,0 ,0,0 , 3, 'W-GLin')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-2', 'Glintstone Staff',25,25  ,0,15 ,0,15 ,0,15 ,0,15 ,100,15 ,6,'E' ,0,0 ,10,'C' ,0,0 ,0,0,  3, 'W-GLin')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-3', 'Academy Glintstone Staff',25,25   ,0,15 ,0,15 ,0,15 ,0,15 ,100,15 ,6,'E' ,0,0 ,28,'B' ,0,0 ,0,0 , 3, 'W-GLin')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-4', 'Carian Regal Scepter',24,25   ,0,15 ,0,15 ,0,15 ,0,15 ,100,15 ,8,'E' ,10,'E' ,60,'B' ,0,0 ,0,0,  3, 'W-GLin')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-5', 'Diggers Staff',38,28  ,0,17 ,0,17 ,0,17 ,0,17 ,100,17 ,8,'C' ,0,0 ,12,'D' ,0,0 ,0,0  ,4.5, 'W-GLin')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-6', 'Demi-Human Queens Staff',31,25   ,0,15 ,0,15 ,0,15 ,0,15 ,0,15 ,6,'D' ,0,0 ,10,'C' ,0,0 ,0,0 , 3, 'W-GLin')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-7', 'Azurs Glintstone Staff',24,25  ,0,15 ,0,15 ,0,15 ,0,15 ,100,15 ,10,'D' ,0,0 ,52,'B' ,0,0 ,0,0 , 4, 'W-GLin')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-8', 'Lusats Glintstone Staff',24,25  ,0,15 ,0,15 ,0,15 ,0,15 ,100,15 ,10,'D' ,0,0 ,52,'B' ,0,0 ,0,0  ,4, 'W-GLin')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-9', 'Carian Glintstone Staff',25,25   ,0,15 ,0,15 ,0,15 ,0,15 ,100,15 ,6,'E' ,8,0 ,24,'C' ,0,0 ,0,0  ,3, 'W-GLin')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-10', 'Carian Glintblade Staff',22,23  ,0,14 ,0,14 ,0,14 ,0,14 ,100,14 ,6,'E' ,12,'E' ,22,'C' ,0,0 ,0,0  ,2.5, 'W-GLin')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-11', 'Albinauric Staff',17,23  ,0,14 ,0,14 ,0,14 ,0,14 ,100,14 ,6,'E' ,0,0 ,10,'D' ,0,0 ,12,'C'  ,2.5, 'W-GLin')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-12', 'Staff of Loss',22,23   ,0,14 ,0,14 ,0,14 ,0,14 ,100,14 ,6,'E' ,12,'E' ,14,'C' ,0,0 ,0,0 , 2.5, 'W-GLin')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-13', 'Gelmir Glintstone Staff',29,23  ,0,14 ,0,14 ,0,14 ,0,14 ,100,14 ,6,'E' ,0,0 ,14,'D' ,14,'D' ,0,0 , 2.5, 'W-GLin')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-14', 'Crystal Staff',31,28  ,0,17 ,0,17 ,0,17 ,0,17 ,100,17 ,8,'D' ,0,0 ,48,'B' ,0,0 ,0,0 , 4.5, 'W-GLin')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-15', 'Rotten Crystal Staff',42,28  ,0,17 ,0,17 ,0,17 ,0,17 ,100,17 ,8,'D' ,0,0 ,48,'B' ,0,0 ,0,0 , 4.5, 'W-GLin')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-16', 'Meteorite Staff',39,28 ,0,17 ,0,17 ,0,17 ,0,17 ,100,17 ,6,'D' ,0,0 ,18,'A' ,0,0 ,0,0 , 4.5, 'W-GLin')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-17', 'Staff of the Guilty',38,28 ,0,17 ,0,17 ,0,17 ,0,17 ,100,17 ,8,'D' ,0,0 ,0,0 ,12,'C' ,0,0  ,4.5, 'W-GLin')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,ET_ID)
VALUES ('GLin-18', 'Prince of Deaths Staff',25,25 ,0,15 ,0,15 ,0,15 ,0,15 ,100,15 ,6,'E' ,0,0 ,18,'D' ,18,'D' ,0,0 , 3, 'W-GLin')

GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-1', 'Bastard Sword',138,65 ,0,35 ,0,35 ,0,35 ,0,35 ,100,42 ,16,'D' ,10,'D' ,0,0 ,0,0 ,0,0 ,9 , 5 ,'Stamp (Upward Cut)', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-2', 'Claymore',138,65 ,0,35 ,0,35 ,0,35 ,0,35 ,100,42 ,16,'D' ,13,'D' ,0,0 ,0,0 ,0,0 ,9  ,20,'Lions Claw', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-3', 'Iron Greatsword',149,73 ,0,39 ,0,39 ,0,39 ,0,39 ,100,47 ,18,'C' ,10,'E' ,0,0 ,0,0 ,0,0 ,12 , 5 ,'Stamp (Upward Cut)', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-4', 'Lordsworns Greatsword',136,65 ,0,35 ,0,35 ,0,35 ,0,35 ,110,42 ,16,'D' ,10,'D' ,0,0 ,0,0 ,0,0 ,9,  5 ,'Stamp (Upward Cut)', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-5', 'Knights Greatsword',141,68 ,0,36 ,0,36 ,0,36 ,0,36 ,100,44 ,16,'D' ,12,'D' ,0,0 ,0,0 ,0,0 ,10 , 5 ,'Stamp (Upward Cut)', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-6', 'Banished Knights Greatsword',142,68 ,0,36 ,0,36 ,0,36 ,0,36 ,100,44 ,17,'D' ,9,'D' ,0,0 ,0,0 ,0,0 ,10,  5 ,'Stamp (Upward Cut)', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-7', 'Forked Greatsword',124,61 ,0,33 ,0,33 ,0,33 ,0,33 ,100,39 ,14,'D' ,16,'D' ,0,0 ,0,0 ,0,0 ,9,  5,'Stamp (Upward Cut)', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-8', 'Flamberge',129,65 ,0,35 ,0,35 ,0,35 ,0,35 ,100,42 ,15,'D' ,14,'C' ,0,0 ,0,0 ,0,0 ,10 , 5 ,'Stamp (Upward Cut)', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-9', 'Gargoyles Greatsword',133,71 ,0,38 ,0,38 ,0,38 ,0,38 ,100,46 ,18,'C' ,10,'E' ,0,0 ,0,0 ,0,0 ,11.5,  18,'Vacuum Slice', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-10', 'Gargoyles Blackblade',102,60 ,0,33 ,0,33 ,0,33 ,122,66 ,100,46 ,18,'D' ,10,'E' ,0,0 ,22,'D' ,0,0 ,11.5,  20,'Corpse Wax Cutter', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-11', 'Inseparable Sword',98,59 ,0,34 ,0,34 ,0,34 ,98,52 ,100,44 ,18,'D' ,18,'D' ,0,0 ,20,'C' ,0,0 ,10 , 19,'Sacred Blade', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-12', 'Sword of Milos',141,68 ,0,36 ,0,36 ,0,36 ,0,36 ,100,44 ,15,'D' ,19,'D' ,0,0 ,0,0 ,0,0 ,10 , 30,'Shriek of Milos', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-13', 'Marais Executioners Sword',94,68 ,61,49 ,0,36 ,0,36 ,0,36 ,100,46 ,24,'C' ,14,'E' ,0,0 ,0,0 ,23,'D' ,11.5,  15,'Eochaids Dancing', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-14', 'Ordoviss Greatsword',107,69 ,0,37 ,0,37 ,0,37 ,69,50 ,100,47 ,25,'C' ,13,'E' ,0,0 ,15,'D' ,0,0 ,12,  15,'Ordoviss Vortex', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-15', 'Alabaster Lords Sword',128,56 ,38,33 ,0,27 ,0,27 ,0,27 ,100,39 ,16,'D' ,12,'E' ,18,'D' ,0,0 ,0,0 ,8  ,15,'Alabaster Lords Pull', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-16', 'Deaths Poker',123,60 ,36,39 ,0,33 ,0,33 ,0,33 ,100,39 ,15,'D' ,17,'D' ,11,'E' ,0,0 ,0,0 ,8.5,  15,'Ghostflame Ignition', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-17', 'Helphens Steeple',101,66 ,101,60 ,0,33 ,0,33 ,0,33 ,100,46 ,19,'D' ,10,'E' ,22,'D' ,0,0 ,0,0 ,11.5,  20,'Ruinous Ghostflame', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-18', 'Blasphemous Blade',121,72 ,0,39 ,78,54 ,0,39 ,0,39 ,100,50 ,22,'D' ,15,'D' ,0,0 ,21,'D' ,0,0 ,13.5,  30,'Takers Flames', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-19', 'Golden Order Greatsword',86,55 ,0,30 ,0,30 ,0,30 ,103,60 ,100,42 ,16,'E' ,21,'D' ,0,0 ,28,'C' ,0,0 ,10  ,20,'Establish Order', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-20', 'Dark Moon Greatsword',82,57 ,98,63 ,0,31 ,0,31 ,0,31 ,100,44 ,16,'D' ,11,'D' ,38,'C' ,0,0 ,0,0 ,10 , 40,'Moonlight Greatsword', 'W-GrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('GrS-21', 'Sacred Relic Sword',118,62 ,0,33 ,0,33 ,0,33 ,76,45 ,110,42 ,14,'E' ,24,'D' ,0,0 ,22,'D' ,0,0 ,11 , 50,'Wave of Gold', 'W-GrS')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Gspr-1', 'Lance',123,57 ,0,36 ,0,36 ,0,36 ,0,36 ,100,44 ,20,'D' ,14,'D' ,0,0 ,0,0 ,0,0 ,9, 13,'Charge Forth', 'W-Gspr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Gspr-2', 'Treespear',122,55 ,0,35 ,0,35 ,0,35 ,79,48 ,100,45 ,15,'D' ,22,'D' ,0,0 ,18,'D' ,0,0 ,9.5,  18,'Sacred Order', 'W-Gspr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Gspr-3', 'Serpent-Hunter',111,72 ,0,42 ,0,42 ,0,42 ,0,42 ,100,50 ,0,'B' ,0,'E' ,0,0 ,0,0 ,0,0 ,12 , 15,'Great-Serpent Hunt', 'W-Gspr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Gspr-4', 'Silurias Tree',90,51 ,0,36 ,0,36 ,0,36 ,90,55 ,100,46 ,27,'D' ,13,'E' ,0,0 ,20,'D' ,0,0 ,10 , 25,'Silurias Woe', 'W-Gspr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Gspr-5', 'Vykes War Spear',103,52 ,0,33 ,66,45 ,0,33 ,0,33 ,100,42 ,16,'E' ,20,'C' ,0,0 ,18,'D' ,0,0 ,8 , 22,'Frenzyflame Thrust', 'W-Gspr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Gspr-6', 'Mohgwyns Sacred Spear',96,57 ,0,38 ,62,38 ,0,38 ,0,38 ,100,46 ,24,'D' ,14,'E' ,0,0 ,0,0 ,27,'D' ,10 , 20 ,'Bloodboon Ritual', 'W-Gspr')


GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Hal-1', 'Halberd',125,55 ,0,35 ,0,35 ,0,35 ,0,35 ,100,42 ,14,'D' ,12,'D' ,0,0 ,0,0 ,0,0 ,8,  16,'Charge Forth', 'W-Hal')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Hal-2', 'Banished Knights Halberd',125,55 ,0,35 ,0,35 ,0,35 ,0,35 ,100,42 ,14,'D' ,12,'D' ,0,0 ,0,0 ,0,0 ,8,  16,'Charge Forth', 'W-Hal')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Hal-3', 'Lucerne',121,52 ,0,33 ,0,33 ,0,33 ,0,33 ,100,39 ,15,'D' ,12,'C' ,0,0 ,0,0 ,0,0 ,7 , 16,'Charge Forth', 'W-Hal')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Hal-4', 'Glaive',132,60 ,0,38 ,0,38 ,0,38 ,0,38 ,100,46 ,18,'D' ,15,'D' ,0,0 ,0,0 ,0,0 ,10 , 6,'Spinning Slash', 'W-Hal')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Hal-5', 'Vulgar Militia Shotel',121,55 ,0,35 ,0,35 ,0,35 ,0,35 ,0,42 ,14,'E' ,16,'C' ,0,0 ,0,0 ,0,0 ,8.0,  6 ,'Spinning Slash', 'W-Hal')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Hal-6', 'Vulgar Militia Saw',126,55 ,0,35 ,0,35 ,0,35 ,0,35 ,100,42 ,15,'D' ,13,'D' ,0,0 ,0,0 ,0,0 ,8.0,6,  'Spinning Slash', 'W-Hal')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Hal-7', 'Guardians Swordspear',139,57 ,0,36 ,0,36 ,0,36 ,0,36 ,100,44 ,17,'E' ,16,'C' ,0,0 ,0,0 ,0,0 ,9.0,  6 ,'Spinning Slash', 'W-Hal')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Hal-8', 'Gargoyles Halberd',131,66 ,0,42 ,0,42 ,0,42 ,0,42 ,100,50 ,26,'C' ,10,'E' ,0,0 ,0,0 ,0,0 ,12.0,  6 ,'Spinning Slash', 'W-Hal')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Hal-9', 'Gargoyles Black Halberd',103,54 ,0,36 ,0,36 ,0,36 ,123,72 ,100,50 ,26,'C' ,10,'E' ,0,0 ,22,'D' ,0,0 ,12.0,  6 ,'Spinning Slash', 'W-Hal')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Hal-10', 'Nightrider Glaive',129,66 ,0,42 ,0,42 ,0,42 ,0,42 ,100,50 ,26,'C' ,10,'E' ,0,0 ,0,0 ,0,0 ,12.0,  6 ,'Spinning Slash', 'W-Hal')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Hal-11', 'Pests Glaive',120,52 ,0,33 ,0,33 ,0,33 ,0,33 ,100,39 ,13,'D' ,13,'D' ,0,0 ,0,0 ,0,0 ,7,  6 ,'Spinning Slash', 'W-Hal')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Hal-12', 'Ripple Crescent Halberd',86,56 ,0,35 ,0,35 ,0,35 ,0,35 ,100,43 ,12,0 ,12,0 ,0,0 ,0,0 ,20,'B' ,8.5,  6 ,'Spinning Slash', 'W-Hal')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Hal-13', 'Golden Halberd',134,65 ,0,41 ,0,41 ,0,41 ,87,56 ,100,52 ,30,'D' ,14,'E' ,0,0 ,12,'D' ,0,0 ,13.5,  40,'Golden Vow', 'W-Hal')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Hal-14', 'Dragon Halberd',135,58 ,0,37 ,0,37 ,0,50 ,0,37 ,100,47 ,22,'D' ,10,'D' ,0,0 ,0,0 ,0,0 ,10.5,  17 ,'Spinning Slash', 'W-Hal')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Hal-15', 'Lorettas War Sickle',110,57 ,71,49 ,0,36 ,0,36 ,0,36 ,100,46 ,20,'D' ,15,'D' ,20,'D' ,0,0 ,0,0 ,10,  14,'Lorettas Slash', 'W-Hal')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Hal-16', 'Commanders Standard',138,64 ,0,41 ,0,41 ,0,41 ,0,41 ,100,49 ,24,'D' ,14,'D' ,0,0 ,0,0 ,0,0 ,11.5,  30,'Rallying Standard', 'W-Hal')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Ham-1', 'Club',103,41 ,0,27 ,0,27 ,0,27 ,0,27 ,100,27 ,10,'C' ,0,0 ,0,0 ,0,0 ,0,0 ,5.0,  16,'Barbaric Roar', 'W-Ham')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Ham-2', 'Curved Club',114,45 ,0,30 ,0,30 ,0,30 ,0,30 ,100,30 ,11,'D' ,7,'E' ,0,0 ,0,0 ,0,0 ,5 , 16,'Barbaric Roar', 'W-Ham')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Ham-3', 'Spiked Club',114,45 ,0,30 ,0,30 ,0,30 ,0,30 ,100,30 ,12,'D' ,7,'D' ,0,0 ,0,0 ,0,0 ,5.0,  16,'Barbaric Roar', 'W-Ham')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Ham-4', 'Stone Club',122,52 ,0,35 ,0,35 ,0,35 ,0,35 ,100,36 ,16,'C' ,8,'E' ,0,0 ,0,0 ,0,0 ,7,  0,'Kick', 'W-Ham')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Ham-5', 'Mace',115,45 ,0,30 ,0,30 ,0,30 ,0,30 ,100,30 ,12,'D' ,7,'D' ,0,0 ,0,0 ,0,0 ,4.5,  0,'Kick', 'W-Ham')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Ham-6', 'Morning Star',118,47 ,0,31 ,0,31 ,0,31 ,0,31 ,100,31 ,12,'D' ,8,'D' ,0,0 ,0,0 ,0,0 ,5.0,  0,'Kick', 'W-Ham')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Ham-7', 'Warpick',108,40 ,0,27 ,0,27 ,0,27 ,0,27 ,100,27 ,11,'D' ,9,'D' ,0,0 ,0,0 ,0,0 ,2.5,  0,'Kick', 'W-Ham')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Ham-8', 'Hammer',124,51 ,0,34 ,0,34 ,0,34 ,0,34 ,100,36 ,14,'D' ,7,'D' ,0,0 ,0,0 ,0,0 ,6.5,  0,'Kick', 'W-Ham')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Ham-9', 'Monks Flamemace',126,49 ,0,33 ,0,33 ,0,33 ,0,33 ,100,33 ,13,'E' ,13,'D' ,0,0 ,0,0 ,0,0 ,6.0,  0,'Kick', 'W-Ham')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Ham-10', 'Varres Bouquet',46,38 ,0,25 ,0,25 ,0,25 ,0,25 ,100,25 ,8,'E' ,16,'D' ,0,0 ,0,0 ,24,'C' ,2 , 14,'Blood Tax', 'W-Ham')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Ham-11', 'Envoys Horn',96,38 ,0,26 ,0,26 ,0,26 ,62,38 ,100,28 ,10,'D' ,12,'D' ,0,0 ,16,'D' ,0,0 ,4.0,  6,'Oracular Bubble', 'W-Ham')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Ham-12', 'Nox Flowing Hammer',122,51 ,0,34 ,0,34 ,0,34 ,0,34 ,100,34 ,17,'B' ,7,'D' ,0,0 ,0,0 ,0,0 ,6.5,  16,'Silver Scourge', 'W-Ham')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Ham-13', 'Ringed Finger',121,38 ,0,26 ,0,26 ,0,26 ,0,38 ,100,28 ,15,'D' ,9,'D' ,0,0 ,0,0 ,0,0 ,4.5,  14,'Claw Flick', 'W-Ham')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Ham-14', 'Scepter of the All-Knowing',99,36 ,64,36 ,0,25 ,0,25 ,0,25 ,100,27 ,12,'E' ,18,'D' ,21,'D' ,0,0 ,0,0 ,4.5,  35,'Knowledge Above All', 'W-Ham')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Ham-15', 'Marikas Hammer',101,44 ,0,30 ,0,30 ,0,30 ,65,44 ,100,33 ,20,'D' ,12,'D' ,0,0 ,19,'D' ,0,0 ,6 , 31,'Gold Breaker', 'W-Ham')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('HThrS-1', 'Great Epee',124,52 ,0,36 ,0,36 ,0,36 ,0,36 ,100,31 ,15,'D' ,16,'D' ,0,0 ,0,0 ,0,0 ,6.5,  14,'Impaling Thrust', 'W-HThrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('HThrS-2', 'Godskin Stitcher',127,55 ,0,38 ,0,38 ,0,38 ,0,38 ,100,33 ,14,'D' ,17,'D' ,0,0 ,0,0 ,0,0 ,7 , 9,'Impaling Thrust', 'W-HThrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('HThrS-3', 'Bloody Helice',121,57 ,0,40 ,0,40 ,0,40 ,0,40 ,100,34 ,16,'E' ,19,'D' ,0,0 ,0,0 ,17,'D' ,8.0,  5 ,'Dynasts Finesse', 'W-HThrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('HThrS-4', 'Dragon Kings Cragblade',92,46 ,0,32 ,0,32 ,59,46 ,0,32 ,100,34 ,18,'E' ,37,'D' ,0,0 ,0,0 ,0,0 ,8 , 35,'Thundercloud Form', 'W-HThrS')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Kata-1', 'Uchigatana',115,45 ,0,30 ,0,30 ,0,30 ,0,30 ,100,30 ,11,'D' ,15,'D' ,0,0 ,0,0 ,0,0 ,5.5,  10,'Unsheathe', 'W-Kata')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Kata-2', 'Nagakiba',115,49 ,0,33 ,0,33 ,0,33 ,0,33 ,100,33 ,18,'D' ,22,'C' ,0,0 ,0,0 ,0,0 ,7.0,  16,'Piercing Fang', 'W-Kata')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Kata-3', 'Serpentbone Blade',120,45 ,0,30 ,0,30 ,0,30 ,0,30 ,0,30 ,11,'E' ,22,'C' ,0,0 ,0,0 ,0,0 ,6.0,  6,'Double Slash', 'W-Kata')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Kata-4', 'Meteoric Ore Blade',112,50 ,72,45 ,0,31 ,0,31 ,0,31 ,100,33 ,15,'D' ,14,'E' ,18,'D' ,0,0 ,0,0 ,7.5,  13,'Gravitas', 'W-Kata')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Kata-5', 'Moonveil',73,31 ,87,57 ,0,26 ,0,26 ,0,26 ,100,31 ,12,'E' ,18,'D' ,23,'C' ,0,0 ,0,0 ,6.5,  6.5,'Transient Moonlight', 'W-Kata')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Kata-6', 'Rivers of Blood',76,36 ,0,26 ,76,52 ,0,26 ,0,26 ,100,31 ,12,'E' ,18,'D' ,0,0 ,0,0 ,20,'D' ,6.5,  17 ,'Corpse Piler', 'W-Kata')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Kata-7', 'Dragonscale Blade',110,35 ,0,25 ,0,25 ,0,50 ,0,25 ,100,30 ,12,'D' ,20,'C' ,0,0 ,0,0 ,0,0 ,5.5,  25,'Ice Lightning Sword', 'W-Kata')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Kata-8', 'Hand of Malenia',117,49 ,0,33 ,0,33 ,0,33 ,0,33 ,100,33 ,16,'E' ,48,'C' ,0,0 ,0,0 ,0,0 ,7.0,  9 ,'Waterfowl Dance', 'W-Kata')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Reap-1', 'Scythe',125,45 ,0,30 ,0,30 ,0,30 ,0,30 ,100,30 ,14,'E' ,14,'C' ,0,0 ,0,0 ,0,0 ,7.5,  6 ,'Spinning Slash', 'W-Reap')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Reap-2', 'Grave Scythe',144,49 ,0,33 ,0,33 ,0,33 ,0,33 ,100,33 ,17,'D' ,13,'D' ,0,0 ,0,0 ,0,0 ,9.5,  6 ,'Spinning Slash', 'W-Reap')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Reap-3', 'Halo Scythe',118,42 ,0,29 ,0,29 ,0,29 ,76,42 ,100,31 ,13,'D' ,16,'D' ,0,0 ,15,'E' ,0,0 ,8.5,  11 ,'Miquellas Ring Light', 'W-Reap')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Reap-4', 'Winged Scythe',87,30 ,0,25 ,0,25 ,0,25 ,104,55 ,100,30 ,16,'E' ,16,'D' ,0,0 ,24,'D' ,0,0 ,7.5,  17,'Angels Wings', 'W-Reap')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Spr-1', 'Short Spear',112,40 ,0,25 ,0,25 ,0,25 ,0,25 ,100,30 ,10,'D' ,10,'D' ,0,0 ,0,0 ,0,0 ,4  ,0,'Impaling Thrust', 'W-Spr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Spr-2', 'Iron Spear',114,42 ,0,26 ,0,26 ,0,26 ,0,26 ,100,31 ,13,'D' ,11,'D' ,0,0 ,0,0 ,0,0 ,4.5,  16,'Charge Forth', 'W-Spr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Spr-3', 'Spear',114,42 ,0,26 ,0,26 ,0,26 ,0,26 ,100,31 ,12,'E' ,15,'C' ,0,0 ,0,0 ,0,0 ,4.5,  9,'Impaling Thrust', 'W-Spr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Spr-4', 'Partisan',123,48 ,0,30 ,0,30 ,0,30 ,0,30 ,100,36 ,15,'D' ,12,'D' ,0,0 ,0,0 ,0,0 ,6.5,  0,'Impaling Thrust', 'W-Spr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Spr-5', 'Pike',115,53 ,0,33 ,0,33 ,0,33 ,0,33 ,100,39 ,20,'D' ,14,'D' ,0,0 ,0,0 ,0,0 ,7.5,  16,'Charge Forth', 'W-Spr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Spr-6', 'Spiked Spear',120,46 ,0,28 ,0,28 ,0,28 ,0,28 ,100,34 ,14,'D' ,16,'D' ,0,0 ,0,0 ,0,0 ,6.0,  9,'Impaling Thrust', 'W-Spr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Spr-7', 'Cross-Naginata',122,52 ,0,32 ,0,32 ,0,32 ,0,32 ,100,39 ,16,'D' ,20,'C' ,0,0 ,0,0 ,0,0 ,8,  9,'Impaling Thrust', 'W-Spr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Spr-8', 'Claymans Harpoon',99,49 ,64,38 ,0,25 ,0,25 ,0,25 ,100,33 ,12,'D' ,10,'E' ,12,'D',0,0 ,0,0 ,5.5,  9,'Impaling Thrust', 'W-Spr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Spr-9', 'Celebrants Rib-Rake',109,40 ,0,25 ,0,25 ,0,25 ,0,25 ,100,33 ,8,'E' ,14,'D' ,0,0 ,0,0 ,0,0 ,5, 5, 'Barbaric Roar', 'W-Spr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Spr-10', 'Torchpole',104,48 ,0,26 ,31,33 ,0,26 ,0,26 ,100,34 ,14,'D' ,15,'E' ,0,0 ,0,'E' ,0,0 ,6 , 16,'Charge Forth', 'W-Spr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Spr-11', 'Inquisitors Girandole',102,56 ,0,28 ,66,43 ,0,28 ,0,28 ,100,37 ,18,'D' ,15,'D' ,0,0 ,16,'D' ,0,0 ,7.5,  16,'Charge Forth', 'W-Spr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Spr-12', 'Crystal Spear',110,48 ,33,33 ,0,26 ,0,26 ,0,26 ,100,33 ,10,'E' ,16,'D' ,16,'E' ,0,0 ,0,0 ,5.5,  5,'Impaling Thrust', 'W-Spr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Spr-13', 'Rotten Crystal Spear',104,48 ,31,33 ,0,26 ,0,26 ,0,26 ,100,33 ,10,'E' ,16,'D' ,16,'E' ,0,0 ,0,0 ,5.5,  16,'Charge Forth', 'W-Spr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Spr-14', 'Cleanrot Spear',102,49 ,0,25 ,0,25 ,0,25 ,66,38 ,100,33 ,16,'D' ,16,'D' ,0,0 ,14,'D' ,0,0 ,5.5,  12,'Sacred Phalanx', 'W-Spr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Spr-15', 'Death Ritual Spear',99,54 ,64,42 ,0,27 ,0,27 ,0,27 ,110,36 ,14,'E' ,20,'D' ,18,'D' ,0,0 ,0,0 ,6.5,  20,'Spearcall Ritual', 'W-Spr')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Spr-16', 'Bolt of Gransax',98,60 ,0,31 ,0,31 ,63,47 ,0,31 ,100,40 ,20,'D' ,40,'D' ,0,0 ,0,0 ,0,0 ,8.5,  35,'Ancient Lightning', 'W-Spr')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-1', 'Short Sword',102,42 ,0,28 ,0,28 ,0,28 ,0,28 ,100,28 ,8,'D' ,10,'D' ,0,0 ,0,0 ,0,0 ,3  ,0,'Kick', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-2', 'Longsword',110,45 ,0,30 ,0,30 ,0,30 ,0,30 ,100,30 ,10,'D' ,10,'D' ,0,0 ,0,0 ,0,0 ,3.5,6,'Square Off', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-3', 'Broadsword',117,47 ,0,31 ,0,31 ,0,31 ,0,31 ,100,31 ,10,'D' ,10,'E' ,0,0 ,0,0 ,0,0 ,4 , 8,'Square Off', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-4', 'Weathered Straight Sword',103,43 ,0,29 ,0,29 ,0,29 ,0,29 ,100,27 ,7,'D' ,10,'D' ,0,0 ,0,0 ,0,0 ,3  ,6 ,'Square Off', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-5', 'Lordsworns Straight Sword',115,45 ,0,30 ,0,30 ,0,30 ,0,30 ,110,30 ,10,'D' ,10,'D' ,0,0 ,0,0 ,0,0 ,3.5 ,8,'Square Off', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-6', 'Nobles Slender Sword',101,43 ,0,29 ,0,29 ,0,29 ,0,29 ,110,30 ,8,'E' ,11,'C' ,0,0 ,0,0 ,0,0 ,3.5, 8,'Square Off', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-7', 'Cane Sword',96,41 ,0,27 ,0,27 ,0,27 ,0,27 ,100,27 ,8,'E' ,11,'D' ,0,0 ,0,0 ,0,0 ,2.5, 8,'Square Off', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-8', 'Warhawks Talon',101,42 ,0,28 ,0,28 ,0,28 ,0,28 ,100,30 ,10,'D' ,16,'C' ,0,0 ,0,0 ,0,0 ,3  ,6,'Spinning Slash', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-9', 'Lazuli Glintstone Sword',79,30 ,94,55 ,0,25 ,0,25 ,0,25 ,100,30 ,8,'D' ,9,'E' ,13,'D' ,0,0 ,0,0 ,3.5,  8 ,'Glintstone Pebble', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-10', 'Carian Knights Sword',88,36 ,88,52 ,0,26 ,0,26 ,0,26 ,100,31 ,10,'D' ,10,'D' ,18,'D' ,0,0 ,0,0 ,4 , 26,'Carian Grandeur', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-11', 'Crystal Sword',106,44 ,68,44 ,0,30 ,0,30 ,0,30 ,100,33 ,13,'D' ,10,'E' ,15,'D' ,0,0 ,0,0 ,4.5,  6 ,'Spinning Slash', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-12', 'Rotten Crystal Sword',102,48 ,66,38 ,0,31 ,0,31 ,0,31 ,100,33 ,13,'D' ,10,'E' ,15,'D' ,0,0 ,0,0 ,4.5,  6 ,'Spinning Slash', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-13', 'Miquellan Knights Sword',105,40 ,0,28 ,0,28 ,0,28 ,68,40 ,100,30 ,11,'D' ,11,'D' ,0,0 ,16,'E' ,0,0 ,3.5,  19,'Sacred Blade', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-14', 'Ornamental Straight Sword',101,42 ,0,28 ,0,28 ,0,28 ,0,28 ,110,28 ,10,'E' ,14,'D' ,0,0 ,0,0 ,0,0 ,3  ,30,'Golden Tempering', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-15', 'Golden Epitaph',85,25 ,0,15 ,0,15 ,0,15 ,85,40 ,100,30 ,12,'D' ,10,'D' ,0,0 ,14,'D' ,0,0 ,3.5,  25,'Last Rites', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-16', 'Sword of St Trina',107,39 ,32,33 ,0,27 ,0,27 ,0,27 ,100,28 ,10,'D' ,12,'D' ,14,'E' ,0,0 ,0,0 ,3  ,20,'Mists of Slumber', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-17', 'Regalia of Eochaid',89,48 ,57,40 ,0,31 ,0,31 ,0,31 ,100,33 ,12,'E' ,18,'D' ,0,0 ,0,0 ,15,'D' ,5.5,  15,'Eochaids Dancing', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-18', 'Coded Sword',0,13 ,0,22 ,0,22 ,0,22 ,85,58 ,100,27 ,0,0 ,0,0 ,0,0 ,20,'B' ,0,0 ,2.5,  25,'Unblockable Blade', 'W-StrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('StrS-19', 'Sword of Night and Flame',87,36 ,56,42 ,56,42 ,0,26 ,0,26 ,100,31 ,12,'E' ,12,'E' ,24,'D' ,24,'D' ,0,0 ,4 ,8,'Night-and-Flame', 'W-StrS')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ThrS-1', 'Rapier',96,45 ,0,30 ,0,30 ,0,30 ,0,30 ,130,20 ,7,'E' ,12,'C' ,0,0 ,0,0 ,0,0 ,2.5,  14,'Impaling Thrust', 'W-ThrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ThrS-2', 'Estoc',107,54 ,0,36 ,0,36 ,0,36 ,0,36 ,100,24 ,11,'E' ,13,'C' ,0,0 ,0,0 ,0,0 ,4.5,  14,'Impaling Thrust', 'W-ThrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ThrS-3', 'Nobles Estoc',104,49 ,0,33 ,0,33 ,0,33 ,0,33 ,100,22 ,9,'D' ,10,'D' ,0,0 ,0,0 ,0,0 ,3.5,  9,'Impaling Thrust', 'W-ThrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ThrS-4', 'Cleanrot Knights Sword',109,51 ,0,34 ,0,34 ,0,34 ,0,34 ,100,23 ,11,'D' ,13,'D' ,0,0 ,0,0 ,0,0 ,4 , 13,'Impaling Thrust', 'W-ThrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ThrS-5', 'Rogiers Rapier',93,49 ,0,33 ,0,33 ,0,33 ,0,33 ,110,22 ,8,'E' ,17,'C' ,0,0 ,0,0 ,0,0 ,3.5,  7,'Repeating Thrust', 'W-ThrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ThrS-6', 'Antspur Rapier',98,47 ,0,31 ,0,31 ,0,31 ,0,31 ,100,25 ,10,'D' ,20,'D' ,0,0 ,0,0 ,0,0 ,3.0,  14,'Impaling Thrust', 'W-ThrS')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('ThrS-7', 'Frozen Needle',99,40 ,0,40 ,0,28 ,0,28 ,0,28 ,100,20 ,11,'E' ,18,'D' ,0,0 ,0,0 ,0,0 ,2.5,  14,'Impaling Thurst', 'W-ThrS')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Torc-1', 'Torch',54,21 ,0,15 ,97,25 ,0,15 ,0,15 ,100,19 ,5,'D' ,5,'D' ,0,0 ,0,0 ,0,0 ,1.5  ,0,'Torch Attack', 'W-Torc')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Torc-2', 'Beast-Repellent Torch',58,23 ,0,17 ,104,28 ,0,17 ,0,17 ,100,19 ,12,'C' ,8,'E' ,0,0 ,0,0 ,0,0 ,2.5 ,0,'Torch Attack', 'W-Torc')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Torc-3', 'Steel-Wire Torch',61,25 ,0,18 ,109,30 ,0,18 ,0,18 ,100,19 ,10,'D' ,8,'C' ,0,0 ,0,0 ,0,0 ,2.5,  8,'Firebreather', 'W-Torc')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Torc-4', 'Sentrys Torch',56,30 ,0,21 ,0,21 ,0,21 ,100,36 ,100,22 ,15,'D' ,8,'E' ,0,0 ,15,'D' ,0,0 ,5.0  ,0,'Torch Attack', 'W-Torc')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Torc-5', 'Ghostflame Torch',50,21 ,90,42 ,0,13 ,0,13 ,0,13 ,100,19 ,10,'E' ,10,'E' ,14,'D' ,0,0 ,0,0 ,2.5  ,0,'Torch Attack', 'W-Torc')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Torc-6', 'St Trinas Torch',51,25 ,0,15 ,91,40 ,0,15 ,0,15 ,100,20 ,10,'E' ,10,'D' ,0,0 ,14,'D' ,0,0 ,3.0,  15,'Fires of Slumber', 'W-Torc')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('TwB-1', 'Twinblade',119,45 ,0,30 ,0,30 ,0,30 ,0,30 ,100,30 ,10,'D' ,18,'D' ,0,0 ,0,0 ,0,0 ,7.0,  6,'Spinning Slash', 'W-TwB')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('TwB-2', 'Twinned Knight Swords',122,47 ,0,31 ,0,31 ,0,31 ,0,31 ,100,31 ,16,'D' ,18,'E' ,0,0 ,0,0 ,0,0 ,8.0,  6,'Spinning Slash', 'W-TwB')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('TwB-3', 'Godskin Peeler',121,47 ,0,31 ,0,31 ,0,31 ,0,31 ,100,31 ,17,'E' ,22,'C' ,0,0 ,0,0 ,0,0 ,8.0,  30,'Black Flame Tornado', 'W-TwB')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('TwB-4', 'Gargoyles Twinblade',123,48 ,0,32 ,0,32 ,0,32 ,0,32 ,100,32 ,18,'C' ,15,'E' ,0,0 ,0,0 ,0,0 ,8.5,  6 ,'Spinning Slash', 'W-TwB')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('TwB-5', 'Gargoyles Black Blades',81,32 ,0,26 ,0,26 ,0,26 ,97,59 ,100,32 ,18,'C' ,15,'E' ,0,0 ,22,'D' ,0,0 ,8.5,  6 ,'Spinning Slash', 'W-TwB')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('TwB-6', 'Eleonoras Poleblade',72,33 ,0,23 ,72,47 ,0,23 ,0,23 ,100,28 ,12,'E' ,21,'D' ,0,0 ,0,0 ,19,'D' ,6.0,  11,'Bloodblade Dance', 'W-TwB')
GO
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Whip-1', 'Whip',100,25 ,0,15 ,0,15 ,0,15 ,0,15 ,100,15 ,8,'D' ,14,'D' ,0,0 ,0,0 ,0,0 ,2.0  ,0,'Kick', 'W-Whip')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Whip-2', 'Thorned Whip',102,26 ,0,15 ,0,15 ,0,15 ,0,15 ,100,15 ,8,'E' ,16,'C' ,0,0 ,0,0 ,0,0 ,2.5  ,0,'Kick', 'W-Whip')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Whip-3', 'Urumi',101,27 ,0,16 ,0,16 ,0,16 ,0,16 ,100,15 ,10,'E' ,19,'C' ,0,0 ,0,0 ,0,0 ,3.0  ,0,'Kick', 'W-Whip')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Whip-4', 'Hoslows Petal Whip',110,28 ,0,17 ,0,17 ,0,17 ,0,17 ,100,17 ,10,'D' ,20,'D' ,0,0 ,0,0 ,0,0 ,3.5  ,0,'Kick', 'W-Whip')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Whip-5', 'Magma Whip Candlestick',72,21 ,0,10 ,72,36 ,0,10 ,0,10 ,100,15 ,8,'E' ,16,'D' ,0,0 ,18,'D' ,0,0 ,2.5,  5 ,'Sea of Magma', 'W-Whip')
INSERT INTO Equipment_info (E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,R_Scl_Str,Scl_Str,R_Scl_Dex,Scl_Dex,R_Scl_Int,Scl_Int,R_Scl_Fai,Scl_Fai,R_Scl_Arc,Scl_Arc,Weigth,SCost,Skill_name,ET_ID)
VALUES ('Whip-6', 'Giants Red Braid',82,24 ,0,12 ,53,26 ,0,12 ,0,12 ,100,15 ,18,'D' ,12,'D' ,0,0 ,21,'D' ,0,0 ,2.5,  25,'Flame Dance', 'W-Whip')



GO
INSERT INTO Armor_info(A_ID,A_Name,Phy_guard,Phy_strike,Phy_slash,Phy_thurst,Mag_guard,Fie_guard,Light_guard,Holy_guard,Inmunity,Robustness,Focus,Vitality,Poise,Weigth,ET_ID)
VALUES
 ('Leg-1', 'All-Knowing Greaves',7.4 ,6.8 ,7.7 ,6.8 ,7.1 ,5.4 ,5.8 ,5.4 ,17 ,29 ,13 ,13 ,10 ,6.6 , 'A-Leg'),
 ('Leg-2', 'Alberichs Trousers',3 ,2.3 ,3 ,3 ,7.3 ,6.8 ,7.2 ,7.3 ,26 ,14 ,41 ,44 ,1 ,2.5 , 'A-Leg'),
 ('Leg-3', 'Astrologer Trousers',3.8 ,3.4 ,3.4 ,3.4 ,7.7 ,7.4 ,7.6 ,7.4 ,31 ,15 ,56 ,47 ,3 ,3.9 , 'A-Leg'),
 ('Leg-4', 'Bandit Boots',4.0 ,4.5 ,5.0 ,5.4 ,5.4 ,5.4 ,5.8 ,5.0 ,34 ,20 ,35 ,35 ,2 ,4.4 , 'A-Leg'),
 ('Leg-5', 'Banished Knight Greaves',10.8 ,8.6 ,11.1 ,10.1 ,7.7 ,7.7 ,7.4 ,7.6 ,37 ,51 ,24 ,26 ,17 ,10.8 , 'A-Leg'),
 ('Leg-6', 'Beast Champion Greaves',10.1 ,9.4 ,10.8 ,10.6 ,7.4 ,7.9 ,7.3 ,7.7 ,35 ,56 ,26 ,24 ,17 ,10.8 , 'A-Leg'),
 ('Leg-7', 'Black Knife Greaves',6.5 ,6.2 ,7.1 ,7.1 ,5 ,5.4 ,3.8 ,6.5 ,17 ,29 ,14 ,14 ,8 ,5.7 , 'A-Leg'),
 ('Leg-8', 'Blackflame Monk Greaves',7.7 ,6.5 ,8.4 ,7.4 ,5.8 ,7.4 ,4.5 ,5.8 ,20 ,34 ,13 ,20 ,11 ,7.3 , 'A-Leg'),
 ('Leg-9', 'Bloodhound Knight Greaves',7.1 ,6.5 ,8.0 ,7.7 ,5.4 ,5.8 ,4.0 ,5.8 ,20 ,31 ,14 ,14 ,8 ,6.6 , 'A-Leg'),
 ('Leg-10', 'Briar Greaves',7.4 ,6.5 ,7.7 ,7.2 ,6.2 ,7.1 ,7.1 ,6.2 ,22 ,44 ,15 ,15 ,9 ,7.3 , 'A-Leg'),
 ('Leg-11', 'Bull-Goat Greaves',11.9 ,11.8 ,10.6 ,10.6 ,7.6 ,7.7 ,8.5 ,7.3 ,44 ,51 ,29 ,34 ,28 ,16.4 , 'A-Leg'),
 ('Leg-12', 'Champion Gaiters',3.8 ,5 ,4 ,4.5 ,4.5 ,5.4 ,5.8 ,5.4 ,31 ,20 ,26 ,24 ,3 ,3.9 , 'A-Leg'),
 ('Leg-13', 'Carian Knight Greaves',6.8 ,6.2 ,7.1 ,6.8 ,7.1 ,6.8 ,5.4 ,6.8 ,17 ,29 ,13 ,14 ,7 ,6.6 , 'A-Leg'),
 ('Leg-14', 'Chain Leggings',6.8 ,5 ,7.4 ,6.8 ,4 ,6.2 ,3.4 ,4.5 ,16 ,26 ,7 ,11 ,7 ,5.5 , 'A-Leg'),
 ('Leg-15', 'Cleanrot Greaves',8.4 ,7.6 ,9.2 ,10.1 ,7.2 ,7.3 ,6.5 ,7.7 ,39 ,41 ,17 ,20 ,13 ,9.3 , 'A-Leg'),
 ('Leg-16', 'Cloth Trousers',3 ,2.3 ,1.5 ,2.3 ,7.3 ,7.1 ,6.8 ,7.1 ,26 ,14 ,37 ,37 ,1 ,2 , 'A-Leg'),
 ('Leg-17', 'Commoners Shoes',1.5 ,3 ,3 ,2.3 ,7.1 ,6.5 ,6.8 ,7.1 ,22 ,14 ,39 ,41 ,1 ,2 , 'A-Leg'),
 ('Leg-18', 'Confessor Boots',4.5 ,5.8 ,4.5 ,5 ,6.2 ,6.2 ,6.8 ,5.4 ,37 ,29 ,29 ,31 ,3 ,4.8 , 'A-Leg'),
 ('Leg-19', 'Consorts Trousers',3.0 ,2.3 ,2.3 ,3.0 ,7.4 ,7.1 ,7.1 ,7.3 ,29 ,15 ,41 ,39 ,1 ,2.5 , 'A-Leg'),
 ('Leg-20', 'Crucible Greaves',10.1 ,8 ,9.6 ,9.6 ,7.4 ,7.3 ,6.5 ,7.7 ,31 ,44 ,22 ,16 ,14 ,9.6 , 'A-Leg'),
 ('Leg-21', 'Eccentrics Breeches',6.5 ,4.5 ,6.2 ,6.5 ,4.5 ,5.0 ,3.0 ,4.0 ,15 ,31 ,7 ,7 ,6 ,5.1 , 'A-Leg'),
 ('Leg-22', 'Elden Lord Greaves',6.5 ,5.8 ,6.2 ,6.8 ,4.5 ,6.2 ,3.8 ,4 ,16 ,31 ,7 ,11 ,7 ,5.5 , 'A-Leg'),
 ('Leg-23', 'Errant Sorcerer Boots',3 ,3 ,3.8 ,3 ,7.6 ,7.3 ,7.2 ,7.6 ,24 ,15 ,47 ,51 ,1 ,3.1 , 'A-Leg'),
 ('Leg-24', 'Exile Greaves',7.1 ,5.4 ,7.4 ,7.1 ,4.5 ,6.2 ,3.8 ,5.4 ,17 ,34 ,13 ,11 ,8 ,5.7 , 'A-Leg'),
 ('Leg-25', 'Finger Maiden Shoes',3 ,2.3 ,2.3 ,1.5 ,7.6 ,7.2 ,7.3 ,7.6 ,24 ,13 ,39 ,39 ,1 ,2.5 , 'A-Leg'),
 ('Leg-26', 'Fire Monk Greaves',8 ,7.1 ,7.7 ,7.1 ,6.2 ,7.6 ,5.4 ,5.4 ,20 ,34 ,15 ,15 ,10 ,7.3 , 'A-Leg'),
 ('Leg-27', 'Foot Soldier Greaves',5.4 ,5.8 ,5.4 ,5.4 ,6.2 ,6.5 ,6.8 ,6.2 ,39 ,26 ,34 ,34 ,4 ,5.1 , 'A-Leg'),
 ('Leg-28', 'Fur Leggings',3.4 ,3.8 ,3.4 ,3.4 ,3.8 ,4 ,5 ,4 ,39 ,26 ,34 ,24 ,1 ,3.1 , 'A-Leg'),
 ('Leg-29', 'Gelmir Knight Greaves',7.7 ,6.5 ,8.0 ,7.7 ,6.2 ,7.1 ,5.8 ,6.2 ,22 ,34 ,15 ,14 ,11 ,7.3 , 'A-Leg'),
 ('Leg-30', 'Godrick Knight Greaves',7.7 ,6.8 ,8 ,7.4 ,6.2 ,6.8 ,5.4 ,6.2 ,22 ,35 ,15 ,15 ,11 ,7.3 , 'A-Leg'),
 ('Leg-31', 'Godskin Apostle Trousers',3.4 ,3.0 ,3.0 ,1.5 ,7.2 ,6.8 ,7.1 ,7.9 ,26 ,13 ,41 ,39 ,1 ,2.5 , 'A-Leg'),
 ('Leg-32', 'Guardian Greaves',6.2 ,5.8 ,5.8 ,5.4 ,6.8 ,6.5 ,6.8 ,6.8 ,47 ,31 ,37 ,35 ,3 ,5.5 , 'A-Leg'),
 ('Leg-33', 'Haligtree Greaves',7.4 ,6.8 ,7.1 ,7.4 ,5.4 ,5.8 ,4.5 ,5.8 ,20 ,34 ,14 ,15 ,9 ,6.6 , 'A-Leg'),
 ('Leg-34', 'Hoslows Greaves',8 ,6.8 ,7.7 ,7.1 ,6.2 ,6.8 ,5.8 ,5.8 ,24 ,37 ,15 ,15 ,10 ,7.3 , 'A-Leg'),
 ('Leg-35', 'Kaiden Trousers',6.5 ,4.6 ,6.5 ,6.5 ,4.0 ,4.5 ,3.8 ,4.0 ,15 ,26 ,7 ,7 ,7 ,5.1 , 'A-Leg'),
 ('Leg-36', 'Knight Greaves',7.1 ,6.8 ,7.7 ,7.7 ,6.2 ,6.2 ,5.4 ,5 ,17 ,31 ,11 ,11 ,11 ,6.6 , 'A-Leg'),
 ('Leg-37', 'Land of Reeds Greaves',5 ,5.4 ,6.8 ,5.4 ,5.8 ,6.5 ,6.8 ,6.2 ,37 ,31 ,31 ,34 ,4 ,5.1 , 'A-Leg'),
 ('Leg-38', 'Leather Trousers',6.5 ,5.4 ,6.8 ,6.8 ,5 ,5.4 ,3.4 ,4.5 ,16 ,29 ,11 ,7 ,8 ,5.5 , 'A-Leg'),
 ('Leg-39', 'Lionels Greaves',10.1 ,9.4 ,11.1 ,11.4 ,7.7 ,8.5 ,7.4 ,7.7 ,39 ,61 ,26 ,31 ,22 ,13.1 , 'A-Leg'),
 ('Leg-40', 'Malformed Dragon Greaves',9.6 ,8.6 ,10.1 ,9.6 ,7.4 ,7.4 ,7.9 ,7.4 ,35 ,47 ,24 ,24 ,16 ,9.9 , 'A-Leg'),
 ('Leg-41', 'Malikeths Greaves',7.7 ,6.8 ,8 ,7.7 ,6.2 ,6.5 ,5.4 ,7.3 ,22 ,35 ,15 ,31 ,11 ,7.9 , 'A-Leg'),
 ('Leg-42', 'Millicents Boots',2.3 ,2.3 ,2.3 ,1.5 ,7.2 ,6.8 ,7.1 ,7.2 ,24 ,13 ,0 ,39 ,0 ,2 , 'A-Leg'),
 ('Leg-43', 'Mushroom Legs',3.4 ,4.0 ,1.5 ,3.0 ,7.6 ,3.0 ,7.4 ,7.4 ,63 ,15 ,56 ,47 ,1 ,3.1 , 'A-Leg'),
 ('Leg-44', 'Nobles Trousers',3.4 ,3.8 ,3.4 ,3.8 ,7.6 ,7.7 ,7.4 ,7.6 ,29 ,15 ,47 ,51 ,1 ,3.9 , 'A-Leg'),
 ('Leg-45', 'Omenkiller Boots',5.0 ,4.5 ,4.0 ,4.0 ,4.0 ,5.4 ,6.5 ,5.8 ,41 ,17 ,29 ,29 ,4 ,4.4 , 'A-Leg'),
 ('Leg-46', 'Queens Leggings',2.3 ,1.5 ,1.5 ,0.3 ,7.6 ,6.8 ,7.1 ,7.3 ,22 ,14 ,37 ,41 ,1 ,2 , 'A-Leg'),
 ('Leg-47', 'Page Trousers',3.4 ,3 ,2.3 ,2.3 ,7.2 ,7.1 ,7.3 ,7.3 ,24 ,13 ,44 ,44 ,1 ,2.5 , 'A-Leg'),
 ('Leg-48', 'Preceptors Trousers',3.4 ,3.8 ,3.4 ,3.4 ,8.3 ,7.6 ,7.3 ,7.3 ,31 ,15 ,51 ,47 ,2 ,3.9 , 'A-Leg'),
 ('Leg-49', 'Prisoner Trousers',2.3 ,3 ,3 ,2.3 ,6.8 ,6.5 ,6.5 ,7.2 ,26 ,14 ,39 ,39 ,1 ,2 , 'A-Leg'),
 ('Leg-50', 'Prophet Trousers',3 ,3.4 ,3.4 ,3 ,7.6 ,7.3 ,7.2 ,7.6 ,26 ,14 ,47 ,51 ,1 ,3.1 , 'A-Leg'),
 ('Leg-51', 'Radahns Greaves',10.8 ,8.6 ,10.6 ,10.1 ,7.7 ,8.1 ,7.2 ,7.7 ,37 ,61 ,26 ,24 ,17 ,10.8 , 'A-Leg'),
 ('Leg-52', 'Radahn Soldier Greaves',7.7 ,6.2 ,7.1 ,6.8 ,5.8 ,6.5 ,4.5 ,5.4 ,20 ,31 ,14 ,15 ,10 ,6.6 , 'A-Leg'),
 ('Leg-53', 'Raging Wolf Greaves',7.5 ,6.6 ,7.5 ,7.2 ,5.6 ,6.3 ,3.8 ,5.2 ,19 ,34 ,11 ,11 ,9 ,6.3 , 'A-Leg'),
 ('Leg-54', 'Raya Lucarian Greaves',7.4 ,6.2 ,7.7 ,7.4 ,6.2 ,6.2 ,4 ,5 ,20 ,34 ,14 ,14 ,10 ,6.6 , 'A-Leg'),
 ('Leg-55', 'Rotten Duelist Greaves',7.4 ,6.2 ,7.7 ,7.1 ,6.2 ,6.5 ,5.8 ,6.2 ,35 ,35 ,15 ,15 ,10 ,7.3 , 'A-Leg'),
 ('Leg-56', 'Sage Trousers',3.4 ,3 ,3 ,1.5 ,7.6 ,7.1 ,7.3 ,7.6 ,22 ,13 ,39 ,41 ,1 ,2.5 , 'A-Leg'),
 ('Leg-57', 'Sanguine Noble Waistcloth',3 ,2.3 ,2.3 ,2.3 ,7.4 ,6.5 ,7.3 ,7.6 ,29 ,11 ,44 ,41 ,1 ,2.5 , 'A-Leg'),
 ('Leg-58', 'Scaled Greaves',9.2 ,8.0 ,9.6 ,9.2 ,7.7 ,8.1 ,7.4 ,7.7 ,35 ,51 ,24 ,24 ,16 ,9.9 , 'A-Leg'),
 ('Leg-59', 'Snow Witch Skirt',3 ,3.4 ,3.4 ,2.3 ,7.4 ,7.4 ,7.3 ,7.4 ,24 ,20 ,44 ,44 ,1 ,3.1 , 'A-Leg'),
 ('Leg-60', 'Sorcerer Leggings',1.7 ,1.1 ,2.1 ,1.4 ,4.2 ,6.4 ,2.8 ,5.6 ,15 ,25 ,25 ,0,0 ,2 , 'A-Leg'),
 ('Leg-61', 'Travelers Slops',3.0 ,3.0 ,2.3 ,1.5 ,7.3 ,7.3 ,7.1 ,7.3 ,34 ,13 ,41 ,39 ,1 ,2.5 , 'A-Leg'),
 ('Leg-62', 'Traveling Maiden Boots',3 ,3.4 ,3.4 ,2.3 ,7.6 ,7.3 ,7.4 ,7.6 ,29 ,15 ,47 ,51 ,1 ,3.1 , 'A-Leg'),
 ('Leg-63', 'Twinned Greaves',7.7 ,7.1 ,8.4 ,6.8 ,6.5 ,6.5 ,5.0 ,5.8 ,20 ,34 ,13 ,34 ,10 ,7.3 , 'A-Leg'),
 ('Leg-64', 'Warrior Greaves',5.4 ,5.4 ,4.5 ,4.5 ,5.8 ,6.2 ,6.8 ,5.4 ,39 ,26 ,31 ,31 ,4 ,4.8 , 'A-Leg'),
 ('Leg-65', 'Vagabond Knight Greaves',7.4 ,5.8 ,6.8 ,6.5 ,5 ,5.8 ,4.5 ,4.5 ,20 ,34 ,13 ,13 ,8 ,5.7 , 'A-Leg'),
 ('Leg-66', 'Veterans Greaves',10.8 ,9.8 ,10.8 ,10.1 ,7.7 ,8.1 ,7.3 ,7.6 ,39 ,56 ,29 ,29 ,22 ,11.7 , 'A-Leg'),
 ('Leg-67', 'White Reed Greaves',5.4 ,5.4 ,6.5 ,5.0 ,6.2 ,6.2 ,6.8 ,5.8 ,41 ,26 ,34 ,31 ,4 ,5.1 , 'A-Leg'),
 ('Leg-68', 'Zamor Legwraps',6.5 ,5 ,6.8 ,5.8 ,4.5 ,4.5 ,3 ,4 ,11 ,37 ,0 ,7 ,7 ,5.1 , 'A-Leg'),
 ('Leg-69', 'Drake Knight Greaves',6.5 ,5.4 ,6.8 ,6.5 ,5.8 ,6.5 ,5 ,5.8 ,16 ,29 ,13 ,13 ,8 ,5.7 , 'A-Leg'),
 ('Leg-70', 'Perfumer Sarong',2.3 ,3.4 ,3 ,2.3 ,7.3 ,6.8 ,7.1 ,7.3 ,37 ,11 ,39 ,41 ,1 ,2.5 , 'A-Leg'),
 ('Leg-71', 'Spellblades Trousers',2.9 ,2.2 ,2.9 ,2.9 ,7.3 ,6.7 ,7 ,7.3 ,25 ,13 ,38 ,41 ,1 ,2.6 , 'A-Leg'),
 ('Leg-72', 'Ronins Greaves',6.2 ,6.2 ,6.5 ,6.2 ,6.8 ,7.1 ,7.3 ,6.8 ,46 ,35 ,36 ,38 ,5 ,5.7 , 'A-Leg'),
 ('Leg-73', 'Blaidds Greaves',8.4 ,7.3 ,8.4 ,8.8 ,6.5 ,7.3 ,6.2 ,6.8 ,24 ,39 ,16 ,16 ,14 ,8.5 , 'A-Leg'),
 ('Leg-74', 'Nights Cavalry Greaves',8 ,7.3 ,8 ,7.7 ,6.2 ,7.2 ,6.2 ,7.2 ,24 ,35 ,15 ,15 ,12 ,7.9 , 'A-Leg'),
 ('Leg-75', 'Blue Silver Mail Skirt',6.8 ,5 ,7.1 ,6.2 ,5.8 ,5.4 ,4 ,4 ,15 ,35 ,7 ,7 ,7 ,5.5 , 'A-Leg'),
 ('Leg-76', 'Nomadic Merchants Trousers',4.5 ,5 ,4 ,3.8 ,5.4 ,5.4 ,5.4 ,5 ,35 ,20 ,44 ,29 ,2 ,4.4 , 'A-Leg'),
 ('Leg-77', 'Tree Sentinel Greaves',10.8 ,8.6 ,10.8 ,10.1 ,7.4 ,9.9 ,7.2 ,8.1 ,41 ,56 ,26 ,29 ,17 ,11.7 , 'A-Leg'),
 ('Leg-78', 'Royal Knight Greaves',9.2 ,8.3 ,10.1 ,9.6 ,8.1 ,7.6 ,7.1 ,7.4 ,31 ,41 ,22 ,22 ,14 ,9.6 , 'A-Leg'),
 ('Leg-79', 'Nox Greaves',5.4 ,5.8 ,5.4 ,5 ,7.1 ,6.8 ,6.8 ,5.8 ,39 ,26 ,31 ,31 ,4 ,5.1 , 'A-Leg'),
 ('Leg-80', 'Shaman Leggings',3 ,3.4 ,3 ,4.5 ,4.5 ,4 ,4.5 ,3.8 ,39 ,26 ,34 ,22 ,1 ,3.1 , 'A-Leg'),
 ('Leg-81', 'Duelist Greaves',8 ,7.1 ,8 ,7.4 ,5.8 ,6.8 ,5.4 ,6.2 ,29 ,31 ,15 ,15 ,11 ,7.3 , 'A-Leg'),
 ('Leg-82', 'Fire Prelate Greaves',11.1 ,9.8 ,10.6 ,10.6 ,7.7 ,11.5 ,7.4 ,7.6 ,41 ,39 ,56 ,31 ,24 ,15.3 , 'A-Leg'),
 ('Leg-83', 'Aristocrat Boots',4.3 ,4.8 ,4.3 ,4.3 ,3.6 ,3.8 ,4.3 ,3.6 ,29 ,21 ,23 ,19 ,1 ,2.9 , 'A-Leg'),
 ('Leg-84', 'Old Aristocrat Shoes',3.4 ,3.4 ,3 ,3.4 ,4.5 ,5 ,4.5 ,3.4 ,22 ,15 ,17 ,20 ,1 ,2 , 'A-Leg'),
 ('Leg-85', 'Vulgar Militia Greaves',5.4 ,6.2 ,5.8 ,5 ,6.2 ,6.2 ,6.5 ,6.2 ,44 ,24 ,34 ,34 ,4 ,5.1 , 'A-Leg'),
 ('Leg-86', 'Godskin Noble Trousers',2.3 ,4.5 ,3 ,2.3 ,7.2 ,6.5 ,6.8 ,7.7 ,24 ,14 ,39 ,41 ,1 ,2.5 , 'A-Leg'),
 ('Leg-87', 'Depraved Perfumer Trousers',3.9 ,3.9 ,3.7 ,3.3 ,7.8 ,7.5 ,7.3 ,7.5 ,46 ,15 ,40 ,58 ,2 ,4.3 , 'A-Leg'),
 ('Leg-88', 'Old Sorcerers Legwraps',3.4 ,1.5 ,3.4 ,1.5 ,8.1 ,6.8 ,7.2 ,7.3 ,24 ,13 ,39 ,44 ,1 ,2.5 , 'A-Leg'),
 ('Leg-89', 'Ragged Loincloth',4 ,4.5 ,4 ,4 ,5 ,5.4 ,5.8 ,5 ,34 ,20 ,26 ,26 ,2 ,3.1 , 'A-Leg'),
 ('Leg-90', 'War Surgeon Trousers',3.9 ,4.4 ,4.9 ,3.9 ,5.3 ,5.7 ,6.1 ,5.7 ,33 ,23 ,23 ,31 ,3 ,4.2 , 'A-Leg'),
 ('Leg-91', 'Royal Remains Greaves',6.8 ,6.5 ,7.4 ,6.8 ,5.4 ,5.8 ,4.5 ,5 ,22 ,35 ,15 ,7 ,9 ,6.6 , 'A-Leg'),
 ('Leg-92', 'Braves Legwraps',3.4 ,3.4 ,3.4 ,3 ,7.4 ,7.2 ,7.3 ,7.4 ,29 ,15 ,47 ,47 ,1 ,3.1 , 'A-Leg'),
 ('Leg-93', 'Malenias Greaves',7.1 ,5.4 ,7.4 ,6.5 ,4.5 ,5.4 ,3.8 ,6.2 ,31 ,26 ,11 ,11 ,8 ,5.7 , 'A-Leg'),
 ('Leg-94', 'Fingerprint Greaves',7.7 ,6.8 ,6.8 ,6.8 ,5.4 ,7.2 ,3.8 ,5.4 ,20 ,37 ,7 ,14 ,11 ,6.6 , 'A-Leg'),
 ('Leg-95', 'Omen Greaves',10.6 ,8.6 ,10.8 ,10.8 ,7.4 ,8.3 ,8.5 ,7.9 ,41 ,39 ,35 ,47 ,24 ,14.3 , 'A-Leg'),
 ('Leg-96', 'Battlemage Legwraps',3 ,3.4 ,2.3 ,3 ,7.4 ,6.8 ,7.1 ,7.2 ,26 ,14 ,39 ,44 ,1 ,2.5 , 'A-Leg'),
 ('Leg-97', 'Travelers Boots',3.8 ,3.4 ,3 ,2.3 ,7.7 ,7.3 ,7.4 ,7.2 ,24 ,15 ,47 ,47 ,1 ,3.1 , 'A-Leg'),
 ('Leg-98', 'Gold Waistwrap',4 ,3.8 ,3.8 ,3 ,7.6 ,7.4 ,7.6 ,8.1 ,35 ,15 ,56 ,56 ,3 ,4.4 , 'A-Leg'),
 ('Leg-99', 'Leather Boots',4.5 ,5.4 ,4.5 ,5 ,5.4 ,5.4 ,5.8 ,5.8 ,37 ,22 ,26 ,31 ,1 ,4.4 , 'A-Leg'),
 ('Leg-100', 'Godrick Soldier Greaves',7.4 ,6.5 ,7.4 ,7.1 ,5.8 ,6.2 ,4.5 ,5.4 ,20 ,34 ,14 ,14 ,10 ,6.6 , 'A-Leg'),
 ('Leg-101', 'Leyndell Soldier Greaves',7.4 ,6.8 ,7.1 ,7.4 ,5.4 ,5.8 ,5 ,5.4 ,20 ,34 ,14 ,14 ,10 ,6.6 , 'A-Leg'),
 ('Leg-102', 'Mausoleum Greaves',7.4 ,6.2 ,7.7 ,7.1 ,5.8 ,5.8 ,5 ,5.8 ,20 ,31 ,14 ,13 ,11 ,6.6 , 'A-Leg'),
 ('Leg-103', 'Cuckoo Knight Greaves',7.7 ,6.5 ,8.4 ,7.7 ,7.1 ,6.8 ,5 ,5.8 ,20 ,35 ,15 ,15 ,11 ,7.3 , 'A-Leg'),
 ('Leg-104', 'Leyndell Knight Greaves',7.7 ,7.1 ,7.7 ,7.7 ,5.8 ,6.5 ,5.8 ,6.2 ,22 ,35 ,15 ,15 ,11 ,7.3 , 'A-Leg'),
 ('Leg-105', 'Redmane Knight Greaves',7.7 ,6.5 ,7.7 ,7.1 ,6.2 ,7.3 ,5.4 ,6.2 ,22 ,34 ,15 ,15 ,11 ,7.3 , 'A-Leg'),
 ('Leg-106', 'Mausoleum Knight Greaves',7.7 ,6.5 ,8.4 ,7.4 ,6.2 ,6.5 ,5.8 ,6.5 ,22 ,34 ,15 ,14 ,12 ,7.3 , 'A-Leg'),
 ('Leg-107', 'Haligtree Knight Greaves',7.7 ,7.1 ,7.7 ,7.7 ,5.8 ,6.5 ,5.4 ,6.5 ,22 ,35 ,15 ,15 ,10 ,7.3 , 'A-Leg')
GO
INSERT INTO Armor_info(A_ID,A_Name,Phy_guard,Phy_strike,Phy_slash,Phy_thurst,Mag_guard,Fie_guard,Light_guard,Holy_guard,Inmunity,Robustness,Focus,Vitality,Poise,Weigth,ET_ID)
VALUES
 ('Hel-1', 'Alberichs Pointed Hat',1.8 ,1.4 ,1.8 ,1.8 ,4.6 ,4.2 ,4.4 ,4.6 ,16 ,10 ,29 ,31 ,0 ,1.7 , 'A-Hel'),
 ('Hel-2', 'Albinauric Mask',4 ,3.1 ,4 ,3.8 ,2.5 ,3.1 ,2.1 ,2.5 ,12 ,23 ,10 ,10 ,3 ,3.8 , 'A-Hel'),
 ('Hel-3', 'All-Knowing Helm',4.6 ,4.2 ,4.8 ,4.2 ,4.4 ,3.4 ,3.6 ,3.1 ,12 ,20 ,9 ,9 ,5 ,4.6 , 'A-Hel'),
 ('Hel-4', 'Aristocrat Hat',3.1 ,3.1 ,2.8 ,3.1 ,3.8 ,4 ,3.8 ,3.1 ,22 ,14 ,18 ,20 ,1 ,3 , 'A-Hel'),
 ('Hel-5', 'Aristocrat Headband',1.9 ,1.9 ,1.9 ,1.6 ,4 ,3.6 ,3.8 ,4 ,15 ,10 ,25 ,22 ,0 ,1.2 , 'A-Hel'),
 ('Hel-6', 'Astrologer Hood',1.8 ,1.4 ,1.4 ,1.4 ,4.6 ,4.5 ,4.6 ,4.5 ,18 ,9 ,31 ,27 ,1 ,1.7 , 'A-Hel'),
 ('Hel-7', 'Ash-of-War Scarab',-5.8 ,-5.6 ,-5.8 ,-5.8 ,-4.9 ,-4.9 ,-4.9 ,-5.1 ,42 ,22 ,27 ,26 ,2 ,5.1 , 'A-Hel'),
 ('Hel-8', 'Azurs Glintstone Crown',2.8 ,2.3 ,2.5 ,2.5 ,5.8 ,4.6 ,4.7 ,5.0 ,23 ,14 ,44 ,39 ,2 ,3.6 , 'A-Hel'),
 ('Hel-9', 'Bandit Mask',2.8 ,3.1 ,3.1 ,3.1 ,3.1 ,3.4 ,3.6 ,3.1 ,33 ,16 ,16 ,18 ,1 ,3 , 'A-Hel'),
 ('Hel-10', 'Banished Knight Helm',6.8 ,5.4 ,7 ,6.3 ,4.8 ,4.8 ,4.6 ,4.7 ,26 ,35 ,16 ,18 ,9 ,7.5 , 'A-Hel'),
 ('Hel-11', 'Beast Champion Helm',6.3 ,5.9 ,6.8 ,6.7 ,4.6 ,4.9 ,4.6 ,4.8 ,24 ,39 ,18 ,16 ,9 ,7.5 , 'A-Hel'),
 ('Hel-12', 'Black Knife Hood',3.8 ,3.6 ,4.2 ,4.2 ,2.8 ,3.1 ,2.1 ,3.8 ,11 ,18 ,9 ,9 ,4 ,3.8 , 'A-Hel'),
 ('Hel-13', 'Blackflame Monk Hood',4.4 ,3.4 ,4.6 ,4.2 ,2.8 ,4.4 ,2.1 ,2.8 ,11 ,20 ,5 ,11 ,5 ,4.0 , 'A-Hel'),
 ('Hel-14', 'Bloodhound Knight Helm',4.4 ,4 ,5 ,4.8 ,3.4 ,3.6 ,2.5 ,3.6 ,14 ,22 ,10 ,10 ,4 ,4.6 , 'A-Hel'),
 ('Hel-15', 'Bloodsoaked Mask',1.8 ,1.8 ,1.8 ,2.1 ,4.6 ,4.4 ,4.5 ,4.6 ,20 ,12 ,33 ,35 ,1 ,2.2 , 'A-Hel'),
 ('Hel-16', 'Blue Cloth Cowl',2.8 ,2.8 ,2.3 ,2.3 ,3.1 ,3.4 ,3.8 ,.28 ,24 ,15 ,18 ,18 ,1 ,2.7 , 'A-Hel'),
 ('Hel-17', 'Briar Helm',4.6 ,4 ,4.8 ,4.4 ,3.8 ,4.4 ,3.1 ,3.8 ,15 ,31 ,10 ,10 ,5 ,5.1 , 'A-Hel'),
 ('Hel-18', 'Bull-Goat Helm',7.5 ,7.4 ,6.7 ,6.7 ,4.7 ,4.8 ,5.3 ,4.6 ,31 ,35 ,20 ,23 ,15 ,11.3 , 'A-Hel'),
 ('Hel-19', 'Carian Knight Helm',4.2 ,3.8 ,4.4 ,4.2 ,4.4 ,4.2 ,2.4 ,4.2 ,12 ,20 ,9 ,10 ,4 ,4.6 , 'A-Hel'),
 ('Hel-20', 'Chain Coif',4.2 ,3.1 ,4.6 ,4.2 ,2.5 ,3.8 ,2.1 ,2.8 ,11 ,18 ,5 ,8 ,4 ,3.8 , 'A-Hel'),
 ('Hel-21', 'Cleanrot Helm',5.2 ,4.8 ,5.8 ,6.3 ,4.5 ,4.6 ,4 ,4.8 ,27 ,29 ,12 ,14 ,7 ,6.4 , 'A-Hel'),
 ('Hel-22', 'Champion Headband',2.3 ,3.1 ,2.5 ,2.8 ,2.8 ,3.4 ,3.6 ,3.4 ,22 ,14 ,18 ,16 ,2 ,2.7 , 'A-Hel'),
 ('Hel-23', 'Commoners Headband',0.9 ,1.9 ,1.8 ,1.4 ,4.4 ,4 ,4.2 ,4.4 ,15 ,10 ,27 ,29 ,0 ,1.4 , 'A-Hel'),
 ('Hel-24', 'Confessor Hood',2.8 ,3.6 ,2.8 ,3.1 ,3.8 ,3.8 ,4.2 ,3.4 ,26 ,20 ,20 ,22 ,2 ,3.3 , 'A-Hel'),
 ('Hel-25', 'Crimson Hood',1.4 ,1.8 ,1.4 ,1.8 ,4.6 ,4.6 ,4.5 ,4.6 ,16 ,9 ,27 ,29 ,0 ,1.7 , 'A-Hel'),
 ('Hel-26', 'Crucible Axe Helm',6.3 ,5 ,6.1 ,6.1 ,4.6 ,4.6 ,4 ,4.8 ,22 ,31 ,15 ,15 ,9 ,6.6 , 'A-Hel'),
 ('Hel-27', 'Crucible Tree Helm',6.5 ,5 ,6.3 ,5.6 ,4.6 ,4.2 ,4 ,5.2 ,22 ,31 ,15 ,15 ,9 ,6.6 , 'A-Hel'),
 ('Hel-28', 'Eccentrics Hood',4.4 ,3.4 ,4.2 ,4.4 ,3.4 ,3.6 ,2.3 ,3.1 ,14 ,24 ,9 ,8 ,4 ,4.0 , 'A-Hel'),
 ('Hel-29', 'Elden Lord Crown',3.8 ,3.4 ,3.6 ,4 ,2.5 ,3.6 ,2.1 ,2.3 ,11 ,20 ,0 ,5 ,3 ,3.6 , 'A-Hel'),
 ('Hel-30', 'Exile Hood',4.4 ,3.4 ,4.6 ,4.4 ,2.8 ,3.8 ,2.3 ,3.4 ,12 ,23 ,9 ,8 ,4 ,4 , 'A-Hel'),
 ('Hel-31', 'Fias Hood',1.4 ,1.8 ,1.4 ,1.4 ,4.4 ,4.2 ,4.4 ,4.6 ,18 ,8 ,29 ,45 ,0 ,1.7 , 'A-Hel'),
 ('Hel-32', 'Fingerprint Helm',4.8 ,4.2 ,4.2 ,4.2 ,3.4 ,4.5 ,2.3 ,3.4 ,14 ,26 ,5 ,10 ,6 ,4.6 , 'A-Hel'),
 ('Hel-33', 'Finger Maiden Fillet',2.1 ,1.8 ,1.8 ,1.4 ,4.8 ,4.6 ,4.6 ,4.8 ,18 ,10 ,31 ,31 ,1 ,2.2 , 'A-Hel'),
 ('Hel-34', 'Fire Monk Hood',4.6 ,3.8 ,4.2 ,4 ,3.1 ,4.5 ,2.5 ,2.5 ,11 ,20 ,9 ,9 ,4 ,4 , 'A-Hel'),
 ('Hel-35', 'Foot Soldier Cap',3.4 ,3.6 ,3.4 ,3.4 ,3.8 ,4 ,4.2 ,3.8 ,27 ,18 ,23 ,23 ,2 ,3.6 , 'A-Hel'),
 ('Hel-36', 'Foot Soldier Helmet',3.4 ,3.4 ,3.6 ,3.6 ,4 ,4 ,4 ,3.6 ,27 ,18 ,23 ,23 ,2 ,3.6 , 'A-Hel'),
 ('Hel-37', 'Gelmir Knight Helm',4.8 ,4 ,5 ,4.8 ,3.8 ,4.4 ,3.6 ,3.8 ,15 ,23 ,10 ,10 ,6 ,5.1 , 'A-Hel'),
 ('Hel-38', 'Godrick Knight Helm',4.8 ,4.2 ,5 ,4.6 ,3.8 ,4.3 ,3.4 ,3.8 ,15 ,24 ,10 ,10 ,6 ,5.1 , 'A-Hel'),
 ('Hel-39', 'Godrick Soldier Helm',4.4 ,3.6 ,4.4 ,4.2 ,3.1 ,3.6 ,2.5 ,3.1 ,12 ,22 ,9 ,9 ,5 ,4.0 , 'A-Hel'),
 ('Hel-40', 'Godskin Apostle Hood',2.3 ,2.1 ,2.1 ,1.4 ,4.6 ,4.4 ,4.5 ,5.0 ,20 ,10 ,33 ,31 ,1 ,2.2 , 'A-Hel'),
 ('Hel-41', 'Greathelm',5.5 ,4.2 ,5.8 ,5.2 ,4.2 ,4.6 ,3.8 ,4.2 ,16 ,29 ,11 ,11 ,7 ,5.9 , 'A-Hel'),
 ('Hel-42', 'Great Horned Headband',2.8 ,3.1 ,2.8 ,2.8 ,3.1 ,3.4 ,3.8 ,3.4 ,33 ,23 ,27 ,22 ,1 ,3.3 , 'A-Hel'),
 ('Hel-43', 'Guilty Hood',0.9 ,1.4 ,1.8 ,0.2 ,4.4 ,4 ,4.5 ,4.6 ,15 ,9 ,27 ,31 ,0 ,1.4 , 'A-Hel'),
 ('Hel-44', 'Haligtree Helm',4.4 ,3.8 ,4.2 ,4.4 ,2.8 ,3.4 ,2.5 ,3.4 ,12 ,22 ,9 ,10 ,4 ,4 , 'A-Hel'),
 ('Hel-45', 'Hierodas Glintstone Crown',2.3 ,2.3 ,2.8 ,2.3 ,4.9 ,4.7 ,4.6 ,4.9 ,20 ,11 ,39 ,42 ,2 ,3 , 'A-Hel'),
 ('Hel-46', 'Highwayman Hood',2.8 ,3.6 ,2.8 ,3.1 ,3.8 ,3.8 ,4 ,3.6 ,24 ,15 ,22 ,22 ,2 ,3.3 , 'A-Hel'),
 ('Hel-47', 'Hoslows Helm',5.2 ,4.4 ,5 ,4.8 ,4 ,4.4 ,3.8 ,3.8 ,18 ,27 ,11 ,11 ,6 ,5.5 , 'A-Hel'),
 ('Hel-48', 'Imp Head (Cat)',5.8 ,5.2 ,5.8 ,6.1 ,5 ,5.8 ,4.8 ,5 ,35 ,35 ,20 ,20 ,8 ,8.1 , 'A-Hel'),
 ('Hel-49', 'Imp Head (Corpse)',5.8 ,5.2 ,5.8 ,6.1 ,5 ,5.8 ,4.8 ,5 ,35 ,35 ,20 ,20 ,8 ,8.1 , 'A-Hel'),
 ('Hel-50', 'Imp Head (Elder)',5.8 ,5.2 ,5.8 ,6.1 ,5 ,5.8 ,4.8 ,5 ,35 ,35 ,20 ,20 ,8 ,8.1 , 'A-Hel'),
 ('Hel-51', 'Imp Head (Fanged)',5.8 ,5.2 ,5.8 ,6.1 ,5 ,5.8 ,4.8 ,5 ,35 ,35 ,20 ,20 ,8 ,8.1 , 'A-Hel'),
 ('Hel-52', 'Imp Head (Long-Tongued)',5.8 ,5.2 ,5.8 ,6.1 ,5 ,5.8 ,4.8 ,5 ,35 ,35 ,20 ,20 ,8 ,8.1 , 'A-Hel'),
 ('Hel-53', 'Imp Head (Wolf)',5.8 ,5.2 ,5.8 ,6.1 ,5 ,5.8 ,4.8 ,5 ,35 ,35 ,20 ,20 ,8 ,8.1 , 'A-Hel'),
 ('Hel-54', 'Iron Helmet',4.4 ,3.1 ,4 ,4.2 ,2.5 ,3.1 ,2.3 ,3.1 ,12 ,18 ,8 ,8 ,4 ,3.8 , 'A-Hel'),
 ('Hel-55', 'Incantation Scarab',-5.8 ,-5.6 ,-5.8 ,-5.8 ,-4.9 ,-4.9 ,-4.9 ,-5.1 ,42 ,22 ,27 ,26 ,2 ,5.1 , 'A-Hel'),
 ('Hel-56', 'Juvenile Scholar Cap',1.4 ,1.8 ,1.8 ,1.4 ,4.5 ,4 ,4.2 ,4.4 ,15 ,10 ,26 ,29 ,0 ,1.4 , 'A-Hel'),
 ('Hel-57', 'Kaiden Helm',4.4 ,3.4 ,4.4 ,4.4 ,3.1 ,3.4 ,2.8 ,3.1 ,12 ,22 ,9 ,9 ,5 ,4 , 'A-Hel'),
 ('Hel-58', 'Karolos Glintstone Crown',4.4 ,3.1 ,5.2 ,4.8 ,4.4 ,4.5 ,3.4 ,3.8 ,16 ,26 ,10 ,10 ,3 ,5.1 , 'A-Hel'),
 ('Hel-59', 'Knight Helm',4.4 ,4.2 ,4.8 ,4.8 ,3.8 ,3.8 ,3.4 ,3.1 ,12 ,22 ,8 ,8 ,6 ,4.6 , 'A-Hel'),
 ('Hel-60', 'Land of Reeds Helm',3.1 ,3.4 ,4.2 ,3.4 ,3.6 ,4 ,4.2 ,3.8 ,26 ,22 ,22 ,23 ,2 ,3.6 , 'A-Hel'),
 ('Hel-61', 'Leyndell Knight Helm',4.8 ,4 ,5 ,4.8 ,3.8 ,4.4 ,3.6 ,3.8 ,15 ,23 ,10 ,10 ,6 ,5.1 , 'A-Hel'),
 ('Hel-62', 'Lionels Helm',6.3 ,5.9 ,7 ,7.2 ,4.8 ,5.3 ,4.6 ,4.8 ,27 ,42 ,18 ,22 ,12 ,9.1 , 'A-Hel'),
 ('Hel-63', 'Malformed Dragon Helm',6.1 ,5.4 ,6.3 ,6.1 ,4.6 ,4.6 ,4.9 ,4.6 ,24 ,33 ,16 ,16 ,8 ,6.8 , 'A-Hel'),
 ('Hel-64', 'Malikeths Helm',4.8 ,4.2 ,5 ,4.8 ,3.8 ,4 ,3.4 ,4.6 ,15 ,24 ,10 ,22 ,6 ,5.5 , 'A-Hel'),
 ('Hel-65', 'Marais Mask',2.1 ,2.3 ,1.8 ,1.4 ,4.6 ,4.5 ,4.5 ,4.6 ,20 ,14 ,35 ,33 ,1 ,2.2 , 'A-Hel'),
 ('Hel-66', 'Marionette Soldier Helm',4.4 ,3.1 ,4.0 ,3.8 ,3.1 ,3.1 ,2.3 ,3.1 ,10 ,22 ,9 ,8 ,4 ,3.8 , 'A-Hel'),
 ('Hel-67', 'Marionette Soldier Birdhelm',4.4 ,3.1 ,4.0 ,3.8 ,3.1 ,3.1 ,2.5 ,2.5 ,11 ,18 ,8 ,9 ,5 ,3.8 , 'A-Hel'),
 ('Hel-68', 'Mask of Confidence',2.3 ,2.5 ,2.3 ,2.3 ,5.3 ,4.8 ,4.7 ,4.7 ,24 ,11 ,39 ,35 ,2 ,3.3 , 'A-Hel'),
 ('Hel-69', 'Mushroom Crown',5.8 ,5.9 ,6.8 ,7 ,4.8 ,3.1 ,4.6 ,4.8 ,46 ,45 ,18 ,22 ,9 ,9.1 , 'A-Hel'),
 ('Hel-70', 'Mushroom Head',2.1 ,2.5 ,0.9 ,1.8 ,4.7 ,1.8 ,4.6 ,4.6 ,44 ,10 ,39 ,33 ,0 ,2.2 , 'A-Hel'),
 ('Hel-71', 'Navy Hood',1.4 ,2.1 ,1.8 ,0.9 ,4.6 ,4.7 ,4.4 ,4.5 ,20 ,10 ,29 ,27 ,0 ,1.7 , 'A-Hel'),
 ('Hel-72', 'Night Maiden Twin Crown',2.5 ,3.1 ,2.5 ,3.4 ,4.2 ,3.8 ,4.0 ,4.2 ,26 ,15 ,22 ,22 ,2 ,3.3 , 'A-Hel'),
 ('Hel-73', 'Nox Mirrorhelm',4 ,3.4 ,5.5 ,5 ,6.7 ,5.3 ,4.2 ,5.3 ,29 ,33 ,26 ,42 ,4 ,7.5 , 'A-Hel'),
 ('Hel-74', 'Octopus Head',3.4 ,5.4 ,2.8 ,2.8 ,4 ,3.6 ,4 ,3.8 ,31 ,14 ,23 ,23 ,2 ,3.6 , 'A-Hel'),
 ('Hel-75', 'Olivinus Glintstone Crown',4.4 ,3.1 ,5.2 ,4.8 ,4.4 ,4.5 ,3.4 ,3.8 ,16 ,26 ,10 ,10 ,3 ,5.1 , 'A-Hel'),
 ('Hel-76', 'Omensmirk Mask',3.1 ,2.8 ,2.5 ,2.5 ,3.1 ,3.4 ,4 ,3.6 ,29 ,12 ,20 ,20 ,2 ,3 , 'A-Hel'),
 ('Hel-77', 'Page Hood',1.8 ,1.4 ,0.9 ,0.9 ,4.4 ,4.2 ,4.5 ,4.5 ,15 ,8 ,29 ,29 ,0 ,1.4 , 'A-Hel'),
 ('Hel-78', 'Perfumer Hood',1.4 ,2.1 ,1.8 ,1.4 ,4.6 ,4.2 ,4.4 ,4.6 ,26 ,8 ,27 ,29 ,1 ,1.7 , 'A-Hel'),
 ('Hel-79', 'Preceptors Big Hat',2.5 ,2.8 ,2.5 ,2.5 ,5.5 ,4.9 ,4.8 ,4.8 ,26 ,12 ,44 ,42 ,2 ,3.6 , 'A-Hel'),
 ('Hel-80', 'Prisoner Iron Mask',6.8 ,5.9 ,7 ,6.8 ,4.6 ,4.9 ,4.5 ,4.8 ,29 ,44 ,35 ,20 ,11 ,8.6 , 'A-Hel'),
 ('Hel-81', 'Prophet Blindfold',0.2 ,0.9 ,0.9 ,0.2 ,4.5 ,4.2 ,4 ,4.5 ,14 ,5 ,27 ,27 ,0 ,1 , 'A-Hel'),
 ('Hel-82', 'Pumpkin Helm',7 ,5.9 ,6.7 ,6.7 ,4.6 ,4.7 ,5.2 ,4.5 ,27 ,42 ,44 ,18 ,9 ,12.3 , 'A-Hel'),
 ('Hel-83', 'Radahns Redmane Helm',6.8 ,5.4 ,6.7 ,6.3 ,4.8 ,5 ,4.5 ,4.8 ,26 ,42 ,18 ,16 ,9 ,7.5 , 'A-Hel'),
 ('Hel-84', 'Raging Wolf Helm',4.8 ,4.2 ,4.8 ,4.6 ,3.6 ,4 ,2.5 ,3.4 ,14 ,24 ,8 ,8 ,5 ,4.4 , 'A-Hel'),
 ('Hel-85', 'Queens Crescent Crown',2.1 ,1.8 ,1.8 ,1.4 ,4.9 ,4.5 ,4.6 ,4.7 ,18 ,11 ,31 ,35 ,1 ,2.2 , 'A-Hel'),
 ('Hel-86', 'Radiant Gold Mask',2.3 ,2.1 ,2.1 ,1.4 ,4.6 ,4.5 ,4.6 ,4.8 ,22 ,9 ,33 ,33 ,1 ,2.2 , 'A-Hel'),
 ('Hel-87', 'Rotten Duelist Helm',5.5 ,4.6 ,5.8 ,5.5 ,4.5 ,4.6 ,4.4 ,4.5 ,31 ,31 ,14 ,14 ,8 ,6.4 , 'A-Hel'),
 ('Hel-88', 'Rulers Mask',1.8 ,2.3 ,2.3 ,1.4 ,4.6 ,4.4 ,4.6 ,4.7 ,20 ,10 ,33 ,33 ,1 ,2.2 , 'A-Hel'),
 ('Hel-89', 'Sage Hood',2.3 ,2.1 ,2.1 ,1.4 ,4.8 ,4.5 ,4.6 ,4.8 ,16 ,10 ,31 ,33 ,1 ,2.2 , 'A-Hel'),
 ('Hel-90', 'Silver Tear Mask',4.2 ,3.6 ,3.8 ,3.1 ,5.5 ,5.2 ,5 ,5.3 ,26 ,20 ,44 ,4 ,3 ,4.6 , 'A-Hel'),
 ('Hel-91', 'Scaled Helm',5.8 ,5 ,6.1 ,5.8 ,4.8 ,5 ,4.6 ,4.8 ,24 ,35 ,16 ,16 ,9 ,6.8 , 'A-Hel'),
 ('Hel-92', 'Shining Horned Headband',2.5 ,2.8 ,2.5 ,3.6 ,3.6 ,3.4 ,3.5 ,3.1 ,33 ,23 ,27 ,20 ,2 ,3.3 , 'A-Hel'),
 ('Hel-93', 'Snow Witch Hat',1.8 ,2.1 ,2.1 ,1.4 ,4.5 ,4.6 ,4.6 ,4.6 ,16 ,14 ,31 ,31 ,1 ,2.2 , 'A-Hel'),
 ('Hel-94', 'Travelers Hat',1.8 ,1.8 ,1.4 ,0.9 ,4.6 ,4.6 ,4.4 ,4.6 ,23 ,9 ,29 ,27 ,1 ,1.7 , 'A-Hel'),
 ('Hel-95', 'Traveling Maiden Hood',1.4 ,1.8 ,1.8 ,0.9 ,4.6 ,4.5 ,4.6 ,4.6 ,18 ,10 ,29 ,31 ,1 ,1.6 , 'A-Hel'),
 ('Hel-96', 'Twinned Helm',4.8 ,4.4 ,5.2 ,4.2 ,4 ,4 ,3.1 ,3.6 ,14 ,23 ,9 ,23 ,5 ,5.1 , 'A-Hel'),
 ('Hel-97', 'Twinsage Glintstone Crown',4.4 ,3.1 ,5.2 ,4.8 ,4.4 ,4.5 ,3.4 ,3.8 ,16 ,26 ,10 ,10 ,3 ,5.1 , 'A-Hel'),
 ('Hel-98', 'Vagabond Knight Helm',4.6 ,3.6 ,4.2 ,4 ,3.1 ,3.6 ,2.8 ,2.8 ,14 ,23 ,9 ,9 ,4 ,4 , 'A-Hel'),
 ('Hel-99', 'Veterans Helm',6.8 ,6.1 ,6.8 ,6.3 ,4.8 ,5 ,4.6 ,4.7 ,27 ,39 ,20 ,20 ,12 ,8.1 , 'A-Hel'),
 ('Hel-100', 'Vulgar Militia Helm',3.4 ,3.8 ,3.6 ,3.1 ,3.8 ,3.8 ,4 ,3.8 ,31 ,16 ,23 ,23 ,2 ,3.6 , 'A-Hel'),
 ('Hel-101', 'Zamor Mask',4.2 ,3.4 ,4.4 ,3.8 ,3.1 ,3.1 ,2.1 ,2.8 ,9 ,27 ,5 ,8 ,4 ,3.8 , 'A-Hel'),
 ('Hel-102', 'Glintstone Scarab',-5.8 ,-5.6 ,-5.8 ,-5.8 ,-4.9 ,-4.9 ,-4.9 ,-5.1 ,42 ,22 ,27 ,26 ,2 ,5.1 , 'A-Hel'),
 ('Hel-103', 'Cerulean Tear Scarab',-5.8 ,-5.6 ,-5.8 ,-5.8 ,-4.9 ,-4.9 ,-4.9 ,-5.1 ,42 ,22 ,27 ,26 ,2 ,5.1 , 'A-Hel'),
 ('Hel-104', 'Okina Mask',3.4 ,3.6 ,4.0 ,3.1 ,3.8 ,3.8 ,4.2 ,3.6 ,29 ,18 ,23 ,22 ,2 ,3.6 , 'A-Hel'),
 ('Hel-105', 'Witchs Glintstone Crown',5.1 ,3.1 ,5.2 ,4.8 ,4.4 ,4.5 ,3.4 ,3.8 ,16 ,26 ,10 ,10 ,3 ,5.1 , 'A-Hel'),
 ('Hel-106', 'Alberichs Pointed Hat (Altered)',0.9 ,0.2 ,0.9 ,0.9 ,4.4 ,3.8 ,4 ,4.4 ,12 ,7 ,23 ,24 ,0 ,1 , 'A-Hel'),
 ('Hel-107', 'Banished Knight Helm (Altered)',6.7 ,5.2 ,6.8 ,6.1 ,4.7 ,4.7 ,4.6 ,4.6 ,21 ,30 ,13 ,14 ,8 ,7.1 , 'A-Hel'),
 ('Hel-108', 'Black Dumpling',2.8 ,3.1 ,2.8 ,2.8 ,3.1 ,3.4 ,3.6 ,3.1 ,24 ,15 ,0 ,20 ,1 ,2.7 , 'A-Hel'),
 ('Hel-109', 'Black Hood',2.8 ,3.1 ,3.1 ,3.1 ,3.1 ,3.4 ,3.6 ,3.1 ,33 ,16 ,16 ,18 ,1 ,3 , 'A-Hel'),
 ('Hel-110', 'Black Wolf Mask',5.2 ,4.6 ,5.2 ,5.5 ,4 ,4.5 ,3.6 ,4.2 ,16 ,33 ,11 ,11 ,8 ,5.9 , 'A-Hel'),
 ('Hel-111', 'Blackguards Iron Mask',5.8 ,4.4 ,6.1 ,5.5 ,4.2 ,4.4 ,4 ,4.5 ,22 ,31 ,12 ,12 ,8 ,6.2 , 'A-Hel'),
 ('Hel-112', 'Blue Festive Hood',1.4 ,1.4 ,2.1 ,1.8 ,4.5 ,4 ,4.5 ,4.9 ,20 ,9 ,31 ,27 ,0 ,1.7 , 'A-Hel'),
 ('Hel-113', 'Blue Silver Mail Hood',4.2 ,3.1 ,4.4 ,3.8 ,3.6 ,3.4 ,2.5 ,2.5 ,10 ,24 ,5 ,5 ,4 ,3.8 , 'A-Hel'),
 ('Hel-114', 'Braves Cord Circlet',0.9 ,0.9 ,0.9 ,0.2 ,4.4 ,4 ,4.2 ,4.4 ,15 ,8 ,26 ,26 ,0 ,1 , 'A-Hel'),
 ('Hel-115', 'Braves Leather Helm',4.2 ,3.4 ,4.2 ,4 ,2.8 ,3.4 ,2.3 ,2.8 ,11 ,20 ,8 ,8 ,4 ,3.8 , 'A-Hel'),
 ('Hel-116', 'Cleanrot Helm (Altered)',4.6 ,4.2 ,5 ,5.5 ,4 ,4.2 ,3.4 ,4.6 ,21 ,21 ,9 ,10 ,4 ,5.5 , 'A-Hel'),
 ('Hel-117', 'Commoners Headband (Altered)',0.1 ,1.1 ,1.1 ,0.6 ,3.9 ,3.5 ,3.7 ,3.9 ,12 ,8 ,23 ,24 ,0 ,0.7 , 'A-Hel'),
 ('Hel-118', 'Confessor Hood (Altered)',2.3 ,3.1 ,2.3 ,2.5 ,3.4 ,3.4 ,3.8 ,2.8 ,21 ,14 ,14 ,16 ,0 ,2.7 , 'A-Hel'),
 ('Hel-119', 'Consorts Mask',2.8 ,2.8 ,2.5 ,2.5 ,5 ,4.8 ,4.8 ,5 ,24 ,14 ,39 ,35 ,2 ,3.6 , 'A-Hel'),
 ('Hel-120', 'Crimson Tear Scarab',-3.8 ,-4 ,-3.8 ,-3.8 ,-4.6 ,-4.6 ,-4.6 ,-4.5 ,42 ,22 ,27 ,26 ,2 ,5.1 , 'A-Hel'),
 ('Hel-121', 'Cuckoo Knight Helm',4.8 ,4 ,5.2 ,4.8 ,4.4 ,4.2 ,3.1 ,3.6 ,14 ,24 ,10 ,10 ,6 ,5.1 , 'A-Hel'),
 ('Hel-122', 'Depraved Perfumer Headscarf',2 ,2 ,1.7 ,1.3 ,4.6 ,4.5 ,4.4 ,4.5 ,28 ,10 ,25 ,34 ,1 ,2.1 , 'A-Hel'),
 ('Hel-123', 'Dialloss Mask',4.8 ,3.8 ,4.6 ,4.4 ,3.6 ,3.6 ,2.5 ,3.4 ,15 ,23 ,10 ,10 ,5 ,4.6 , 'A-Hel'),
 ('Hel-124', 'Drake Knight Helm',4 ,3.4 ,4.2 ,4 ,3.6 ,4 ,3.1 ,3.6 ,11 ,20 ,9 ,9 ,4 ,4 , 'A-Hel'),
 ('Hel-125', 'Drake Knight Helm (Altered)',3.6 ,2.9 ,3.8 ,3.6 ,3.2 ,3.6 ,2.6 ,3.2 ,9 ,16 ,7 ,7 ,3 ,3.6 , 'A-Hel'),
 ('Hel-126', 'Duelist Helm',5.8 ,5.2 ,6.1 ,6.1 ,4 ,4.5 ,3.6 ,4.2 ,24 ,24 ,11 ,12 ,8 ,6.2 , 'A-Hel'),
 ('Hel-127', 'Eccentrics Hood (Altered)',4.4 ,3.4 ,4.2 ,4.4 ,3.4 ,3.6 ,2.3 ,3.1 ,12 ,21 ,8 ,7 ,3 ,4 , 'A-Hel'),
 ('Hel-128', 'Envoy Crown',2.8 ,3.1 ,3.1 ,2.8 ,5.3 ,4.7 ,4.9 ,5.5 ,27 ,15 ,46 ,46 ,2 ,3.8 , 'A-Hel'),
 ('Hel-129', 'Festive Hood',1.4 ,1.8 ,2.1 ,1.8 ,4.5 ,4.2 ,4.4 ,4.6 ,18 ,9 ,29 ,29 ,0 ,1.7 , 'A-Hel'),
 ('Hel-130', 'Festive Hood (Altered)',0.2 ,0.9 ,1.4 ,0.9 ,4.2 ,3.8 ,4 ,4.5 ,13 ,4 ,23 ,23 ,0 ,1 , 'A-Hel'),
 ('Hel-131', 'Fire Prelate Helm',7 ,6.1 ,6.7 ,6.7 ,4.8 ,7.2 ,4.6 ,4.7 ,29 ,27 ,39 ,22 ,13 ,10.6 , 'A-Hel'),
 ('Hel-132', 'Foot Soldier Helm',3.6 ,3.4 ,3.1 ,3.1 ,3.8 ,4.2 ,4.2 ,3.8 ,27 ,18 ,23 ,23 ,2 ,3.6 , 'A-Hel'),
 ('Hel-133', 'Gilded Foot Soldier Cap',3.4 ,3.8 ,3.1 ,3.6 ,3.6 ,3.8 ,4.4 ,3.8 ,27 ,18 ,23 ,23 ,2 ,3.6 , 'A-Hel'),
 ('Hel-134', 'Godskin Noble Hood',1.4 ,2.8 ,1.8 ,1.4 ,4.5 ,4 ,4.2 ,4.8 ,16 ,10 ,27 ,29 ,1 ,1.7 , 'A-Hel'),
 ('Hel-135', 'Grass Hair Ornament',1.4 ,1.4 ,1.4 ,0.9 ,4.5 ,4.2 ,4.4 ,4.5 ,16 ,9 ,27 ,27 ,0 ,1.4 , 'A-Hel'),
 ('Hel-136', 'Greathood',3.8 ,3.6 ,3.8 ,3.6 ,5.5 ,5 ,5.5 ,6.2 ,33 ,20 ,47 ,47 ,2 ,5.1 , 'A-Hel'),
 ('Hel-137', 'Guardian Mask',3.8 ,3.6 ,3.6 ,3.4 ,4.2 ,4 ,4.2 ,4.2 ,33 ,22 ,26 ,24 ,2 ,3.8 , 'A-Hel'),
 ('Hel-138', 'Haima Glintstone Crown',2.3 ,2.5 ,2.1 ,2.3 ,4.8 ,4.5 ,4.6 ,4.6 ,22 ,11 ,33 ,39 ,2 ,2.7 , 'A-Hel'),
 ('Hel-139', 'Haligtree Knight Helm',4.8 ,4.4 ,4.8 ,4.8 ,3.6 ,4 ,3.4 ,4 ,15 ,24 ,10 ,11 ,5 ,5.1 , 'A-Hel'),
 ('Hel-140', 'High Page Hood',0.9 ,1.8 ,0.9 ,0.9 ,4.6 ,4.2 ,4.4 ,4.5 ,15 ,8 ,27 ,27 ,0 ,1.4 , 'A-Hel'),
 ('Hel-141', 'Ijis Mirrorhelm',3.8 ,3.8 ,5.2 ,5.2 ,6.2 ,4.6 ,4.8 ,5.8 ,22 ,42 ,26 ,39 ,5 ,7.5 , 'A-Hel'),
 ('Hel-142', 'Iron Kasa',3.6 ,3.6 ,4.2 ,3.6 ,4 ,4.2 ,4.4 ,4 ,30 ,23 ,24 ,24 ,2 ,3.8 , 'A-Hel'),
 ('Hel-143', 'Jar',6.8 ,3.4 ,7 ,6.8 ,4.7 ,4.9 ,4.6 ,4.7 ,24 ,33 ,16 ,15 ,8 ,6.8 , 'A-Hel'),
 ('Hel-144', 'Lazuli Glintstone Crown',4.4 ,3.1 ,5.2 ,4.8 ,4.4 ,4.5 ,3.4 ,3.8 ,16 ,26 ,10 ,10 ,3 ,5.1 , 'A-Hel'),
 ('Hel-145', 'Leyndell Soldier Helm',4.4 ,3.8 ,4.2 ,4.4 ,2.8 ,3.4 ,2.8 ,3.1 ,12 ,22 ,9 ,9 ,5 ,4 , 'A-Hel'),
 ('Hel-146', 'Lusats Glintstone Crown',3.1 ,2.3 ,3.1 ,2.3 ,5.5 ,4.6 ,4.8 ,4.9 ,23 ,11 ,39 ,44 ,2 ,3.6 , 'A-Hel'),
 ('Hel-147', 'Malenias Winged Helm',4.4 ,3.4 ,4.6 ,4 ,2.8 ,3.4 ,2.3 ,3.8 ,22 ,18 ,8 ,8 ,4 ,4 , 'A-Hel'),
 ('Hel-148', 'Nights Cavalry Helm',5 ,4.6 ,5 ,4.8 ,3.8 ,4.5 ,3.8 ,4.5 ,16 ,24 ,10 ,10 ,7 ,5.5 , 'A-Hel'),
 ('Hel-149', 'Nights Cavalry Helm (Altered)',4.8 ,4.4 ,4.8 ,4.4 ,3.6 ,4.4 ,3.6 ,4.4 ,13 ,21 ,9 ,9 ,5 ,5.1 , 'A-Hel'),
 ('Hel-150', 'Nomadic Merchants Chapeau',2.8 ,3.1 ,2.5 ,2.3 ,3.4 ,3.4 ,3.4 ,3.1 ,24 ,14 ,31 ,20 ,1 ,3 , 'A-Hel'),
 ('Hel-151', 'Nox Monk Hood',2.8 ,3.1 ,2.8 ,2.5 ,4 ,3.8 ,3.8 ,3.1 ,24 ,15 ,18 ,18 ,1 ,3 , 'A-Hel'),
 ('Hel-152', 'Nox Monk Hood (Altered)',2.5 ,2.8 ,2.5 ,2.3 ,3.8 ,3.6 ,3.6 ,2.8 ,21 ,12 ,14 ,14 ,0 ,2.7 , 'A-Hel'),
 ('Hel-153', 'Nox Swordstress Crown',2.8 ,3.4 ,2.8 ,3.1 ,4.4 ,3.6 ,4.2 ,3.8 ,24 ,15 ,22 ,22 ,2 ,3.3 , 'A-Hel'),
 ('Hel-154', 'Nox Swordstress Crown (Altered)',2.3 ,2.8 ,2.3 ,2.5 ,4 ,3.1 ,3.8 ,3.4 ,21 ,11 ,17 ,17 ,0 ,2.7 , 'A-Hel'),
 ('Hel-155', 'Old Aristocrat Cowl',2.5 ,2.5 ,2.3 ,2.5 ,3.4 ,3.6 ,3.4 ,2.5 ,18 ,11 ,15 ,16 ,1 ,2.2 , 'A-Hel'),
 ('Hel-156', 'Omen Helm',6.7 ,5.4 ,6.8 ,6.8 ,4.6 ,5.2 ,5.3 ,4.9 ,29 ,27 ,24 ,33 ,13 ,9.9 , 'A-Hel'),
 ('Hel-157', 'Radahn Soldier Helm',4.6 ,3.4 ,4.2 ,4 ,3.1 ,3.8 ,2.5 ,3.1 ,12 ,20 ,9 ,10 ,5 ,4 , 'A-Hel'),
 ('Hel-158', 'Ragged Hat',3.1 ,3.4 ,3.1 ,3.1 ,3.6 ,3.8 ,4 ,3.6 ,26 ,16 ,22 ,22 ,2 ,3.3 , 'A-Hel'),
 ('Hel-159', 'Ragged Hat (Altered)',2.8 ,3.1 ,2.8 ,2.8 ,3.4 ,3.6 ,3.8 ,3.4 ,21 ,13 ,20 ,18 ,2 ,3 , 'A-Hel'),
 ('Hel-160', 'Raya Lucarian Helm',4.4 ,3.4 ,4.6 ,4.4 ,3.4 ,3.6 ,2.3 ,2.8 ,12 ,22 ,9 ,9 ,5 ,4 , 'A-Hel'),
 ('Hel-161', 'Redmane Knight Helm',5 ,4 ,4.8 ,4.4 ,3.8 ,4.4 ,3.4 ,3.8 ,15 ,23 ,10 ,11 ,6 ,5.1 , 'A-Hel'),
 ('Hel-162', 'Royal Knight Helm',5.8 ,5.2 ,6.3 ,6.1 ,5 ,4.7 ,4.4 ,4.6 ,22 ,29 ,15 ,15 ,8 ,6.6 , 'A-Hel'),
 ('Hel-163', 'Royal Remains Helm',4.2 ,4 ,4.6 ,4.2 ,3.4 ,3.6 ,2.8 ,3.1 ,15 ,24 ,10 ,5 ,5 ,4.6 , 'A-Hel'),
 ('Hel-164', 'Sacred Crown Helm',3.4 ,3.8 ,3.1 ,3.6 ,3.6 ,3.8 ,4.2 ,4 ,27 ,18 ,23 ,24 ,2 ,3.6 , 'A-Hel'),
 ('Hel-165', 'Sanguine Noble Hood',1.4 ,0.9 ,0.9 ,0.9 ,4.6 ,3.8 ,4.5 ,4.6 ,18 ,5 ,29 ,27 ,0 ,1.4 , 'A-Hel'),
 ('Hel-166', 'Skeletal Mask',2.5 ,2.8 ,3.1 ,3.1 ,3.4 ,3.4 ,3.6 ,3.1 ,23 ,14 ,24 ,24 ,1 ,3 , 'A-Hel'),
 ('Hel-167', 'Spellblades Pointed Hat',1.3 ,0.8 ,1.3 ,1.3 ,4.5 ,3.9 ,4.1 ,4.5 ,15 ,8 ,25 ,27 ,0 ,1.5 , 'A-Hel'),
 ('Hel-168', 'Tree Sentinel Helm',6.8 ,5.4 ,6.8 ,6.3 ,4.6 ,6.2 ,4.5 ,5 ,29 ,39 ,18 ,20 ,9 ,8.1 , 'A-Hel'),
 ('Hel-169', 'White Mask',2.7 ,3 ,3.3 ,2.7 ,3.5 ,3.7 ,3.9 ,3.7 ,23 ,18 ,21 ,22 ,2 ,3.2 , 'A-Hel')
GO
INSERT INTO Armor_info(A_ID,A_Name,Phy_guard,Phy_strike,Phy_slash,Phy_thurst,Mag_guard,Fie_guard,Light_guard,Holy_guard,Inmunity,Robustness,Focus,Vitality,Poise,Weigth,ET_ID)
VALUES
 ('Gau-1', 'All-Knowing Gauntlets',3.2 ,2.9 ,3.3 ,2.9 ,3.1 ,2.3 ,2.5 ,2.1 ,9 ,15 ,7 ,7 ,4 ,3.5 , 'A-Gau'),
 ('Gau-2', 'Alberichs Bracers',1.3 ,1 ,1.3 ,1.3 ,3.2 ,2.9 ,3.1 ,3.2 ,13 ,8 ,22 ,24 ,0 ,1.4 , 'A-Gau'),
 ('Gau-3', 'Astrologer Gloves',1.3 ,1 ,1 ,1 ,3.2 ,3.1 ,3.2 ,3.1 ,14 ,7 ,24 ,21 ,1 ,1.4 , 'A-Gau'),
 ('Gau-4', 'Azurs Manchettes',1.0 ,0.1 ,0.6 ,0.6 ,3.4 ,2.8 ,2.9 ,3.2 ,12 ,8 ,22 ,20 ,0 ,1.1 , 'A-Gau'),
 ('Gau-5', 'Bandit Manchettes',1.5 ,1.6 ,1.7 ,1.7 ,1.9 ,1.9 ,2.1 ,1.7 ,15 ,8 ,17 ,17 ,0 ,1.7 , 'A-Gau'),
 ('Gau-6', 'Beast Champion Gauntlets',4.4 ,4.1 ,4.7 ,4.6 ,3.2 ,3.4 ,3.2 ,3.3 ,19 ,30 ,14 ,13 ,6 ,5.8 , 'A-Gau'),
 ('Gau-7', 'Black Knife Gauntlets',2.8 ,2.7 ,3.1 ,3.1 ,2.1 ,2.3 ,1.6 ,2.8 ,9 ,15 ,8 ,8 ,3 ,3.1 , 'A-Gau'),
 ('Gau-8', 'Blackflame Monk Gauntlets',3.3 ,2.8 ,3.6 ,3.2 ,2.5 ,3.2 ,1.9 ,2.5 ,11 ,18 ,7 ,11 ,4 ,3.9 , 'A-Gau'),
 ('Gau-9', 'Bloodhound Knight Gauntlets',3.1 ,2.8 ,3.5 ,3.3 ,2.3 ,2.5 ,1.7 ,2.5 ,11 ,17 ,8 ,8 ,3 ,3.5 , 'A-Gau'),
 ('Gau-10', 'Bloodsoaked Manchettes',1.3 ,1.5 ,1 ,0.6 ,3.1 ,3.1 ,3.1 ,3.1 ,14 ,9 ,24 ,22 ,0 ,1.4 , 'A-Gau'),
 ('Gau-11', 'Briar Gauntlets',3.2 ,2.8 ,3.3 ,3.1 ,2.7 ,3.1 ,2.1 ,2.7 ,12 ,24 ,8 ,8 ,3 ,3.9 , 'A-Gau'),
 ('Gau-12', 'Bull-Goat Gauntlets',5.2 ,5.2 ,4.6 ,4.6 ,3.3 ,3.3 ,3.7 ,3.2 ,24 ,28 ,15 ,18 ,10 ,8.8 , 'A-Gau'),
 ('Gau-13', 'Carian Knight Gauntlets',2.9 ,2.7 ,3.1 ,2.9 ,3.1 ,2.9 ,2.3 ,2.9 ,9 ,15 ,7 ,8 ,3 ,3.5 , 'A-Gau'),
 ('Gau-14', 'Gauntlets',2.9 ,2.1 ,3.2 ,2.9 ,1.7 ,2.7 ,1.5 ,1.9 ,8 ,14 ,4 ,6 ,3 ,2.9 , 'A-Gau'),
 ('Gau-15', 'Champion Bracers',1.6 ,2.1 ,1.7 ,1.9 ,1.9 ,2.3 ,2.5 ,2.3 ,17 ,11 ,14 ,13 ,1 ,2.1 , 'A-Gau'),
 ('Gau-16', 'Cleanrot Gauntlets',3.6 ,3.3 ,4 ,4.4 ,3.1 ,3.2 ,2.8 ,3.3 ,21 ,22 ,9 ,11 ,5 ,5 , 'A-Gau'),
 ('Gau-17', 'Confessor Gloves',2.1 ,2.7 ,2.1 ,2.3 ,2.8 ,2.8 ,3.1 ,2.5 ,21 ,17 ,17 ,18 ,1 ,2.8 , 'A-Gau'),
 ('Gau-18', 'Crucible Gauntlets',4.4 ,3.4 ,4.2 ,4.2 ,3.2 ,3.2 ,2.8 ,3.3 ,17 ,24 ,12 ,12 ,6 ,5.2 , 'A-Gau'),
 ('Gau-19', 'Elden Lord Bracers',2.9 ,2.7 ,2.8 ,3.1 ,2.1 ,2.8 ,1.7 ,1.9 ,11 ,18 ,6 ,7 ,3 ,3.1 , 'A-Gau'),
 ('Gau-20', 'Exile Gauntlets',2.9 ,2.1 ,3.1 ,2.9 ,1.7 ,2.5 ,1.5 ,2.1 ,8 ,17 ,6 ,4 ,3 ,2.9 , 'A-Gau'),
 ('Gau-21', 'Errant Sorcerer Manchettes',0.6 ,0.6 ,1.3 ,0.6 ,3.2 ,3.1 ,2.9 ,3.2 ,11 ,7 ,21 ,22 ,0 ,1.1 , 'A-Gau'),
 ('Gau-22', 'Fire Monk Gauntlets',3.5 ,3.1 ,3.3 ,3.1 ,2.7 ,3.3 ,2.3 ,2.3 ,11 ,18 ,8 ,8 ,4 ,3.9 , 'A-Gau'),
 ('Gau-23', 'Foot Soldier Gauntlets',2.1 ,2.3 ,2.1 ,2.1 ,2.5 ,2.7 ,2.8 ,2.5 ,20 ,13 ,17 ,17 ,1 ,2.6 , 'A-Gau'),
 ('Gau-24', 'Gelmir Knight Gauntlets',3.3 ,2.8 ,3.5 ,3.3 ,2.7 ,3.1 ,2.5 ,2.7 ,12 ,18 ,8 ,8 ,4 ,3.9 , 'A-Gau'),
 ('Gau-25', 'Godrick Knight Gauntlets',3.3 ,2.9 ,3.5 ,3.2 ,2.7 ,2.9 ,2.3 ,2.7 ,12 ,19 ,8 ,8 ,4 ,3.9 , 'A-Gau'),
 ('Gau-26', 'Godskin Apostle Bracelets',1.7 ,1.6 ,1.6 ,1.3 ,3.2 ,3.1 ,3.2 ,3.6 ,17 ,8 ,28 ,25 ,1 ,2.1 , 'A-Gau'),
 ('Gau-27', 'Haligtree Gauntlets',3.2 ,2.9 ,3.1 ,3.2 ,2.3 ,2.5 ,1.9 ,2.5 ,11 ,18 ,8 ,8 ,3 ,3.5 , 'A-Gau'),
 ('Gau-28', 'Highwayman Gauntlets',1.9 ,2.5 ,1.9 ,2.1 ,2.7 ,2.7 ,2.8 ,2.5 ,19 ,12 ,17 ,17 ,1 ,2.6 , 'A-Gau'),
 ('Gau-29', 'Hoslows Gauntlets',3.5 ,2.9 ,3.3 ,3.1 ,2.7 ,2.9 ,2.5 ,2.5 ,13 ,20 ,8 ,8 ,4 ,3.9 , 'A-Gau'),
 ('Gau-30', 'Kaiden Gauntlets',2.9 ,2.1 ,2.9 ,2.9 ,1.9 ,2.1 ,1.7 ,1.9 ,8 ,15 ,6 ,6 ,3 ,2.9 , 'A-Gau'),
 ('Gau-31', 'Knight Gauntlets',3.1 ,2.9 ,3.3 ,3.3 ,2.7 ,2.7 ,2.3 ,2.1 ,9 ,17 ,6 ,6 ,4 ,3.5 , 'A-Gau'),
 ('Gau-32', 'Land of Reeds Gauntlets',2.1 ,2.3 ,2.9 ,2.3 ,2.5 ,2.8 ,2.9 ,2.7 ,20 ,17 ,17 ,18 ,1 ,2.8 , 'A-Gau'),
 ('Gau-33', 'Leyndell Knight Gauntlets',3.3 ,3.1 ,3.3 ,3.3 ,2.5 ,2.8 ,2.5 ,2.7 ,12 ,19 ,8 ,8 ,4 ,3.9 , 'A-Gau'),
 ('Gau-34', 'Leyndell Soldier Gauntlets',3.2 ,2.9 ,3.1 ,3.2 ,2.3 ,2.5 ,2.1 ,2.3 ,11 ,18 ,8 ,8 ,4 ,3.5 , 'A-Gau'),
 ('Gau-35', 'Lionels Gauntlets',4.4 ,4.1 ,4.9 ,5 ,3.3 ,3.7 ,3.2 ,3.3 ,21 ,33 ,14 ,17 ,8 ,7.1 , 'A-Gau'),
 ('Gau-36', 'Malformed Dragon Gauntlets',4.2 ,3.7 ,4.4 ,4.2 ,3.2 ,3.2 ,3.4 ,3.2 ,19 ,25 ,13 ,13 ,6 ,5.3 , 'A-Gau'),
 ('Gau-37', 'Malikeths Gauntlets',3.3 ,2.9 ,3.5 ,3.3 ,2.7 ,2.8 ,2.3 ,3.2 ,12 ,19 ,8 ,17 ,4 ,4.3 , 'A-Gau'),
 ('Gau-38', 'Mushroom Arms',1.5 ,1.7 ,0.6 ,1.3 ,3.3 ,1.3 ,3.2 ,3.2 ,34 ,8 ,30 ,25 ,0 ,1.7 , 'A-Gau'),
 ('Gau-39', 'Nobles Gloves',1.5 ,1.6 ,1.5 ,1.6 ,3.3 ,3.3 ,3.2 ,3.3 ,15 ,8 ,25 ,28 ,1 ,2.1 , 'A-Gau'),
 ('Gau-40', 'Omenkiller Long Gloves',2.1 ,1.9 ,1.7 ,1.7 ,2.1 ,2.3 ,2.8 ,2.5 ,22 ,9 ,15 ,15 ,1 ,2.4 , 'A-Gau'),
 ('Gau-41', 'Iron Gauntlets',2.8 ,2.3 ,2.9 ,2.9 ,2.1 ,2.3 ,1.5 ,1.9 ,8 ,15 ,6 ,4 ,3 ,2.9 , 'A-Gau'),
 ('Gau-42', 'Perfumer Gloves',1 ,1.5 ,1.3 ,1 ,3.2 ,2.9 ,3.1 ,3.2 ,20 ,5 ,21 ,22 ,0 ,1.4 , 'A-Gau'),
 ('Gau-43', 'Preceptors Gloves',1.5 ,1.6 ,1.5 ,1.5 ,3.6 ,3.3 ,3.2 ,3.2 ,17 ,8 ,28 ,25 ,1 ,2.1 , 'A-Gau'),
 ('Gau-44', 'Queens Bracelets',1.5 ,1.3 ,1.3 ,1 ,3.4 ,3.1 ,3.2 ,3.3 ,14 ,8 ,24 ,28 ,0 ,1.7 , 'A-Gau'),
 ('Gau-45', 'Radahns Gauntlets',4.7 ,3.7 ,4.6 ,4.4 ,3.3 ,3.5 ,3.1 ,3.3 ,20 ,33 ,14 ,13 ,6 ,5.8 , 'A-Gau'),
 ('Gau-46', 'Raging Wolf Gauntlets',3.3 ,2.9 ,3.3 ,3.2 ,2.5 ,2.8 ,1.7 ,2.3 ,11 ,19 ,6 ,6 ,3 ,3.5 , 'A-Gau'),
 ('Gau-47', 'Raya Lucarian Gauntlets',3.2 ,2.7 ,3.3 ,3.2 ,2.7 ,2.7 ,1.7 ,2.1 ,11 ,18 ,8 ,8 ,4 ,3.5 , 'A-Gau'),
 ('Gau-48', 'Scaled Gauntlets',4 ,3.4 ,4.2 ,4 ,3.3 ,3.5 ,3.2 ,3.3 ,19 ,28 ,13 ,13 ,6 ,5.3 , 'A-Gau'),
 ('Gau-49', 'Sorcerer Manchettes',1.0 ,1.3 ,1.3 ,0.1 ,3.2 ,3.1 ,2.9 ,3.1 ,13 ,4 ,21 ,20 ,0 ,1.1 , 'A-Gau'),
 ('Gau-50', 'Traveling Maiden Gloves',1.3 ,1.5 ,1.5 ,1 ,3.3 ,3.2 ,3.2 ,3.3 ,15 ,8 ,25 ,28 ,1 ,1.7 , 'A-Gau'),
 ('Gau-51', 'Twinned Gauntlets',3.3 ,3.1 ,3.6 ,2.9 ,2.8 ,2.8 ,2.1 ,2.5 ,11 ,18 ,7 ,18 ,4 ,3.9 , 'A-Gau'),
 ('Gau-52', 'Warrior Gauntlets',2.3 ,2.3 ,1.9 ,1.9 ,2.5 ,2.7 ,2.9 ,2.3 ,21 ,14 ,17 ,17 ,1 ,2.6 , 'A-Gau'),
 ('Gau-53', 'Vagabond Knight Gauntlets',3.3 ,2.8 ,3.1 ,2.9 ,2.5 ,2.7 ,2.1 ,2.1 ,12 ,19 ,8 ,8 ,3 ,3.5 , 'A-Gau'),
 ('Gau-54', 'Veterans Gauntlets',4.7 ,4.3 ,4.7 ,4.4 ,3.3 ,3.5 ,3.2 ,3.3 ,21 ,30 ,15 ,15 ,8 ,6.3 , 'A-Gau'),
 ('Gau-55', 'Vulgar Militia Gauntlets',1.7 ,2.1 ,1.9 ,1.6 ,2.1 ,2.1 ,2.3 ,2.1 ,20 ,9 ,14 ,14 ,1 ,2.1 , 'A-Gau'),
 ('Gau-56', 'White Reed Gauntlets',2.3 ,2.5 ,2.8 ,2.1 ,2.7 ,2.7 ,2.9 ,2.5 ,22 ,14 ,18 ,17 ,2 ,2.8 , 'A-Gau'),
 ('Gau-57', 'Zamor Bracelets',2.8 ,2.1 ,2.9 ,2.5 ,1.9 ,1.9 ,1.3 ,1.7 ,6 ,20 ,0 ,4 ,3 ,2.8 , 'A-Gau'),
 ('Gau-58', 'Banished Knight Gauntlets',4.7 ,3.7 ,4.9 ,4.4 ,3.3 ,3.3 ,3.2 ,3.3 ,20 ,28 ,13 ,14 ,6 ,5.8 , 'A-Gau'),
 ('Gau-59', 'Battlemage Manchettes',1 ,1.3 ,0.6 ,1 ,3.2 ,2.8 ,2.9 ,3.1 ,13 ,7 ,20 ,22 ,0 ,1.1 , 'A-Gau'),
 ('Gau-60', 'Blaidds Gauntlets',3.6 ,3.2 ,3.6 ,3.8 ,2.8 ,3.2 ,2.7 ,2.9 ,13 ,21 ,8 ,8 ,5 ,4.6 , 'A-Gau'),
 ('Gau-61', 'Blue Silver Bracelets',2.3 ,1.5 ,2.5 ,1.9 ,1.9 ,1.6 ,1 ,1 ,4 ,14 ,0 ,4 ,1 ,2.1 , 'A-Gau'),
 ('Gau-62', 'Braves Bracer',0.6 ,0.6 ,0.6 ,0.1 ,3.1 ,2.8 ,2.9 ,3.1 ,12 ,6 ,0 ,20 , 0,0.8 , 'A-Gau'),
 ('Gau-63', 'Cuckoo Knight Gauntlets',3.3 ,2.8 ,3.6 ,3.3 ,3.1 ,2.9 ,2.1 ,2.5 ,11 ,19 ,8 ,8 ,4 ,3.9 , 'A-Gau'),
 ('Gau-64', 'Depraved Perfumer Gloves',1.5 ,1.5 ,1.4 ,1.2 ,3.2 ,3.1 ,3.1 ,3.1 ,23 ,8 ,20 ,28 ,1 ,2 , 'A-Gau'),
 ('Gau-65', 'Drake Knight Gauntlets',2.8 ,2.3 ,2.9 ,2.8 ,2.5 ,2.8 ,2.1 ,2.5 ,8 ,15 ,7 ,7 ,3 ,3.1 , 'A-Gau'),
 ('Gau-66', 'Eccentrics Manchettes',2.9 ,2.1 ,2.8 ,2.9 ,2.1 ,2.3 ,1.5 ,1.9 ,8 ,18 ,6 ,4 ,3 ,2.9 , 'A-Gau'),
 ('Gau-67', 'Fingerprint Gauntlets',3.3 ,2.9 ,2.9 ,2.9 ,2.3 ,3.1 ,1.6 ,2.3 ,11 ,20 ,4 ,8 ,4 ,3.5 , 'A-Gau'),
 ('Gau-68', 'Fire Prelate Gauntlets',4.9 ,4.3 ,4.6 ,4.6 ,3.3 ,5 ,3.2 ,3.3 ,22 ,21 ,30 ,17 ,9 ,8.2 , 'A-Gau'),
 ('Gau-69', 'Godrick Soldier Gauntlets',3.2 ,2.8 ,3.2 ,3.1 ,2.5 ,2.7 ,1.9 ,2.3 ,11 ,18 ,8 ,8 ,4 ,3.5 , 'A-Gau'),
 ('Gau-70', 'Godskin Noble Bracelets',1.3 ,2.1 ,1.5 ,1.3 ,3.2 ,2.9 ,3.1 ,3.4 ,14 ,8 ,24 ,25 ,1 ,1.7 , 'A-Gau'),
 ('Gau-71', 'Gold Bracelets',1 ,0.6 ,0.6 ,0.1 ,2.9 ,2.8 ,2.9 ,3.2 ,13 ,4 ,20 ,20 ,0 ,0.8 , 'A-Gau'),
 ('Gau-72', 'Golden Prosthetic',1.5 ,1.5 ,1.5 ,1.3 ,3.2 ,3.1 ,3.2 ,3.2 ,15 ,8 ,0 ,25 , 0,2.8 , 'A-Gau'),
 ('Gau-73', 'Guardian Bracers',2.7 ,2.5 ,2.5 ,2.3 ,2.9 ,2.8 ,2.9 ,2.9 ,25 ,17 ,20 ,19 ,1 ,2.9 , 'A-Gau'),
 ('Gau-74', 'Haligtree Knight Gauntlets',3.3 ,3.1 ,3.3 ,3.3 ,2.5 ,2.8 ,2.3 ,2.8 ,12 ,19 ,8 ,8 ,4 ,3.9 , 'A-Gau'),
 ('Gau-75', 'Leather Gloves',1.9 ,2.3 ,1.9 ,2.1 ,2.3 ,2.3 ,2.5 ,2.5 ,20 ,12 ,14 ,17 ,1 ,2.4 , 'A-Gau'),
 ('Gau-76', 'Lusats Manchettes',1.3 ,0.1 ,1.3 ,0.1 ,3.4 ,2.8 ,3.1 ,3.1 ,12 ,6 ,20 ,22 ,0 ,1.1 , 'A-Gau'),
 ('Gau-77', 'Malenias Gauntlet',3.1 ,2.3 ,3.2 ,2.8 ,1.9 ,2.3 ,1.6 ,2.7 ,17 ,14 ,6 ,6 ,3 ,3.1 , 'A-Gau'),
 ('Gau-78', 'Mausoleum Gauntlets',3.2 ,2.7 ,3.3 ,3.1 ,2.5 ,2.5 ,2.1 ,2.5 ,11 ,17 ,8 ,7 ,4 ,3.5 , 'A-Gau'),
 ('Gau-79', 'Mausoleum Knight Gauntlets',3.3 ,2.8 ,3.6 ,3.2 ,2.7 ,2.8 ,2.5 ,2.8 ,12 ,18 ,8 ,8 ,4 ,3.9 , 'A-Gau'),
 ('Gau-80', 'Millicents Gloves',1 ,1 ,1 ,0.6 ,3.1 ,2.9 ,3.1 ,3.1 ,13 ,7 , 0,21 , 0,1.1 , 'A-Gau'),
 ('Gau-81', 'Nights Cavalry Gauntlets',3.5 ,3.2 ,3.5 ,3.3 ,2.7 ,3.1 ,2.7 ,3.1 ,13 ,19 ,8 ,8 ,4 ,4.3 , 'A-Gau'),
 ('Gau-82', 'Nox Bracelets',2.1 ,2.3 ,2.1 ,1.9 ,2.9 ,2.8 ,2.8 ,2.3 ,20 ,13 ,15 ,15 ,1 ,2.6 , 'A-Gau'),
 ('Gau-83', 'Omen Gauntlets',4.6 ,3.7 ,4.7 ,4.7 ,3.2 ,3.6 ,3.7 ,3.4 ,22 ,21 ,19 ,25 ,9 ,7.7 , 'A-Gau'),
 ('Gau-84', 'Radahn Soldier Gauntlets',3.3 ,2.7 ,3.1 ,2.9 ,2.5 ,2.8 ,1.9 ,2.3 ,11 ,17 ,8 ,8 ,4 ,3.5 , 'A-Gau'),
 ('Gau-85', 'Ragged Gloves',2.3 ,2.5 ,2.3 ,2.3 ,2.7 ,2.8 ,2.9 ,2.7 ,21 ,14 ,18 ,18 ,2 ,2.9 , 'A-Gau'),
 ('Gau-86', 'Redmane Knight Gauntlets',3.5 ,2.8 ,3.3 ,3.1 ,2.7 ,3.1 ,2.3 ,2.7 ,12 ,18 ,8 ,8 ,4 ,3.9 , 'A-Gau'),
 ('Gau-87', 'Ronins Gauntlets',2.7 ,2.7 ,2.8 ,2.7 ,2.9 ,3.1 ,3.2 ,2.9 ,25 ,19 ,20 ,21 ,2 ,3.1 , 'A-Gau'),
 ('Gau-88', 'Royal Knight Gauntlets',4 ,3.6 ,4.4 ,4.2 ,3.5 ,3.3 ,3.1 ,3.2 ,17 ,22 ,12 ,12 ,5 ,5.2 , 'A-Gau'),
 ('Gau-89', 'Royal Remains Gauntlets',2.9 ,2.8 ,3.2 ,2.9 ,2.3 ,2.5 ,1.9 ,2.1 ,12 ,19 ,8 ,4 ,3 ,3.5 , 'A-Gau'),
 ('Gau-90', 'Spellblades Gloves',0.9 ,0.5 ,0.9 ,0.9 ,3.1 ,2.7 ,2.8 ,3.1 ,11 ,6 ,19 ,20 ,0 ,1.2 , 'A-Gau'),
 ('Gau-91', 'Travelers Gloves',1.3 ,1.3 ,1 ,0.6 ,3.2 ,3.2 ,3.1 ,3.2 ,18 ,7 ,22 ,21 ,0 ,1.4 , 'A-Gau'),
 ('Gau-92', 'Travelers Manchettes',1.6 ,1.5 ,1.3 ,1 ,3.3 ,3.2 ,3.2 ,3.1 ,13 ,8 ,25 ,25 ,1 ,1.7 , 'A-Gau'),
 ('Gau-93', 'Tree Sentinel Gauntlets',4.7 ,3.7 ,4.7 ,4.4 ,3.2 ,4.3 ,3.1 ,3.5 ,22 ,30 ,14 ,15 ,6 ,6.3 , 'A-Gau'),
 ('Gau-94', 'War Surgeon Gloves',1.6 ,1.8 ,2 ,1.6 ,2.2 ,2.4 ,2.6 ,2.4 ,18 ,13 ,15 ,17 ,1 ,2.3 , 'A-Gau')
GO
INSERT INTO Armor_info(A_ID,A_Name,Phy_guard,Phy_strike,Phy_slash,Phy_thurst,Mag_guard,Fie_guard,Light_guard,Holy_guard,Inmunity,Robustness,Focus,Vitality,Poise,Weigth,ET_ID)
VALUES
 ('Che-1', 'All-Knowing Armor',12.9 ,11.9 ,13.5 ,11.9 ,12.4 ,9.5 ,10.2 ,8.8 ,28 ,46 ,21 ,21 ,16 ,10.7 , 'A-Che'),
 ('Che-2', 'Alberichs Robe',5.3 ,4.2 ,5.3 ,5.3 ,12.8 ,11.9 ,12.4 ,12.8 ,38 ,23 ,67 ,71 ,1 ,4.1 , 'A-Che'),
 ('Che-3', 'Aristocrat Coat',8.8 ,8.8 ,8 ,8.8 ,10.9 ,11.4 ,10.9 ,8.8 ,50 ,32 ,42 ,46 ,3 ,7.1 , 'A-Che'),
 ('Che-4', 'Aristocrat Garb',7.8 ,8.6 ,7.8 ,7.8 ,6.5 ,6.9 ,7.8 ,6.5 ,47 ,33 ,36 ,30 ,2 ,4.9 , 'A-Che'),
 ('Che-5', 'Astrologer Robe',6.7 ,6.1 ,6.1 ,6.1 ,13.5 ,13 ,13.3 ,13 ,50 ,24 ,90 ,76 ,5 ,6.3 , 'A-Che'),
 ('Che-6', 'Azurs Glintstone Robe',7.1 ,6.1 ,6.7 ,6.7 ,15.4 ,12.8 ,13.0 ,13.8 ,50 ,28 ,99 ,83 ,3 ,7.1 , 'A-Che'),
 ('Che-7', 'Bandit Garb',8 ,8.8 ,9.5 ,9.5 ,10.2 ,10.2 ,10.9 ,9.5 ,57 ,35 ,60 ,60 ,5 ,7.7 , 'A-Che'),
 ('Che-8', 'Banished Knight Armor',18.7 ,15.0 ,19.2 ,17.5 ,13.5 ,13.5 ,13.0 ,13.3 ,60 ,83 ,38 ,42 ,28 ,17.50 , 'A-Che'),
 ('Che-9', 'Beast Champion Armor',17.5 ,16.3 ,18.7 ,18.3 ,13 ,13.8 ,12.8 ,13.5 ,57 ,90 ,42 ,38 ,28 ,17.5 , 'A-Che'),
 ('Che-10', 'Black Knife Armor',11.4 ,10.9 ,12.4 ,12.4 ,8.8 ,9.5 ,6.7 ,11.4 ,28 ,46 ,23 ,23 ,14 ,9.2 , 'A-Che'),
 ('Che-11', 'Blackflame Monk Armor',13.5 ,11.4 ,14.6 ,12.9 ,10.2 ,13.0 ,8.0 ,10.2 ,32 ,55 ,21 ,32 ,19 ,11.8 , 'A-Che'),
 ('Che-12', 'Bloodhound Knight Armor',12.4 ,11.4 ,14 ,13.5 ,9.5 ,10.2 ,7.1 ,10.3 ,32 ,50 ,23 ,23 ,14 ,10.6 , 'A-Che'),
 ('Che-13', 'Blue Cloth Vest',9.5 ,9.5 ,8 ,8 ,10.2 ,10.9 ,11.9 ,9.5 ,63 ,42 ,50 ,50 ,6 ,7.7 , 'A-Che'),
 ('Che-14', 'Blue Silver Mail Armor',12.4 ,9.5 ,12.9 ,11.4 ,10.9 ,10.2 ,8 ,8 ,25 ,60 ,18 ,18 ,14 ,9.2 , 'A-Che'),
 ('Che-15', 'Briar Armor',12.9 ,11.4 ,13.5 ,12.4 ,10.9 ,12.4 ,8.8 ,10.9 ,35 ,71 ,24 ,24 ,14 ,11.8 , 'A-Che'),
 ('Che-16', 'Bull-Goat Armor',20.4 ,20.2 ,18.3 ,18.3 ,13.3 ,13.5 ,14.9 ,12.8 ,71 ,83 ,46 ,55 ,47 ,26.5 , 'A-Che'),
 ('Che-17', 'Carian Knight Armor',11.8 ,10.8 ,12.3 ,11.8 ,12.3 ,11.8 ,9.4 ,11.8 ,28 ,46 ,21 ,23 ,12 ,10.4 , 'A-Che'),
 ('Che-18', 'Chain Armor',11.9 ,8.8 ,12.9 ,11.9 ,7.1 ,10.9 ,6.1 ,8 ,25 ,42 ,11 ,18 ,12 ,8.8 , 'A-Che'),
 ('Che-19', 'Chain-Draped Tabard',9.5 ,10.2 ,9.5 ,9.5 ,10.9 ,11.4 ,11.9 ,10.9 ,63 ,42 ,55 ,55 ,8 ,8.3 , 'A-Che'),
 ('Che-20', 'Champion Pauldron',6.1 ,8 ,6.7 ,7.1 ,7.1 ,8.8 ,9.5 ,8.8 ,46 ,28 ,38 ,35 ,3 ,5.1 , 'A-Che'),
 ('Che-21', 'Cleanrot Armor',14.6 ,13.4 ,16 ,17.5 ,12.6 ,12.8 ,11.4 ,13.5 ,63 ,67 ,28 ,32 ,23 ,15 , 'A-Che'),
 ('Che-22', 'Cloth Garb',5.3 ,4.2 ,2.7 ,4.2 ,12.8 ,12.4 ,11.9 ,12.4 ,42 ,23 ,60 ,60 ,1 ,3.2 , 'A-Che'),
 ('Che-23', 'Commoners Garb',5.3 ,6.7 ,6.7 ,6.1 ,12.8 ,12.4 ,12.6 ,12.8 ,42 ,25 ,76 ,83 ,2 ,5.1 , 'A-Che'),
 ('Che-24', 'Commoners Simple Garb',4.2 ,6.7 ,6.7 ,6.1 ,13 ,12.6 ,12.6 ,12.8 ,46 ,24 ,76 ,83 ,2 ,5.1 , 'A-Che'),
 ('Che-25', 'Confessor Armor',8.8 ,10.9 ,8.8 ,9.5 ,11.4 ,11.4 ,12.4 ,10.2 ,63 ,50 ,50 ,55 ,6 ,8.3 , 'A-Che'),
 ('Che-26', 'Crucible Axe Armor',17.5 ,13.9 ,16.8 ,16.8 ,13 ,12.8 ,11.4 ,13.5 ,50 ,71 ,35 ,35 ,27 ,15.5 , 'A-Che'),
 ('Che-27', 'Crucible Tree Armor',17.7 ,13.9 ,17.5 ,15.8 ,13 ,11.9 ,11.4 ,14.5 ,50 ,71 ,35 ,35 ,27 ,15.5 , 'A-Che'),
 ('Che-28', 'Cuckoo Surcoat',12.9 ,10.9 ,13.5 ,12.9 ,11.9 ,10.9 ,7.1 ,8.8 ,28 ,55 ,23 ,23 ,16 ,10.6 , 'A-Che'),
 ('Che-29', 'Deathbed Dress',0.6 ,2.7 ,0.6 ,0.6 ,11.9 ,11.4 ,11.9 ,12.4 ,38 ,11 ,63 ,107 ,1 ,3.2 , 'A-Che'),
 ('Che-30', 'Depraved Perfumer Robe',6.0 ,6.0 ,5.2 ,4.1 ,13.2 ,12.7 ,12.5 ,12.7 ,65 ,22 ,55 ,80 ,2 ,5.0 , 'A-Che'),
 ('Che-31', 'Eccentrics Armor',12.9 ,10.9 ,12.4 ,12.9 ,10.9 ,10.9 ,7.1 ,9.5 ,35 ,60 ,23 ,21 ,15 ,10.6 , 'A-Che'),
 ('Che-32', 'Elden Lord Armor',11.9 ,10.9 ,11.4 ,12.4 ,8.8 ,11.4 ,7.1 ,8 ,32 ,55 ,18 ,21 ,14 ,9.2 , 'A-Che'),
 ('Che-33', 'Erdtree Surcoat',12.9 ,11.9 ,12.4 ,12.9 ,9.5 ,10.2 ,8.8 ,9.5 ,32 ,55 ,23 ,23 ,16 ,10.6 , 'A-Che'),
 ('Che-34', 'Errant Sorcerer Robe',4.2 ,4.2 ,6.1 ,4.2 ,13 ,12.6 ,12.4 ,13 ,35 ,23 ,67 ,71 ,2 ,4.1 , 'A-Che'),
 ('Che-35', 'Exile Armor',12.4 ,9.5 ,12.9 ,12.4 ,8 ,10.9 ,6.7 ,9.5 ,28 ,55 ,21 ,18 ,14 ,9.2 , 'A-Che'),
 ('Che-36', 'Eye Surcoat',12.9 ,8.8 ,12.9 ,11.9 ,8.8 ,10.9 ,7.1 ,8.8 ,25 ,55 ,21 ,18 ,15 ,9.2 , 'A-Che'),
 ('Che-37', 'Fias Robe',5.3 ,6.1 ,5.3 ,5.3 ,12.6 ,12.4 ,12.6 ,13.0 ,46 ,21 ,76 ,108 ,2 ,5.1 , 'A-Che'),
 ('Che-38', 'Fias Robe (Altered)',2.7 ,4.2 ,2.7 ,2.7 ,11.9 ,11.4 ,11.9 ,12.6 ,34 ,10 ,57 ,93 ,0 ,3.2 , 'A-Che'),
 ('Che-39', 'Fell Omen Cloak',6.1 ,6.7 ,6.7 ,6.1 ,13.0 ,12.4 ,12.6 ,12.8 ,42 ,25 ,71 ,83 ,2 ,5.1 , 'A-Che'),
 ('Che-40', 'Finger Maiden Robe',5.8 ,4.7 ,4.7 ,3.2 ,13.8 ,13.1 ,13.3 ,13.8 ,38 ,21 ,63 ,63 ,2 ,4.6 , 'A-Che'),
 ('Che-41', 'Fire Monk Armor',14 ,12.4 ,13.5 ,12.4 ,10.9 ,13.3 ,9.5 ,9.5 ,32 ,55 ,24 ,24 ,16 ,11.8 , 'A-Che'),
 ('Che-42', 'Fur Raiment',6.1 ,6.7 ,6.1 ,6.1 ,6.7 ,7.1 ,8.8 ,7.1 ,63 ,42 ,55 ,38 ,1 ,5.1 , 'A-Che'),
 ('Che-43', 'Gelmir Knight Armor',13.5 ,11.4 ,14.0 ,13.5 ,10.9 ,12.4 ,10.2 ,10.9 ,35 ,55 ,24 ,23 ,19 ,11.8 , 'A-Che'),
 ('Che-44', 'Godrick Knight Armor',13.5 ,11.9 ,14 ,12.9 ,10.9 ,11.9 ,9.5 ,10.9 ,35 ,57 ,24 ,24 ,19 ,11.8 , 'A-Che'),
 ('Che-45', 'Godskin Apostle Robe',6.1 ,5.3 ,5.3 ,2.7 ,12.6 ,11.9 ,12.4 ,13.8 ,42 ,21 ,67 ,63 ,2 ,4.1 , 'A-Che'),
 ('Che-46', 'Tree-and-Beast Surcoat',12.9 ,11.4 ,12.9 ,12.4 ,10.2 ,10.9 ,8.0 ,9.5 ,32 ,55 ,23 ,23 ,16 ,10.6 , 'A-Che'),
 ('Che-47', 'Haligtree Crest Surcoat',12.9 ,11.9 ,12.4 ,12.9 ,9.5 ,10.2 ,8 ,10.2 ,32 ,55 ,23 ,24 ,15 ,10.6 , 'A-Che'),
 ('Che-48', 'Highwayman Cloth Armor',8.0 ,10.2 ,8.0 ,8.8 ,10.9 ,10.9 ,11.4 ,10.2 ,57 ,35 ,50 ,50 ,6 ,7.7 , 'A-Che'),
 ('Che-49', 'Hoslows Armor',14 ,11.9 ,13.5 ,12.4 ,10.9 ,11.9 ,10.2 ,10.2 ,38 ,60 ,24 ,24 ,16 ,11.8 , 'A-Che'),
 ('Che-50', 'Juvenile Scholar Robe',5.3 ,6.1 ,6.1 ,5.3 ,12.8 ,11.9 ,12.4 ,12.6 ,38 ,25 ,63 ,71 ,1 ,4.1 , 'A-Che'),
 ('Che-51', 'Knight Armor',12.4 ,11.9 ,13.5 ,13.5 ,10.9 ,10.9 ,9.5 ,8.8 ,28 ,50 ,18 ,18 ,19 ,10.6 , 'A-Che'),
 ('Che-52', 'Kaiden Armor',11.9 ,8.8 ,11.9 ,11.9 ,8.0 ,8.8 ,7.1 ,8.0 ,25 ,55 ,11 ,11 ,14 ,8.8 , 'A-Che'),
 ('Che-53', 'Land of Reeds Armor',8.8 ,9.5 ,11.9 ,9.5 ,10.2 ,11.4 ,11.9 ,10.9 ,60 ,50 ,50 ,55 ,6 ,8.3 , 'A-Che'),
 ('Che-54', 'Leather-Draped Tabard',9.50 ,10.9 ,8.8 ,10.2 ,10.2 ,10.9 ,12.4 ,10.9 ,63 ,42 ,55 ,55 ,8 ,8.3 , 'A-Che'),
 ('Che-55', 'Lionels Armor',17.5 ,16.3 ,19.2 ,19.7 ,13.5 ,14.9 ,13 ,13.5 ,63 ,99 ,42 ,50 ,37 ,21.2 , 'A-Che'),
 ('Che-56', 'Lord of Bloods Robe',9.3 ,10 ,8.6 ,8.6 ,10 ,12 ,12.2 ,13.3 ,63 ,23 ,55 ,55 ,8 ,8.1 , 'A-Che'),
 ('Che-57', 'Malformed Dragon Armor',16.8 ,15 ,17.5 ,16.8 ,13 ,13 ,13.8 ,13 ,57 ,76 ,38 ,38 ,26 ,16 , 'A-Che'),
 ('Che-58', 'Malikeths Armor',13.5 ,11.9 ,14 ,13.5 ,10.9 ,11.4 ,9.5 ,12.8 ,35 ,57 ,24 ,50 ,19 ,12.8 , 'A-Che'),
 ('Che-59', 'Marais Robe',5.3 ,6.1 ,4.2 ,2.7 ,12.6 ,12.4 ,12.4 ,12.6 ,42 ,28 ,71 ,67 ,2 ,4.1 , 'A-Che'),
 ('Che-60', 'Millicents Robe',4.2 ,4.2 ,4.2 ,2.7 ,12.6 ,11.9 ,12.4 ,12.6 ,38 ,21 , 0,63 ,0 ,3.2 , 'A-Che'),
 ('Che-61', 'Millicents Tunic',6.1 ,6.1 ,6.1 ,5.3 ,13 ,12.6 ,12.8 ,13 ,46 ,24 , 0,76 , 0,8.3 , 'A-Che'),
 ('Che-62', 'Mushroom Body',6.1 ,7.1 ,2.7 ,5.3 ,13.3 ,5.2 ,12.8 ,13.0 ,102 ,24 ,90 ,76 ,1 ,5.1 , 'A-Che'),
 ('Che-63', 'Nobles Traveling Garb',6.1 ,6.7 ,6.1 ,6.7 ,13.3 ,13.5 ,13 ,13.3 ,46 ,24 ,76 ,83 ,2 ,6.3 , 'A-Che'),
 ('Che-64', 'Old Aristocrat Gown',7.1 ,7.1 ,6.7 ,7.1 ,9.5 ,10.2 ,9.5 ,7.1 ,42 ,25 ,35 ,38 ,2 ,5.1 , 'A-Che'),
 ('Che-65', 'Omenkiller Robe',8.8 ,8.0 ,7.1 ,7.1 ,8.8 ,9.5 ,11.4 ,10.2 ,67 ,28 ,46 ,46 ,6 ,7.1 , 'A-Che'),
 ('Che-66', 'Perfumers Traveling Garb',6.1 ,6.1 ,5.3 ,4.2 ,13 ,13 ,12.6 ,13 ,57 ,23 ,76 ,71 ,2 ,5.1 , 'A-Che'),
 ('Che-67', 'Preceptors Long Gown',6.1 ,6.7 ,6.1 ,6.1 ,14.5 ,13.3 ,12.8 ,12.8 ,50 ,24 ,83 ,76 ,3 ,6.3 , 'A-Che'),
 ('Che-68', 'Prisoner Clothing',4.2 ,5.3 ,5.3 ,4.2 ,11.9 ,11.4 ,11.4 ,12.6 ,42 ,23 ,63 ,63 ,1 ,3.2 , 'A-Che'),
 ('Che-69', 'Prophet Robe',6.7 ,6.7 ,6.1 ,6.7 ,13.5 ,12.4 ,12.6 ,13. ,46 ,25 ,76 ,83 ,2 ,6.3 , 'A-Che'),
 ('Che-70', 'Queens Robe',6.1 ,5.3 ,5.3 ,4.2 ,13.8 ,12.6 ,12.8 ,13.3 ,42 ,25 ,71 ,83 ,2 ,5.1 , 'A-Che'),
 ('Che-71', 'Radahns Lion Armor',18.7 ,15 ,18.3 ,17.5 ,13.5 ,14.1 ,12.6 ,13.5 ,60 ,99 ,42 ,38 ,28 ,17.5 , 'A-Che'),
 ('Che-72', 'Raging Wolf Armor',13.2 ,11.6 ,13.5 ,12.9 ,10.2 ,11.4 ,7.1 ,9.5 ,32 ,57 ,18 ,18 ,15 ,10.1 , 'A-Che'),
 ('Che-73', 'Raya Lucarian Robe',5.3 ,6.1 ,6.1 ,2.7 ,13.5 ,12.6 ,12.4 ,12.8 ,42 ,18 ,67 ,63 ,1 ,4.1 , 'A-Che'),
 ('Che-74', 'Rotten Gravekeeper Cloak',6.7 ,6.7 ,6.7 ,6.7 ,8.8 ,8.8 ,10.9 ,8.8 ,76 ,32 ,42 ,42 ,2 ,6.3 , 'A-Che'),
 ('Che-75', 'Rulers Robe',4.2 ,6.1 ,6.1 ,2.7 ,12.8 ,11.9 ,12.6 ,13 ,42 ,23 ,67 ,67 ,2 ,4.1 , 'A-Che'),
 ('Che-76', 'Sage Robe',6.7 ,6.1 ,6.1 ,4.2 ,13.5 ,12.6 ,13 ,13.5 ,38 ,23 ,71 ,76 ,2 ,5.1 , 'A-Che'),
 ('Che-77', 'Sanguine Noble Robe',6.1 ,5.3 ,5.3 ,5.3 ,13.3 ,11.9 ,13 ,13.5 ,50 ,21 ,83 ,76 ,2 ,5.1 , 'A-Che'),
 ('Che-78', 'Scale Armor',11.9 ,10.2 ,12.4 ,10.9 ,7.1 ,10.9 ,6.7 ,8 ,25 ,46 ,11 ,21 ,14 ,8.8 , 'A-Che'),
 ('Che-79', 'Scaled Armor',16 ,13.9 ,16.8 ,16 ,13.5 ,14.1 ,13 ,13.5 ,57 ,83 ,37 ,38 ,27 ,16.0 , 'A-Che'),
 ('Che-80', 'Snow Witch Robe',5.3 ,6.1 ,6.1 ,4.2 ,13 ,13 ,12.8 ,13 ,38 ,32 ,71 ,71 ,2 ,5.5 , 'A-Che'),
 ('Che-81', 'Traveling Maiden Robe',5.3 ,6.1 ,6.1 ,4.2 ,13.3 ,12.8 ,13 ,13.3 ,46 ,24 ,76 ,83 ,2 ,5.1 , 'A-Che'),
 ('Che-82', 'Twinned Armor',14.6 ,13.3 ,16.0 ,13.5 ,12.4 ,12.4 ,10.2 ,11.4 ,38 ,60 ,24 ,60 ,21 ,13.7 , 'A-Che'),
 ('Che-83', 'Upper-Class Robe',4.2 ,6.1 ,6.1 ,2.7 ,12.8 ,11.9 ,12.6 ,13 ,42 ,23 ,67 ,67 ,2 ,4.1 , 'A-Che'),
 ('Che-84', 'Vagabond Knight Armor',13.5 ,11.4 ,12.4 ,11.9 ,10.2 ,10.9 ,8.8 ,8.8 ,35 ,57 ,23 ,23 ,15 ,10.6 , 'A-Che'),
 ('Che-85', 'Veterans Armor',18.7 ,17 ,18.7 ,17.5 ,13.5 ,14.1 ,12.8 ,13.3 ,63 ,90 ,46 ,46 ,37 ,18.9 , 'A-Che'),
 ('Che-86', 'White Reed Armor',9.5 ,10.2 ,11.4 ,8.8 ,10.9 ,10.9 ,11.9 ,10.2 ,67 ,42 ,55 ,50 ,8 ,8.3 , 'A-Che'),
 ('Che-87', 'Zamor Armor',11.9 ,9.5 ,12.4 ,10.9 ,8.8 ,8.8 ,6.1 ,8 ,21 ,63 ,11 ,18 ,12 ,8.8 , 'A-Che'),
 ('Che-88', 'Marionette Soldier Armor',11.9 ,8.8 ,13.5 ,8.8 ,8.8 ,8.8 ,6.7 ,8.8 ,24 ,50 ,21 ,18 ,14 ,8.8 , 'A-Che'),
 ('Che-89', 'Alberichs Robe (Altered)',4.2 ,2.7 ,4.2 ,4.2 ,12.6 ,11.4 ,11.9 ,12.6 ,32 ,19 ,57 ,61 ,0 ,3.2 , 'A-Che'),
 ('Che-90', 'All-Knowing Armor (Altered)',12.4 ,10.9 ,12.9 ,11.4 ,11.4 ,8.8 ,9.5 ,8 ,22 ,38 ,16 ,16 ,13 ,9.3 , 'A-Che'),
 ('Che-91', 'Aristocrat Garb (Altered)',7.1 ,8 ,7.1 ,7.1 ,6.1 ,6.7 ,7.1 ,6.1 ,42 ,29 ,32 ,25 ,1 ,4.1 , 'A-Che'),
 ('Che-92', 'Astrologer Robe (Altered)',6.1 ,5.3 ,5.3 ,5.3 ,13.3 ,12.8 ,13 ,12.8 ,42 ,21 ,75 ,64 ,2 ,5.3 , 'A-Che'),
 ('Che-93', 'Banished Knight Armor (Altered)',18.3 ,14.4 ,18.7 ,16.8 ,13.3 ,13.3 ,12.8 ,13 ,52 ,69 ,32 ,34 ,25 ,16.5 , 'A-Che'),
 ('Che-94', 'Battlemage Robe',5.3 ,6.1 ,4.2 ,5.3 ,13 ,11.9 ,12.4 ,12.6 ,42 ,23 ,63 ,71 ,2 ,4.1 , 'A-Che'),
 ('Che-95', 'Beast Champion Armor (Altered)',17.2 ,15.9 ,18.5 ,18.2 ,12.9 ,13.7 ,12.7 ,13.4 ,50 ,75 ,34 ,32 ,25 ,16.4 , 'A-Che'),
 ('Che-96', 'Black Knife Armor (Altered)',11.3 ,10.8 ,12.3 ,12.3 ,8.7 ,9.4 ,6.6 ,11.3 ,25 ,42 ,21 ,21 ,12 ,9 , 'A-Che'),
 ('Che-97', 'Blaidds Armor',14.6 ,12.9 ,14.6 ,15.3 ,11.4 ,12.6 ,10.2 ,11.9 ,38 ,76 ,25 ,25 ,24 ,13.7 , 'A-Che'),
 ('Che-98', 'Blaidds Armor (Altered)',14 ,12.4 ,14 ,14.6 ,10.9 ,12.4 ,9.5 ,11.4 ,32 ,57 ,22 ,21 ,20 ,12.5 , 'A-Che'),
 ('Che-99', 'Bloodhound Knight Armor (Altered)',12.1 ,11.1 ,13.7 ,13.2 ,9.2 ,9.9 ,6.8 ,9.9 ,29 ,45 ,21 ,21 ,12 ,9.6 , 'A-Che'),
 ('Che-100', 'Bloodsoaked Tabard',9.5 ,9.5 ,10.2 ,9.5 ,10.9 ,10.9 ,12.4 ,11.4 ,63 ,38 ,55 ,50 ,9 ,8.3 , 'A-Che'),
 ('Che-101', 'Blue Festive Garb',4.2 ,4.2 ,6.1 ,5.3 ,12.6 ,11.4 ,12.6 ,13.8 ,46 ,21 ,71 ,63 ,1 ,4.1 , 'A-Che'),
 ('Che-102', 'Blue Silver Mail Armor (Altered)',12.1 ,9 ,12.6 ,11.1 ,10.4 ,9.7 ,7.3 ,7.3 ,21 ,52 ,10 ,10 ,10 ,8.5 , 'A-Che'),
 ('Che-103', 'Braves Battlewear',5.3 ,5.3 ,5.3 ,4.2 ,12.8 ,12.4 ,12.6 ,12.8 ,42 ,23 ,67 ,67 ,2 ,4.1 , 'A-Che'),
 ('Che-104', 'Braves Battlewear (Altered)',4.2 ,4.2 ,4.2 ,2.7 ,12.6 ,11.9 ,12.4 ,12.6 ,34 ,19 ,57 ,57 ,1 ,3.2 , 'A-Che'),
 ('Che-105', 'Briar Armor (Altered)',12.4 ,10.9 ,12.4 ,11.9 ,10.2 ,11.4 ,7.1 ,9.5 ,29 ,61 ,21 ,21 ,12 ,10.7 , 'A-Che'),
 ('Che-106', 'Carian Knight Armor (Altered)',11.7 ,9.8 ,12.2 ,11.7 ,11.7 ,11.7 ,9.1 ,11.7 ,22 ,38 ,16 ,19 ,8 ,9.7 , 'A-Che'),
 ('Che-107', 'Cleanrot Armor (Altered)',13.5 ,12.4 ,14.6 ,16 ,11.9 ,12.4 ,10.2 ,13 ,52 ,54 ,22 ,22 ,17 ,13.7 , 'A-Che'),
 ('Che-108', 'Commoners Garb (Altered)',4.2 ,6.1 ,6.1 ,5.3 ,12.6 ,11.9 ,12.4 ,12.6 ,34 ,21 ,61 ,64 ,0 ,4.1 , 'A-Che'),
 ('Che-109', 'Commoners Simple Garb (Altered)',3.2 ,6.1 ,6.1 ,5.3 ,12.8 ,12.4 ,12.4 ,12.6 ,38 ,21 ,61 ,64 ,0 ,4.1 , 'A-Che'),
 ('Che-110', 'Confessor Armor (Altered)',7.6 ,9.8 ,7.6 ,8.4 ,10.5 ,10.5 ,11.5 ,9.1 ,54 ,42 ,42 ,45 ,4 ,7.3 , 'A-Che'),
 ('Che-111', 'Consorts Robe',5.3 ,4.2 ,4.2 ,5.3 ,13 ,12.4 ,12.4 ,12.8 ,46 ,25 ,67 ,63 ,1 ,4.1 , 'A-Che'),
 ('Che-112', 'Corhyns Robe',6.1 ,6.7 ,6.7 ,6.1 ,13.3 ,12.8 ,12.8 ,13.5 ,46 ,24 ,107 ,76 ,2 ,6.3 , 'A-Che'),
 ('Che-113', 'Crucible Axe Armor (Altered)',16.8 ,13.4 ,16 ,16 ,12.8 ,12.6 ,10.9 ,13.3 ,42 ,61 ,29 ,29 ,23 ,14.9 , 'A-Che'),
 ('Che-114', 'Crucible Tree Armor (Altered)',17 ,13.4 ,16 ,15.6 ,12.8 ,11.4 ,10.9 ,14.1 ,42 ,61 ,29 ,29 ,23 ,14.9 , 'A-Che'),
 ('Che-115', 'Cuckoo Knight Armor',13.5 ,11.4 ,14.6 ,13.5 ,12.4 ,11.9 ,8.8 ,10.2 ,32 ,57 ,24 ,24 ,19 ,11.8 , 'A-Che'),
 ('Che-116', 'Cuckoo Knight Armor (Altered)',13.1 ,11 ,14.2 ,13.1 ,12 ,11.5 ,8.4 ,9.8 ,29 ,52 ,21 ,21 ,17 ,10.8 , 'A-Che'),
 ('Che-117', 'Depraved Perfumer Robe (Altered)',5.3 ,5.2 ,4.1 ,2.6 ,13 ,12.6 ,12.4 ,12.6 ,63 ,18 ,48 ,63 ,1 ,4 , 'A-Che'),
 ('Che-118', 'Dirty Chainmail',11.4 ,8.8 ,11.9 ,11.4 ,8 ,8.8 ,6.1 ,8 ,25 ,50 ,21 ,21 ,14 ,8.8 , 'A-Che'),
 ('Che-119', 'Drake Knight Armor',11.4 ,9.5 ,11.9 ,11.4 ,10.2 ,11.4 ,8.8 ,10.2 ,25 ,46 ,21 ,21 ,14 ,9.2 , 'A-Che'),
 ('Che-120', 'Drake Knight Armor (Altered)',11.2 ,8.6 ,11.2 ,10.7 ,8 ,9.5 ,6.7 ,8 ,21 ,34 ,10 ,10 ,8 ,8.3 , 'A-Che'),
 ('Che-121', 'Elden Lord Armor (Altered)',11.1 ,9.9 ,10.6 ,11.6 ,7.7 ,10.6 ,6.4 ,6.8 ,22 ,45 ,10 ,16 ,10 ,8.4 , 'A-Che'),
 ('Che-122', 'Errant Sorcerer Robe (Altered)',2.7 ,2.7 ,5.3 ,2.7 ,12.8 ,12.4 ,11.9 ,12.8 ,31 ,20 ,62 ,66 ,1 ,3.2 , 'A-Che'),
 ('Che-123', 'Festive Garb',4.2 ,5.3 ,6.1 ,5.3 ,12.6 ,11.9 ,12.4 ,13 ,42 ,21 ,67 ,67 ,1 ,4.1 , 'A-Che'),
 ('Che-124', 'Festive Garb (Altered)',2.7 ,4.2 ,5.3 ,4.2 ,12.4 ,11.4 ,11.9 ,12.8 ,34 ,16 ,57 ,57 ,0 ,3.2 , 'A-Che'),
 ('Che-125', 'Finger Maiden Robe (Altered)',4.2 ,2.7 ,2.7 ,0.6 ,13 ,12.4 ,12.6 ,13.5 ,32 ,16 ,54 ,54 ,1 ,3.7 , 'A-Che'),
 ('Che-126', 'Fingerprint Armor',13.5 ,11.9 ,11.9 ,11.9 ,9.5 ,12.6 ,6.7 ,9.5 ,32 ,60 ,11 ,23 ,19 ,10.6 , 'A-Che'),
 ('Che-127', 'Fingerprint Armor (Altered)',13.1 ,11.5 ,11.5 ,11.5 ,9.1 ,12.2 ,6.3 ,9.1 ,29 ,54 ,10 ,21 ,17 ,10 , 'A-Che'),
 ('Che-128', 'Fire Prelate Armor',19.2 ,17 ,18.3 ,18.3 ,13.5 ,19.8 ,13 ,13.3 ,67 ,63 ,90 ,50 ,40 ,24.7 , 'A-Che'),
 ('Che-129', 'Fire Prelate Armor (Altered)',18.7 ,16.3 ,17.5 ,17.5 ,13.3 ,18.3 ,12.8 ,13 ,57 ,54 ,75 ,42 ,37 ,23.6 , 'A-Che'),
 ('Che-130', 'Foot Soldier Tabard',9.5 ,9.5 ,10.2 ,10.2 ,11.4 ,11.4 ,11.4 ,10.2 ,63 ,42 ,55 ,55 ,8 ,8.3 , 'A-Che'),
 ('Che-131', 'Gelmir Knight Armor (Altered)',13.1 ,11 ,13.6 ,13.1 ,10.5 ,12 ,9.8 ,10.5 ,32 ,50 ,21 ,21 ,17 ,10.8 , 'A-Che'),
 ('Che-132', 'Godrick Knight Armor (Altered)',13.1 ,11.5 ,13.6 ,12.5 ,10.5 ,11.5 ,9.1 ,10.5 ,32 ,52 ,21 ,21 ,17 ,10.8 , 'A-Che'),
 ('Che-133', 'Godskin Noble Robe',6.1 ,9.5 ,6.7 ,6.1 ,13 ,12.4 ,12.6 ,14.1 ,46 ,25 ,76 ,83 ,5 ,6.3 , 'A-Che'),
 ('Che-134', 'Goldmasks Rags',4.2 ,2.7 ,2.7 ,0.6 ,11.9 ,11.4 ,11.9 ,12.8 ,38 ,11 ,60 ,60 ,1 ,2.4 , 'A-Che'),
 ('Che-135', 'Gravekeeper Cloak',7.1 ,8.8 ,7.1 ,7.1 ,8 ,9.5 ,10.2 ,8.8 ,63 ,25 ,34 ,42 ,1 ,6.3 , 'A-Che'),
 ('Che-136', 'Gravekeeper Cloak (Altered)',6.7 ,8 ,6.7 ,6.7 ,7.1 ,8.8 ,9.5 ,8 ,54 ,22 ,34 ,34 ,1 ,5.1 , 'A-Che'),
 ('Che-137', 'Guardian Garb',9.5 ,9.5 ,8.8 ,8 ,10.9 ,10.2 ,10.9 ,10.9 ,61 ,38 ,50 ,42 ,4 ,7.7 , 'A-Che'),
 ('Che-138', 'Guardian Garb (Full Bloom)',10.2 ,10.2 ,9.5 ,9.5 ,11.9 ,-2.3 ,11.9 ,11.4 ,71 ,46 ,57 ,55 ,5 ,8.8 , 'A-Che'),
 ('Che-139', 'Haligtree Knight Armor',13.5 ,12.4 ,13.5 ,13.5 ,10.2 ,11.4 ,9.5 ,11.4 ,35 ,57 ,24 ,25 ,16 ,11.8 , 'A-Che'),
 ('Che-140', 'Haligtree Knight Armor (Altered)',13.1 ,12 ,13.1 ,13.1 ,9.8 ,11 ,9.1 ,11 ,32 ,52 ,21 ,22 ,14 ,10.8 , 'A-Che'),
 ('Che-141', 'High Page Clothes',5.5 ,6.9 ,5.5 ,5.5 ,13.5 ,12.8 ,13 ,13.2 ,42 ,23 ,76 ,76 ,2 ,5.3 , 'A-Che'),
 ('Che-142', 'High Page Clothes (Altered)',4.4 ,6.3 ,4.4 ,4.4 ,13.2 ,12.6 ,12.8 ,13 ,34 ,19 ,61 ,61 ,1 ,4.3 , 'A-Che'),
 ('Che-143', 'Hoslows Armor (Altered)',13.6 ,11.5 ,12.5 ,12 ,10.3 ,11 ,8.9 ,8.9 ,32 ,52 ,21 ,21 ,13 ,10.8 , 'A-Che'),
 ('Che-144', 'Ivory-Draped Tabard',9.5 ,10.9 ,8.8 ,10.2 ,10.2 ,10.9 ,11.9 ,11.4 ,63 ,42 ,55 ,57 ,6 ,8.3 , 'A-Che'),
 ('Che-145', 'Land of Reeds Armor (Altered)',8 ,8.8 ,11.4 ,8.8 ,9.5 ,10.9 ,11.4 ,10.2 ,52 ,42 ,42 ,45 ,4 ,7.8 , 'A-Che'),
 ('Che-146', 'Lazuli Robe',6.1 ,5.3 ,4.2 ,2.7 ,13.8 ,11.9 ,12.4 ,12.8 ,42 ,21 ,67 ,67 ,2 ,4.1 , 'A-Che'),
 ('Che-147', 'Leather Armor',8 ,9.5 ,8 ,8.8 ,9.5 ,9.5 ,10.2 ,10.2 ,60 ,35 ,42 ,50 ,2 ,7.1 , 'A-Che'),
 ('Che-148', 'Leyndell Knight Armor',13.5 ,12.4 ,13.5 ,13.5 ,10.2 ,11.4 ,11.4 ,10.2 ,35 ,55 ,24 ,24 ,19 ,11.8 , 'A-Che'),
 ('Che-149', 'Leyndell Knight Armor (Altered)',13.1 ,12 ,13.1 ,13.1 ,9.8 ,11 ,11 ,9.8 ,32 ,50 ,21 ,21 ,17 ,10.8 , 'A-Che'),
 ('Che-150', 'Lionels Armor (Altered)',17.1 ,15.9 ,18.8 ,19.3 ,13.1 ,14.5 ,12.6 ,13.1 ,57 ,90 ,38 ,45 ,33 ,20.2 , 'A-Che'),
 ('Che-151', 'Lord of Bloods Robe (Altered)',8.9 ,9.6 ,8.1 ,8.1 ,9.6 ,12 ,12 ,13.4 ,57 ,19 ,47 ,47 ,7 ,7.3 , 'A-Che'),
 ('Che-152', 'Lusats Robe',8 ,6.1 ,8 ,6.1 ,15.4 ,12.8 ,13.3 ,13.5 ,50 ,25 ,83 ,99 ,7 ,7.1 , 'A-Che'),
 ('Che-153', 'Malenias Armor',10.9 ,7.1 ,11.4 ,9.5 ,6.1 ,7.1 ,4.2 ,7.1 ,38 ,32 ,7.7 ,11 ,9 ,7.7 , 'A-Che'),
 ('Che-154', 'Malenias Armor (Altered)',10 ,6.5 ,10.7 ,8.6 ,5.1 ,6.5 ,2.5 ,6.5 ,29 ,25 ,0 ,0 ,7 ,6.8 , 'A-Che'),
 ('Che-155', 'Malikeths Armor (Altered)',12.9 ,11.4 ,13.5 ,12.4 ,10.2 ,10.9 ,8.8 ,12.6 ,29 ,50 ,11.8 ,42 ,14 ,11.8 , 'A-Che'),
 ('Che-156', 'Mausoleum Knight Armor',13.5 ,11.4 ,14.6 ,12.9 ,10.9 ,11.4 ,10.2 ,11.4 ,35 ,55 ,24 ,23 ,21 ,11.8 , 'A-Che'),
 ('Che-157', 'Mausoleum Knight Armor (Altered)',13.1 ,11 ,14.2 ,12.5 ,10.5 ,11 ,9.8 ,11 ,32 ,50 ,21 ,21 ,18 ,10.8 , 'A-Che'),
 ('Che-158', 'Mausoleum Surcoat',12.9 ,10.9 ,13.5 ,12.4 ,10.2 ,10.2 ,8.8 ,10.2 ,32 ,50 ,23 ,21 ,19 ,10.6 , 'A-Che'),
 ('Che-159', 'Night Maiden Armor',8 ,9.5 ,8 ,10.2 ,12.4 ,11.4 ,11.9 ,12.4 ,63 ,38 ,55 ,55 ,6 ,8.3 , 'A-Che'),
 ('Che-160', 'Nights Cavalry Armor',14 ,12.9 ,14 ,13.5 ,10.9 ,12.6 ,10.9 ,12.6 ,38 ,57 ,24 ,24 ,21 ,12.8 , 'A-Che'),
 ('Che-161', 'Nights Cavalry Armor (Altered)',13.5 ,12.4 ,13.5 ,12.4 ,10.2 ,12.4 ,10.2 ,12.4 ,32 ,50 ,21 ,21 ,17 ,11.8 , 'A-Che'),
 ('Che-162', 'Nomadic Merchants Finery',8 ,8.8 ,7.1 ,6.7 ,9.5 ,9.5 ,9.5 ,8.8 ,57 ,32 ,71 ,46 ,3 ,7.2 , 'A-Che'),
 ('Che-163', 'Nomadic Merchants Finery (Altered)',7 ,7.9 ,6.6 ,6 ,8.7 ,8.7 ,8.7 ,7.9 ,50 ,25 ,61 ,38 ,1 ,6.1 , 'A-Che'),
 ('Che-164', 'Nox Monk Armor',9.3 ,10 ,9.3 ,8.6 ,12.2 ,11.7 ,11.7 ,10 ,63 ,42 ,50 ,50 ,6 ,8.1 , 'A-Che'),
 ('Che-165', 'Nox Monk Armor (Altered)',8.6 ,9.3 ,8.6 ,7.8 ,11.7 ,11.2 ,11.2 ,9.3 ,54 ,34 ,42 ,42 ,4 ,7.4 , 'A-Che'),
 ('Che-166', 'Nox Swordstress Armor',8.8 ,10.2 ,8.8 ,9.5 ,12.6 ,10.9 ,12.4 ,11.4 ,60 ,38 ,55 ,55 ,8 ,8.3 , 'A-Che'),
 ('Che-167', 'Nox Swordstress Armor (Altered)',8 ,9.5 ,8 ,8.8 ,12.4 ,10.2 ,11.9 ,10.9 ,56 ,34 ,49 ,49 ,5 ,7.5 , 'A-Che'),
 ('Che-168', 'Officials Attire',4.2 ,4.2 ,4.2 ,5.3 ,12.8 ,11.9 ,12.4 ,12.8 ,38 ,22 ,61 ,64 ,1 ,4.1 , 'A-Che'),
 ('Che-169', 'Omen Armor',18.3 ,15 ,18.7 ,18.7 ,13 ,14.5 ,14.9 ,13.8 ,67 ,63 ,57 ,76 ,40 ,23.1 , 'A-Che'),
 ('Che-170', 'Page Garb',6.7 ,6.1 ,5.3 ,5.3 ,12.8 ,12.6 ,13 ,13 ,42 ,23 ,83 ,83 ,2 ,5.1 , 'A-Che'),
 ('Che-171', 'Page Garb (Altered)',6.3 ,5.5 ,4.4 ,4.4 ,12.8 ,12.6 ,13 ,13 ,34 ,19 ,64 ,64 ,1 ,4.5 , 'A-Che'),
 ('Che-172', 'Perfumer Robe',5.3 ,6.7 ,6.1 ,5.3 ,13 ,12.4 ,12.6 ,13 ,63 ,21 ,71 ,76 ,2 ,5.1 , 'A-Che'),
 ('Che-173', 'Perfumer Robe (Altered)',4.2 ,6.1 ,5.3 ,4.2 ,12.8 ,11.9 ,12.4 ,12.8 ,54 ,18 ,57 ,67 ,2 ,4.1 , 'A-Che'),
 ('Che-174', 'Perfumers Traveling Garb (Altered)',5.3 ,5.3 ,4.2 ,2.7 ,12.8 ,12.8 ,12.4 ,12.8 ,55 ,21 ,67 ,63 ,2 ,4.1 , 'A-Che'),
 ('Che-175', 'Preceptors Long Gown (Altered)',4.2 ,4.2 ,2.7 ,4.2 ,12.8 ,12.4 ,11.9 ,12.4 ,38 ,16 ,57 ,57 ,0 ,3.2 , 'A-Che'),
 ('Che-176', 'Prophet Robe (Altered)',6.1 ,6.1 ,5.3 ,6.1 ,13.3 ,12.4 ,12.8 ,12.8 ,38 ,22 ,76 ,75 ,2 ,5.1 , 'A-Che'),
 ('Che-177', 'Radahns Lion Armor (Altered)',18.5 ,14.6 ,17.7 ,17 ,13.3 ,14 ,12.4 ,13.3 ,52 ,82 ,34 ,32 ,24 ,16.4 , 'A-Che'),
 ('Che-178', 'Ragged Armor',9.5 ,10.2 ,9.5 ,9.5 ,10.9 ,11.4 ,11.9 ,10.9 ,63 ,42 ,55 ,55 ,8 ,9.2 , 'A-Che'),
 ('Che-179', 'Ragged Armor (Altered)',9.1 ,9.8 ,9.1 ,9.1 ,10.5 ,11.2 ,11.7 ,10.5 ,60 ,38 ,50 ,50 ,7 ,8.5 , 'A-Che'),
 ('Che-180', 'Raging Wolf Armor (Altered)',12.8 ,10.8 ,12.8 ,12.3 ,8.7 ,10.8 ,6.6 ,8.7 ,25 ,50 ,18 ,10 ,15 ,9 , 'A-Che'),
 ('Che-181', 'Raptors Black Feathers',8 ,8.8 ,9.5 ,9.5 ,10.2 ,10.2 ,10.9 ,9.5 ,57 ,35 ,60 ,60 ,5 ,7.7 , 'A-Che'),
 ('Che-182', 'Redmane Knight Armor',13.5 ,11.4 ,13.5 ,12.4 ,10.9 ,12.8 ,9.5 ,10.9 ,35 ,55 ,14 ,25 ,19 ,11.8 , 'A-Che'),
 ('Che-183', 'Redmane Knight Armor (Altered)',13.1 ,11 ,13.1 ,12 ,10.5 ,12.4 ,9.1 ,10.5 ,32 ,50 ,24 ,22 ,17 ,10.8 , 'A-Che'),
 ('Che-184', 'Redmane Surcoat',13.5 ,10.9 ,12.4 ,11.9 ,10.2 ,11.4 ,8 ,9.5 ,32 ,50 ,23 ,24 ,16 ,10.6 , 'A-Che'),
 ('Che-185', 'Ronins Armor',10.5 ,10.5 ,11.2 ,10.5 ,11.9 ,12.4 ,13.4 ,11.9 ,66 ,48 ,52 ,57 ,6 ,8.5 , 'A-Che'),
 ('Che-186', 'Ronins Armor (Altered)',8.8 ,8.8 ,9.5 ,8.8 ,10.2 ,10.9 ,11.9 ,10.2 ,54 ,38 ,52 ,45 ,6 ,7.6 , 'A-Che'),
 ('Che-187', 'Rotten Gravekeeper Cloak (Altered)',6.1 ,6.1 ,6.1 ,6.1 ,8 ,8 ,10.2 ,8 ,64 ,25 ,34 ,34 ,1 ,5.1 , 'A-Che'),
 ('Che-188', 'Royal Knight Armor',16 ,14.4 ,17.5 ,16.8 ,14.1 ,13.3 ,12.4 ,13 ,50 ,67 ,35 ,35 ,24 ,15.5 , 'A-Che'),
 ('Che-189', 'Royal Knight Armor (Altered)',15.8 ,14.2 ,17.3 ,16.6 ,13.9 ,13.1 ,12.2 ,12.8 ,45 ,61 ,32 ,32 ,21 ,15 , 'A-Che'),
 ('Che-190', 'Royal Remains Armor',11.9 ,11.4 ,12.9 ,11.9 ,9.5 ,10.2 ,8 ,8.8 ,35 ,57 ,24 ,11 ,15 ,10.6 , 'A-Che'),
 ('Che-191', 'Scaled Armor (Altered)',15.3 ,13.4 ,16 ,15.3 ,12.8 ,13.3 ,12.4 ,12.8 ,45 ,64 ,29 ,29 ,22 ,15 , 'A-Che'),
 ('Che-192', 'Scarlet Tabard',10.2 ,9.5 ,8.8 ,8.8 ,10.9 ,11.9 ,11.9 ,10.9 ,63 ,42 ,55 ,55 ,8 ,8.3 , 'A-Che'),
 ('Che-193', 'Shaman Furs',5.3 ,6.1 ,5.3 ,8 ,8 ,7.1 ,8 ,6.7 ,63 ,42 ,55 ,35 ,2 ,5.1 , 'A-Che'),
 ('Che-194', 'Snow Witch Robe (Altered)',4.6 ,5.7 ,5.7 ,3.1 ,13.2 ,13.2 ,13 ,13.2 ,32 ,25 ,57 ,57 ,0 ,4.6 , 'A-Che'),
 ('Che-195', 'Spellblades Traveling Attire',4.1 ,2.6 ,4.1 ,4.1 ,12.7 ,11.3 ,11.8 ,12.7 ,35 ,17 ,59 ,63 ,1 ,3.3 , 'A-Che'),
 ('Che-196', 'Spellblades Traveling Attire (Altered)',2.6 ,0.5 ,2.6 ,2.6 ,12.6 ,10.9 ,11.4 ,12.6 ,32 ,10 ,54 ,57 ,0 ,2.5 , 'A-Che'),
 ('Che-197', 'Travelers Clothes',6.1 ,5.3 ,4.2 ,2.7 ,13.3 ,12.6 ,12.8 ,12.4 ,35 ,24 ,67 ,67 ,2 ,4.1 , 'A-Che'),
 ('Che-198', 'Traveling Maiden Robe (Altered)',4.3 ,5.4 ,5.4 ,2.8 ,13.1 ,12.7 ,12.9 ,13.1 ,38 ,21 ,61 ,64 ,1 ,4.3 , 'A-Che'),
 ('Che-199', 'Tree Sentinel Armor',18.7 ,15 ,18.7 ,17.5 ,13 ,17.1 ,12.6 ,14.1 ,67 ,90 ,42 ,46 ,28 ,18.9 , 'A-Che'),
 ('Che-200', 'Tree Sentinel Armor (Altered)',18.5 ,14.8 ,18.5 ,17.3 ,12.6 ,16.4 ,12.4 ,14 ,57 ,75 ,34 ,38 ,25 ,18.1 , 'A-Che'),
 ('Che-201', 'Tree Surcoat',12.9 ,8.8 ,12.9 ,11.9 ,8.8 ,10.9 ,7.1 ,8.8 ,25 ,55 ,21 ,18 ,15 ,9.2 , 'A-Che'),
 ('Che-202', 'Twinned Armor (Altered)',14 ,12.9 ,15.3 ,12.9 ,11.9 ,11.9 ,9.5 ,10.9 ,32 ,52 ,21 ,52 ,17 ,12.8 , 'A-Che'),
 ('Che-203', 'Vagabond Knight Armor (Altered)',13.2 ,10.5 ,12.2 ,11.7 ,9.1 ,10.5 ,8.3 ,8.3 ,29 ,50 ,19 ,19 ,12 ,9.6 , 'A-Che'),
 ('Che-204', 'Veterans Armor (Altered)',18.1 ,16.8 ,18.5 ,17.3 ,13.1 ,13.6 ,12.4 ,12.8 ,54 ,75 ,38 ,38 ,29 ,17.2 , 'A-Che'),
 ('Che-205', 'Vulgar Militia Armor',8.8 ,10.2 ,9.5 ,8 ,10.2 ,10.2 ,10.9 ,10.2 ,67 ,35 ,50 ,50 ,6 ,7.7 , 'A-Che'),
 ('Che-206', 'War Surgeon Gown',7 ,7.9 ,8.7 ,7 ,9.4 ,10.1 ,10.8 ,10.1 ,53 ,37 ,44 ,48 ,5 ,6.9 , 'A-Che'),
 ('Che-207', 'War Surgeon Gown (Altered)',6.6 ,7 ,7.9 ,6.6 ,8.7 ,9.4 ,10.1 ,9.4 ,45 ,32 ,38 ,42 ,2 ,6.1 , 'A-Che')
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
