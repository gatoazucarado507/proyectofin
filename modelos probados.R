#Obtener los datos
library(zoo)
library(forecast)
datos<-read.csv("datos2020_2025col.csv")
#limpieza
datos= na.locf(datos, fromLast = TRUE)

#ajustar la serie de tiempo
datos=ts(datos$Ventas,start=2020, frequency = 12)

#HOLT WINTERS

#Crear el modelo
modelo= HoltWinters(datos, seasonal = "additive")
#Graficar el modelo
plot(modelo, main="Caso #1 Holt Winters 2020 a diciembre 2024")
#Mostrar coeficientes
modelo

#Pronostico para el año 2025
Ventas2025<- forecast(modelo, h = 12)
Ventas2025

#Metricas de errores
accuracy(Ventas2025)

#Graficar Ventas proximo 2025
plot(Ventas2025, main="Caso #1 Holt Winters 2020 a diciembre 2024 con pronostico hasta 2025")







