SET GLOBAL local_infile=1;

CREATE DATABASE IF NOT EXISTS eda_project;
USE eda_project;

DROP TABLE IF EXISTS market_data;

CREATE TABLE market_data (
    Date DATE,
    Coal_RB_4800_FOB_London_Close_USD FLOAT,
    Coal_RB_5500_FOB_London_Close_USD FLOAT,
    Coal_RB_5700_FOB_London_Close_USD FLOAT,
    Coal_RB_6000_FOB_CurrentWeek_Avg_USD FLOAT,
    Coal_India_5500_CFR_London_Close_USD FLOAT,
    Price_WTI FLOAT,
    Price_Brent_Oil FLOAT,
    Price_Dubai_Brent_Oil FLOAT,
    Price_ExxonMobil FLOAT,
    Price_Shenhua FLOAT,
    Price_All_Share FLOAT,
    Price_Mining FLOAT,
    Price_LNG_Japan_Korea_Marker_PLATTS FLOAT,
    Price_ZAR_USD FLOAT,
    Price_Natural_Gas FLOAT,
    Price_ICE FLOAT,
    Price_Dutch_TTF FLOAT,
    Price_Indian_en_exg_rate FLOAT
);

LOAD DATA LOCAL INFILE '/Users/aditi/Documents/Apana Time/Data set Apana time CSV.csv'
INTO TABLE market_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Measures of Central Tendency --

-- 1. Mean

SELECT AVG(Price_WTI) AS Mean_Price_WTI
FROM market_data;

-- 2. Median

SELECT 
AVG(mid_values) AS Median_Price_WTI
FROM (
SELECT t1.Price_WTI AS mid_values
FROM market_data t1
WHERE (
SELECT COUNT(*) 
FROM market_data t2 
WHERE t2.Price_WTI <= t1.Price_WTI
) >= (SELECT COUNT(*) FROM market_data)/2
ORDER BY t1.Price_WTI
LIMIT 2
) AS temp;

-- 3. Mode

SELECT Price_WTI AS Mode_Price_WTI, COUNT(*) AS Frequency
FROM market_data
GROUP BY Price_WTI
ORDER BY Frequency DESC
LIMIT 1;

-- Measures of Dispersion --

-- 4. Variance 

SELECT VAR_POP(Price_WTI) AS Variance_Price_WTI
FROM market_data;

-- 5. Standard Deviation

SELECT STDDEV_POP(Price_WTI) AS StdDev_Price_WTI
FROM market_data;


-- 6. Skewness

SELECT 
(COUNT(*) * SUM(POWER(Price_WTI - avg_price, 3))) / 
((COUNT(*) - 1) * (COUNT(*) - 2) * POWER(stddev_price, 3)) AS Skewness_Price_WTI
FROM (
SELECT 
Price_WTI,
(SELECT AVG(Price_WTI) FROM market_data) AS avg_price,
(SELECT STDDEV_POP(Price_WTI) FROM market_data) AS stddev_price
FROM market_data
) AS derived;

-- 7. Kurtosis

SELECT 
(
(COUNT(*) * (COUNT(*) + 1) * SUM(POWER(Price_WTI - avg_price, 4))) / 
((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3) * POWER(stddev_price, 4))
) - 
(3 * POWER(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS Kurtosis_Price_WTI
FROM (
SELECT 
Price_WTI,
(SELECT AVG(Price_WTI) FROM market_data) AS avg_price,
(SELECT STDDEV_POP(Price_WTI) FROM market_data) AS stddev_price
FROM market_data
) AS derived;






