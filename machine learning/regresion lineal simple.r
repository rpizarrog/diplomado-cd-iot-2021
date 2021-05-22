# Cargar librerías
library(ggplot2)

# Cargar datos
restaurantes <- c(1:10)
estudiantes <- c(2,6,8,8,12,16,20,20,22,26)
ventas <- c(58,105,88,118,117,137,157,169,149,202)

datos <- data.frame(restaurantes,estudiantes,ventas)
datos
# Describir los datos

summary(datos)
str(datos)

# Construir un modelo MODELO DE REGRESION LINEAL SIMPLE
# ventas es la variable dependiente
# estudiantes es la variable independiente
# ~ tilde o virulilla significa }
# que variable dependiente ventas depende de independiente estudiantes
modelo <- lm(data = datos, formula = ventas ~ estudiantes)
modelo

summary(modelo)
anova(modelo)

paste("La variable independiente representa aproximadamanete un:",
      round(cor(datos$estudiantes, datos$ventas)^2 * 100 ,2), 
    "el valor de la variable dependiente")
      

# Generar gráfica de dispersión y tendencia
plot(datos$estudiantes, datos$ventas,
     xlab = "Estudiantes",
     ylab = "Ventas $",
     main = "Diagrama de dispersión")

ggplot(data = datos, aes(x = estudiantes, y = ventas))   +   geom_point()

# Evaluar el modelo

  # Coeficiente de determinación
  # Los coefiecientes: 
  # Pruebas de significacia * ** ***
  # Error Estándar Estimación con relación a la varianza y la raiz es onforme a la desviación



# Interpretar el modelo

paste ("El valor de la variable dependiente e igual a: ",
       modelo$coefficients[1] , " + ", modelo$coefficients[2], " * "," el valor de x")

# Se observa una relación lineal importante en un "90.27%"

# Predecir

# y = (a + bx)
predict(object = modelo, newdata = data.frame(estudiantes = c(15,20,25,35,45)))

