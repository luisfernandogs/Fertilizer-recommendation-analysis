-- Analisis de fertilizantes
/* Fertilizante más recomendado */
SELECT
    Fertilizer_Name,
    COUNT(*) AS Recommendations
FROM Fertilizer_Clean
GROUP BY Fertilizer_Name
ORDER BY Recommendations DESC;

/* "Recommendations" funciona 
como un contador de las recomendaciones o 
observaciones dentro de Fertilizer_Name */

/* Promedio NPK por fertilizante */
SELECT
    Fertilizer_Name,
    AVG(Nitrogen) AS Avg_N,
    AVG(Phosphorous) AS Avg_P,
    AVG(Potassium) AS Avg_K
FROM Fertilizer_Clean
GROUP BY Fertilizer_Name;

/* Fertilizante por tipo de suelo */
SELECT
    Soil_Type,
    Fertilizer_Name,
    COUNT(*) AS Total
FROM Fertilizer_Clean
GROUP BY
    Soil_Type,
    Fertilizer_Name;

/* Fertilizante por cultivo */
SELECT
    Crop_Type,
    Fertilizer_Name,
    COUNT(*) AS Total
FROM Fertilizer_Clean
GROUP BY
    Crop_Type,
    Fertilizer_Name;

SELECT
    MIN(Temperature) AS MinTemperature,
    MIN(Humidity) AS MinHumidity,
    MIN(Moisture) AS MinMoisture
FROM FactRecommendation;

SELECT
    Max(Temperature) AS MinTemperature,
    Max(Humidity) AS MinHumidity,
    Max(Moisture) AS MinMoisture
FROM FactRecommendation;