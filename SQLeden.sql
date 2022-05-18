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
ADD CONSTRAINT Min_check CHECK (Weigth>0);
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
ADD CONSTRAINT Min_check CHECK (Level>0);
GO
CREATE TABLE Classes_build
(
	Build_ID varchar(10) PRIMARY KEY,
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
CREATE TABLE Users
(
	User_ID varchar(50) PRIMARY KEY,
	HoTen nvarchar(50) not null,
	DiaChi nvarchar(50) ,
	DoB date not null,
	Password nvarchar(50) not null,
)
GO
CREATE TABLE Roles
(
	Roles_ID varchar(10) PRIMARY KEY,
	Role_Des nvarchar(100),
	Roles_power smallint,
)
GO
CREATE TABLE User_Role
(
	User_ID varchar(50) FOREIGN KEY REFERENCES Users(User_ID) ,
	Roles_ID varchar(10) FOREIGN KEY REFERENCES Roles(Roles_ID),
)
GO
CREATE TABLE User_Build
(
	User_ID varchar(50) FOREIGN KEY REFERENCES Users(User_ID) ,
	Build_ID varchar(10) NOT NULL FOREIGN KEY REFERENCES Classes_build(Build_ID) ,
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
ALter table Users
ADD Token varchar(20) NULL



