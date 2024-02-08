DROP DATABASE IF EXISTS taxi_co2;
CREATE DATABASE IF NOT EXISTS taxi_co2;
USE taxi_co2;

CREATE TABLE IF NOT EXISTS Zona(
PULocationID INT AUTO_INCREMENT PRIMARY KEY ,
Zone VARCHAR(150) NOT NULL
);

DROP TABLE IF EXISTS Taxi_ML;
CREATE TABLE IF NOT EXISTS Taxi_ML (
    Viaje_Id INT AUTO_INCREMENT PRIMARY KEY,
    Hour int not null,
    PULocationID INT NOT null,
    Dayofweek int not null,
    Demanda DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (PULocationID) REFERENCES Zona(PULocationID)
);


DROP TABLE IF EXISTS Autos_electricos;
CREATE TABLE IF NOT EXISTS Autos_electricos (
Car_Id INT AUTO_INCREMENT PRIMARY KEY,
Brand VARCHAR(120) NOT NULL,
Model VARCHAR(180) NOT NULL,
FastCharge_miH DECIMAL(10,2) NOT NULL,
Efficiency_Whmi INT NOT NULL,
RapidCharge INT NOT NULL,
Range_Miles DOUBLE NOT NULL,
PriceDollar DOUBLE NOT NULL
);

CREATE TABLE IF NOT EXISTS Distrito(
BoroughID INT AUTO_INCREMENT PRIMARY KEY ,
Borough VARCHAR(150) NOT NULL
);

DROP TABLE IF EXISTS Sonidos;
CREATE TABLE IF NOT EXISTS Sonidos(
ContaminacionID INT AUTO_INCREMENT PRIMARY KEY,
BoroughID INT NOT NULL,
Latitude DECIMAL(10,6) NOT NULL,
Longitude DECIMAL (10,6) NOT NULL,
Year INT NOT NULL,
Day INT NOT NULL,
Hour INT NOT NULL,
Engine_Sound VARCHAR(20),
FOREIGN KEY (BoroughID) REFERENCES Distrito(BoroughID)  
);


DROP TABLE IF EXISTS Taxis_2023;
CREATE TABLE IF NOT EXISTS Taxis_2023(
TaxiID INT AUTO_INCREMENT PRIMARY KEY,
PULocationID INT NOT NULL, 
BoroughID INT NOT NULL,
Service_Zone VARCHAR(80) NOT NULL,
Passenger_Count INT NOT NULL,
Trip_Distance DECIMAL(10,6) NOT NULL ,
DOLocationID INT NOT NULL,
RatecodeID INT NOT NULL,
Store_and_fwd_flag BOOLEAN NOT NULL,
Total_Amount DECIMAL(10,6) NOT NULL,
Date_pickup DATE NOT NULL,
Time_pickup TIME NOT NULL,
Date_dropoff DATE NOT NULL,
Time_dropoff TIME NOT NULL,
FOREIGN KEY (PULocationID) REFERENCES Zona(PULocationID),
FOREIGN KEY (BoroughID) REFERENCES Distrito(BoroughID)  
);