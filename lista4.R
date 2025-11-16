#### 1

dados <- read.csv("C:/Users/JFZ/Desktop/bases/michelin.csv")
View(dados)

d <- function(r = 6371, lat1, lat2, long1, long2){
  
  rlat1 = lat1 * (pi/180)
  rlat2 = lat2 * (pi/180)
  rlong1 = long1 * (pi/180)
  rlong2 = long2 * (pi/180)
  
  
  delta_lat <- rlat2 - rlat1
  delta_long <- rlong2 - rlong1
  
  
  distancia <- 2*r*asin(sqrt(sin(delta_lat/2)^2 + 
                               cos(rlat1) * 
                               cos(rlat2) *
                               sin(delta_long/2)^2))
  return(distancia)
}

d(lat1 = -23.55, lat2 = -22.90, long1 = -46.63, long2 = -43.17)


inicio <- filter(dados2, Name %like% "Kato" & Location %like% "Los Angeles")
glimpse(inicio)
head(inicio)
View(inicio)



dados <- dados %>%
  mutate(dist_inicio = d(
    lat1 = inicio$Latitude, 
    lat2 = Latitude, 
    long1 = inicio$Longitude, 
    long2 = Longitude)) # Coluna com a distância até o restaurante incial


dados <- dados %>%
  mutate(estrelas = case_when(
    Award %like% "1 Star" ~ 1,
    Award %like% "2 Stars" ~ 2,
    Award %like% "3 Stars" ~ 3,
    TRUE ~ 0
  )) # Coluna contendo apenas o número estrelas vermelhas




prox_2estrelas <- dados %>%
  filter(estrelas == 2) %>%
  arrange(dist_inicio) %>%
  slice(1)
View(prox_2estrelas) # Restaurante mais próximo com duas estrelas



resumo_100km <- dados %>%
  filter(estrelas != 0) %>%
  filter(dist_inicio <= 100) %>%
  count()
View(resumo_100km)



aniversario <- dados %>%
  filter(nchar(Price) <= 4) %>%
  filter(dist_inicio <= 3000) %>%
  summarise(contagem = n())



californian <- dados %>%
  filter(Cuisine == "Californian") %>%
  summarise(minimo = min(dist_inicio))
  

