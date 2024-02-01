DROP DATABASE IF EXISTS taxi_co2;
CREATE DATABASE IF NOT EXISTS taxi_co2;
USE taxi_co2;

-- Tabla Vehiculo
DROP TABLE IF EXISTS `Vehiculo`;
CREATE TABLE IF NOT EXISTS `Vehiculo` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    YEAR_ INT,
    Manufacturer VARCHAR(255),
    Model VARCHAR(255),
    CO2(p/milla) FLOAT,
    MilesPerGallon(mpg) FLOAT,
    Ef_X_Comb FLOAT,
    Comb_X_Year FLOAT,
    Score_Ghg FLOAT,
    Ef_X_Comb_City FLOAT,
    YouSaveSpend FLOAT,
    Fuel VARCHAR(255),
    AlternativeFuel VARCHAR(255),
    createdOn DATE,
    modifiedOn DATE,
);

-- Tabla Consumo de Combustible
DROP TABLE IF EXISTS `ConsumoCombustible`;
CREATE TABLE IF NOT EXISTS ConsumoCombustible (
    id INT PRIMARY KEY AUTO_INCREMENT,
    vehiculo_id INT,
    barrels08 FLOAT,
    barrelsA08 FLOAT,
    city08 FLOAT,
    city08U FLOAT,
    cityA08 FLOAT,
    cityA08U FLOAT,
    cityCD FLOAT,
    cityE FLOAT,
    cityUF FLOAT,
    comb08 FLOAT,
    comb08U FLOAT,
    combA08 FLOAT,
    combA08U FLOAT,
    combE FLOAT,
    combinedCD FLOAT,
    combinedUF FLOAT,
    highway08 FLOAT,
    highway08U FLOAT,
    highwayA08 FLOAT,
    highwayA08U FLOAT,
    highwayCD FLOAT,
    highwayE FLOAT,
    highwayUF FLOAT,
    UCity FLOAT,
    UCityA FLOAT,
    UHighway FLOAT,
    UHighwayA FLOAT,
    youSaveSpend FLOAT,
    FOREIGN KEY (vehiculo_id) REFERENCES Vehiculo(id)
);

-- Tabla Emisiones

DROP TABLE IF EXISTS `Emisiones`;
CREATE TABLE IF NOT EXISTS Emisiones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    vehiculo_id INT,
    co2 FLOAT,
    co2A FLOAT,
    co2TailpipeAGpm FLOAT,
    co2TailpipeGpm FLOAT,
    ghgScore FLOAT,
    ghgScoreA FLOAT,
    phevCity FLOAT,
    FOREIGN KEY (vehiculo_id) REFERENCES Vehiculo(id)
);

-- Tabla Rango de Conducción
DROP TABLE IF EXISTS `RangoConduccion`;
CREATE TABLE IF NOT EXISTS RangoConduccion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    vehiculo_id INT,
    RANGE_ FLOAT,
    rangeCity FLOAT,
    rangeCityA FLOAT,
    rangeHwy FLOAT,
    rangeHwyA FLOAT,
    rangeA FLOAT,
    FOREIGN KEY (vehiculo_id) REFERENCES Vehiculo(id)
);

-- Tabla Costos y Capacidad
DROP TABLE IF EXISTS `CostosCapacidad`;
CREATE TABLE IF NOT EXISTS CostosCapacidad (
    id INT PRIMARY KEY AUTO_INCREMENT,
    vehiculo_id INT,
    fuelCost08 FLOAT,
    fuelCostA08 FLOAT,
    hlv FLOAT,
    hpv FLOAT,
    lv2 FLOAT,
    lv4 FLOAT,
    mpgData VARCHAR(255),
    guzzler VARCHAR(255),
    FOREIGN KEY (vehiculo_id) REFERENCES Vehiculo(id)
);

-- Tabla TaxiZone (Zona de Taxi)
DROP TABLE IF EXISTS `TaxiZone`;
CREATE TABLE IF NOT EXISTS TaxiZone (
    PULocationID INT PRIMARY KEY,
    Borough VARCHAR(255),
    Zone VARCHAR(255),
    Service_Zone VARCHAR(255)
);

-- Tabla TaxiTrip (Viaje de Taxi)
DROP TABLE IF EXISTS `TaxiTrip`;
CREATE TABLE IF NOT EXISTS TaxiTrip (
    trip_id INT PRIMARY KEY AUTO_INCREMENT,
    PULocationID INT,
    DOLocationID INT,
    Passenger_Count INT,
    Trip_Distance FLOAT,
    RatecodeID INT,
    Store_and_fwd_flag VARCHAR(255),
    Total_Amount FLOAT,
    Date_pickup DATE,
    Time_pickup TIME,
    Date_dropoff DATE,
    Time_dropoff TIME,
    FOREIGN KEY (PULocationID) REFERENCES TaxiZone(PULocationID),
    FOREIGN KEY (DOLocationID) REFERENCES TaxiZone(PULocationID)
);

DROP TABLE IF EXISTS `EV_Pricing_Detail`;
CREATE TABLE IF NOT EXISTS EV_Pricing_Detail (
    EV_Price VARCHAR(50) PRIMARY KEY
);

DROP TABLE IF EXISTS `Station`;
CREATE TABLE IF NOT EXISTS Station (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Station_Name VARCHAR(255),
    Street_Address VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    ZIP VARCHAR(10),
    Station_Phone VARCHAR(20),
    Latitude DECIMAL(10, 8),
    Longitude DECIMAL(11, 8),
    EV_Price VARCHAR(50),
    FOREIGN KEY (EV_Price) REFERENCES EV_Pricing_Detail(EV_Price)
);

-- Tabla para Contaminantes
DROP TABLE IF EXISTS `Contaminantes`;
CREATE TABLE IF NOT EXISTS Contaminantes (
    PollutantID INT PRIMARY KEY,
    Name VARCHAR(255),
    Description VARCHAR(255)
);

-- Tabla para Unidad de Medida
DROP TABLE IF EXISTS `UnidadMedida`;
CREATE TABLE IF NOT EXISTS UnidadMedida (
    MeasureInfoID INT PRIMARY KEY,
    Unit VARCHAR(50)
);

-- Tabla para Lugares Geográficos
DROP TABLE IF EXISTS `LugaresGeograficos`;
CREATE TABLE IF NOT EXISTS LugaresGeograficos (
    GeoPlaceID INT PRIMARY KEY,
    Name VARCHAR(255)
);

-- Tabla para Años
DROP TABLE IF EXISTS `Anios`;
CREATE TABLE IF NOT EXISTS Anios (
    YearID INT PRIMARY KEY,
    Year INT
);

-- Tabla para Mediciones
DROP TABLE IF EXISTS `Mediciones`;
CREATE TABLE IF NOT EXISTS Mediciones (
    MeasurementID INT PRIMARY KEY,
    ContaminanteID INT,
    MeasureInfoID INT,
    GeoPlaceID INT,
    YearID INT,
    Value FLOAT,
    FOREIGN KEY (ContaminanteID) REFERENCES Contaminantes(PollutantID),
    FOREIGN KEY (MeasureInfoID) REFERENCES UnidadMedida(MeasureInfoID),
    FOREIGN KEY (GeoPlaceID) REFERENCES LugaresGeograficos(GeoPlaceID),
    FOREIGN KEY (YearID) REFERENCES Anios(YearID)
);