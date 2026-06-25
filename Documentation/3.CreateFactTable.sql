-- Creación de Tabla de Hechos
SELECT
    fc.Temperature,
    fc.Humidity,
    fc.Moisture,
    fc.Nitrogen,
    fc.Potassium,
    fc.Phosphorous,

    ds.SoilKey,
    dc.CropKey,
    df.FertilizerKey

INTO FactRecommendation

FROM Fertilizer_Clean fc

INNER JOIN DimSoil ds
    ON fc.Soil_Type = ds.Soil_Type

INNER JOIN DimCrop dc
    ON fc.Crop_Type = dc.Crop_Type

INNER JOIN DimFertilizer df
    ON fc.Fertilizer_Name = df.Fertilizer_Name;


/* Verificar las tablas */

SELECT * FROM FactRecommendation;