CREATE DATABASE FertilizerAnalytics;

USE FertilizerAnalytics;
GO

/* Validación de carga de CSV */
SELECT TOP 10 *
FROM Fertilizer_Raw;


-- Limpieza SQL
SELECT
    Temparature AS Temperature,
    Humidity,
    Moisture,
    Soil_Type,
    Crop_Type,
    Nitrogen,
    Potassium,
    Phosphorous,
    Fertilizer_Name
INTO Fertilizer_Clean
FROM Fertilizer_Raw;

-- Validación de duplicados
SELECT *,
COUNT(*) AS Repetitions
FROM Fertilizer_Clean
GROUP BY
Temperature,
Humidity,
Moisture,
Soil_Type,
Crop_Type,
Nitrogen,
Potassium,
Phosphorous,
Fertilizer_Name
HAVING COUNT(*) > 1;

-- Validar existencia de valores negativos
SELECT *
FROM Fertilizer_Clean
WHERE Temperature < 0
OR Humidity < 0;

SELECT
    Fertilizer_Name
	FROM Fertilizer_Clean
