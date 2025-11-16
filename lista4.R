#### 1
require(tidyverse)
require(dplyr)
require(tidytuesdayR)
require(lubridate)
install.packages("tidytuesdayR")
install.packages("lubridate")

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






#### 2

tuesdata <- tidytuesdayR::tt_load(2021, week = 48)
View(tuesdata)


db <- bind_rows(tuesdata[["writers"]], tuesdata[["directors"]], tuesdata[["episodes"]], tuesdata[["imdb"]])
View(db)
  

escritor <- tuesdata[["writers"]]
View(imdb)

diretor <- tuesdata[["directors"]]

eps <- tuesdata[["episodes"]]

imdb <- tuesdata[["imdb"]]


db_join <- full_join(escritor, diretor, by = c("story_number"))
View(db_join)



db_join2 <- full_join(db_join, eps, by = c("story_number"))
View(db_join2)

base <- full_join(db_join2, imdb, by = c("season_number" = "season","episode_number" = "ep_num"))
View(base)


base %>%
  filter(director == "Euros Lyn" & writer == "Steven Moffat") %>%
  summarise(cont = n())


base <- base %>%
  mutate(data = ymd(first_aired))




base %>%
  filter(year(data) == 2014) %>%
  filter(writer == "Steven Moffat") %>%
  summarise(cont = n())





base %>%
  filter(writer == "Stephen Thompson") %>%
  summarise(minimo = min(data),
            maximo = max(data),
            diferenca_anos = (difftime(max(data), min(data), units = "days"))/365)

base %>%
  filter(writer == "Stephen Thompson") %>%
  filter(data >= min(data) & data <= max(data)) %>%
  summarise(cont = n())



base %>%
  filter(director == "James Strong") %>%
  summarise(media = mean(duration))

            