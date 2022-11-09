require(magrittr)
library(readxl)
require(janitor)
require(datetime)
require(tidyverse)

# primer paso, leer BD


acd <- read_excel("C:/Users/jgarcia/Desktop/Tareas por hacer/Recoleccion datos concesiones/La Pintada/Bases a trabajar/Informe_Accidentes_Incidentes_organizado.xlsx")

#Note que la bd que lee, está incorrecta, hay 50 observaciones y leyó 900

# otro intento 

acd <-read_excel("C:/Users/jgarcia/Desktop/Tareas por hacer/Recoleccion datos concesiones/La Pintada/Bases a trabajar/Informe_Accidentes_Incidentes_organizado.xlsx", 
                 skip = 7, n_max = 51) # sigue habiendo un error en el rango de los datos


# otro intento 

prueba2 <- read_excel("C:/Users/jgarcia/Desktop/Tareas por hacer/Recoleccion datos concesiones/La Pintada/Bases a trabajar/Informe_Accidentes_Incidentes_organizado.xlsx", 
                      skip = 7, n_max = 42)
View(prueba2) # le doy el rango de los datos para trabbajar

# la lee correctamente


# segundo paso: mire las dimensiones

acd %>% dim

acd %>% head(3)

acd %>% tail

# hay 922 regstros con 49 vbles

acd %>% names()

# hay variables redundantes

# nombres muy feos

# Corrija estructura de ciertas variables

acd$FECHA <- as.Date(acd$FECHA, format ="%Y-%m-%d" ) # año, mes, dia =%Y-%m-%d

acd$FECHA %>% max # las fechas parecen en orden
acd$FECHA %>% min # ERROR, hay una fecha de 1899, se debe filtrar

acd <- acd %>% filter(FECHA>"2000-01-01")
acd$FECHA %>% min # consistente
acd$FECHA %>% max # consistente 

acd %>% names

# Se unen las variables edad

acd <- gather(data = acd, key = "edad", value = "valor.verdad",26:30)
acd$edad

# Se une la variable genero



