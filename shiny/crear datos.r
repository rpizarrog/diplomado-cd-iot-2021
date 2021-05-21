# Crear conjunto  de datos personas
library(dplyr)
set.seed(2020)

# Función para crear un conjunto d edatos que serán las personas 
fatividad.aletoria <- function(actividad, datos, size) {
  n <- nrow(datos)
  cuales <- sample(1:n, size)
  datos[cuales, actividad] = 'SI'
  datos
}


nombres <- c("JUAN", "JOSÉ LUIS", "JOSÉ", "MARÍA GUADALUPE", "FRANCISCO",
             "GUADALUPE", "MARÍA", "JUANA", "ANTONIO", "JESÚS", 
             "MIGUEL ÁNGEL", "PEDRO", "ALEJANDRO", "MANUEL", "MARGARITA", 
             "MARÍA DEL CARMEN", "JUAN CARLOS", "ROBERTO", "FERNANDO", "DANIEL",
             "CARLOS","JORGE", "RICARDO", "MIGUEL", "EDUARDO", 
             "JAVIER","RAFAEL", "MARTÍN", "RAÚL", "DAVID", 
             "JOSEFINA","JOSÉ ANTONIO", "ARTURO","MARCO ANTONIO", "JOSÉ MANUEL", 
             "FRANCISCO JAVIER","ENRIQUE", "VERÓNICA", "GERARDO","MARÍA ELENA",
             "LETICIA","ROSA", "MARIO", "FRANCISCA", "ALFREDO", 
             "TERESA", "ALICIA", "MARÍA FERNANDA","SERGIO", "ALBERTO", 
             
             "LUIS", "ARMANDO","ALEJANDRA", "MARTHA","SANTIAGO", 
             "YOLANDA", "PATRICIA", "MARÍA DE LOS ÁNGELES", "JUAN MANUEL","ROSA MARÍA", 
             "ELIZABETH", "GLORIA", "ÁNGEL","GABRIELA","SALVADOR",
             "VÍCTOR MANUEL", "SILVIA", "MARÍA DE GUADALUPE", "MARÍA DE JESÚS", "GABRIEL", 
             "ANDRÉS", "ÓSCAR", "GUILLERMO", "ANA MARÍA", "RAMÓN", 
             "MARÍA ISABEL", "PABLO", "RUBEN", "ANTONIA", "MARÍA LUISA",
             "LUIS ÁNGEL", "MARÍA DEL ROSARIO", "FELIPE", "JORGE JESÚS", "JAIME",
             "JOSÉ GUADALUPE", "JULIO CESAR", "JOSÉ DE JESÚS", "DIEGO", "ARACELI",
             "ANDREA", "ISABEL", "MARÍA TERESA", "IRMA", "CARMEN", 
             "LUCÍA", "ADRIANA", "AGUSTÍN", "MARÍA DE LA LUZ", "GUSTAVO")
generos <- c('M', 'M', 'M', 'F', 'M', 
             'F', 'F', 'F', 'M', 'M', 
             'M', 'M', 'M', 'M', 'F',
             'F', 'M', 'M', 'M', 'M',
             'M', 'M', 'M', 'M', 'M', 
             'F', 'M', 'M', 'M', 'M', 
             'M', 'M', 'F', 'M', 'F', 
             'F', 'M', 'M', 'F', 'M', 
             'F', 'F', 'M', 'F', 'M', 
             'F', 'F', 'F', 'M', 'M', 
             
             'M', 'M', 'F', 'F', 'M',
             'F', 'F', 'F', 'M', 'F', 
             'F', 'F', 'M', 'F', 'M',
             'M', 'F', 'F', 'F', 'M',
             'M', 'M', 'M', 'F', 'M',
             'F', 'M', 'M', 'F', 'F',
             'M', 'F', 'M', 'M', 'M',
             'M', 'M', 'M', 'M', 'M',
             'F', 'F', 'F', 'F', 'F',
             'F', 'F', 'M', 'F', 'M'
)
personas <- data.frame(nombres, generos, stringsAsFactors = default.stringsAsFactors())

# Definir actividades deportivas y Culturales
deportivas <- c("Ajedrez", "Béisbol", "Tiro con arco", "Pesas", "Fútbol", "Softbol", "Atletismo")
culturales <- c("Folklórico", "Tahitiano", "Teatro", "Rondalla", "Pantomima")


# Agregar columnas deportivas a personas
personas <- cbind(personas, "ajedrez" = "NO")
personas <- cbind(personas, "beisbol" = "NO")
personas <- cbind(personas, "tiro.arco" = "NO")
personas <- cbind(personas, "pesas" = "NO")
personas <- cbind(personas, "futbol" = "NO")
personas <- cbind(personas, "softbol" = "NO")
personas <- cbind(personas, "atletismo" = "NO")

# Agregar columnas culturles a personas
personas <- cbind(personas, "folklorico" = "NO")
personas <- cbind(personas, "tahitiano" = "NO")
personas <- cbind(personas, "teatro" = "NO")
personas <- cbind(personas, "rondalla" = "NO")
personas <- cbind(personas, "pantomima" = "NO")

# personas


personas <- fatividad.aletoria('ajedrez', personas, sample(10:15,1))
# 
personas <- fatividad.aletoria('beisbol', personas, sample(10:25,1))
personas <- fatividad.aletoria('tiro.arco', personas, sample(10:15,1))
personas <- fatividad.aletoria('pesas', personas, sample(10:15,1))
personas <- fatividad.aletoria('futbol', personas, sample(10:25,1))
personas <- fatividad.aletoria('softbol', personas, sample(10:25,1))
personas <- fatividad.aletoria('atletismo', personas, sample(10:25,1))

personas <- fatividad.aletoria('folklorico', personas, sample(10:25,1))
personas <- fatividad.aletoria('tahitiano', personas, sample(10:15,1))
personas <- fatividad.aletoria('teatro', personas, sample(10:15,1))
personas <- fatividad.aletoria('rondalla', personas, sample(10:25,1))
personas <- fatividad.aletoria('pantomima', personas, sample(10:15,1))



# Crear datos

datos <- data.frame(nombres = "Jorge", edades = 35, estados ="Sinaloa")
datos <- rbind(datos, c(toupper("Luis"), 37, "Coahuila"))
datos <- rbind(datos, c("Carlos", 64, "Sonora"))
datos <- rbind(datos, c("Paty", 43, "Chihuahua"))
datos <- rbind(datos, c("Carmen", 28, "Jalisco"))
datos <- rbind(datos, c("Rubén", 51, "Durango"))
datos <- rbind(datos, c("Lourdes", 47, "Nuevo León"))
datos <- rbind(datos, c("Ernesto", 47, "Baja California"))
datos <- rbind(datos, c("Juliana", 47, "Baja California Sur"))


agregar <- data.frame(nombres = sample(personas$nombres, size = 91, replace = TRUE),
                      edades = round(rnorm(n = 91, mean = 40, 10),0),
                      estados = sample(unique(datos$estado), 91, replace = TRUE))

datos <- rbind(datos, agregar)


               




