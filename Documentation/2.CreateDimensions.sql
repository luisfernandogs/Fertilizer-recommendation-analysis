-- Creación de Dimensión de Suelos
SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY Soil_Type) AS SoilKey,
    Soil_Type
INTO DimSoil
FROM Fertilizer_Clean;

/* Creación de Dimensión de Cultivos */
SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY Crop_Type) AS CropKey,
    Crop_Type
INTO DimCrop
FROM Fertilizer_Clean;

/* Creación de Dimensión de Fertilizantes */
SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY Fertilizer_Name) AS FertilizerKey,
    Fertilizer_Name
INTO DimFertilizer
FROM Fertilizer_Clean;


/* Verificar las tablas */
SELECT * FROM DimSoil;
SELECT * FROM DimCrop;
SELECT * FROM DimFertilizer;
SELECT * FROM FactRecommendation;
