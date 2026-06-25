DROP TABLE IF EXISTS FactRecommendation;

SELECT
    ds.SoilKey,
    dc.CropKey,
    df.FertilizerKey,

    fc.Temperature,
    fc.Humidity,
    fc.Moisture,
    fc.Nitrogen,
    fc.Phosphorous,
    fc.Potassium

INTO FactRecommendation

FROM Fertilizer_Clean fc

JOIN DimSoil ds
    ON fc.Soil_Type = ds.Soil_Type

JOIN DimCrop dc
    ON fc.Crop_Type = dc.Crop_Type

JOIN DimFertilizer df
    ON fc.Fertilizer_Name = df.Fertilizer_Name;


-- Revisión de Tabla de Hechos por multiplicación de valores

SELECT COUNT(*) FROM FactRecommendation;

-- Revisión de Tablas DIM por multiplicación de valores y uso de Distinct para solucionar error
-- Set de datos de 99 registros, anteriormente mostraba 301mil registros, con el uso de Distinct se soluciona

DROP TABLE DimSoil;
DROP TABLE DimCrop;
DROP TABLE DimFertilizer;

SELECT DISTINCT
    Soil_Type
INTO DimSoil_Base
FROM Fertilizer_Clean;

SELECT
    ROW_NUMBER() OVER(ORDER BY Soil_Type) AS SoilKey,
    Soil_Type
INTO DimSoil
FROM DimSoil_Base;

SELECT DISTINCT
    Crop_Type
INTO DimCrop_Base
FROM Fertilizer_Clean;

SELECT
    ROW_NUMBER() OVER(ORDER BY Crop_Type) AS CropKey,
    Crop_Type
INTO DimCrop
FROM DimCrop_Base;

SELECT DISTINCT
    Fertilizer_Name
INTO DimFertilizer_Base
FROM Fertilizer_Clean;

SELECT
    ROW_NUMBER() OVER(ORDER BY Fertilizer_Name) AS FertilizerKey,
    Fertilizer_Name
INTO DimFertilizer
FROM DimFertilizer_Base;

-- Comprobación de registros

SELECT COUNT(*) FROM DimSoil;
SELECT COUNT(*) FROM DimCrop;
SELECT COUNT(*) FROM DimFertilizer;

SELECT COUNT(*) AS FactRows
FROM FactRecommendation;

-- Drop de tabla de hechos ya que no se solucionaba error

DROP TABLE FactRecommendation;

SELECT
    ds.SoilKey,
    dc.CropKey,
    df.FertilizerKey,

    fc.Temperature,
    fc.Humidity,
    fc.Moisture,
    fc.Nitrogen,
    fc.Phosphorous,
    fc.Potassium

INTO FactRecommendation

FROM Fertilizer_Clean fc

JOIN DimSoil ds
    ON fc.Soil_Type = ds.Soil_Type

JOIN DimCrop dc
    ON fc.Crop_Type = dc.Crop_Type

JOIN DimFertilizer df
    ON fc.Fertilizer_Name = df.Fertilizer_Name;

-- Recuento de valores de tabla de hechos verificada con 99 registros

SELECT COUNT(*) AS FactRows
FROM FactRecommendation;