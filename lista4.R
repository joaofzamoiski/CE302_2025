#### 1

dados <- read.csv("C:/Users/JFZ/Desktop/bases/michelin.csv")
View(dados)

d <- function(r = 6371, lat1, lat2, long1, long2){
  graus <- c(lat1, lat2, long1, long2)
  rad <- graus*(pi/180) # conversão de graus para radianos
  delta_lat <- rad[2] - rad[1]
  delta_long <- rad[4] - rad[3]
  distancia <- 2*r*asin(sqrt(sin((delta_lat/2)^2 + 
                               cos(rad[1])*cos(rad[2]) *
                               sin((delta_long)/2)^2)))
  return(distancia)
}

d(lat1 = -23.55, lat2 = -22.90, long1 = -46.63, long2 = -43.17)
