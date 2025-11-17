#### 1
require(tidyverse)
require(dplyr)
require(tidytuesdayR)
require(lubridate)
require(data.table)

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


inicio <- filter(dados2, Name %like% "Kong Hans" & Location %like% "Copenhagen")
glimpse(inicio)
head(inicio)
View(inicio)

lat0 <- inicio$Latitude
long0 <- inicio$Longitude

dados <- dados %>%
  mutate(dist_inicio = d(
    lat1 = lat0, 
    lat2 = Latitude, 
    long1 = long0, 
    long2 = Longitude)) # Coluna com a distância até o restaurante incial

dados <- dados %>%
  mutate(estrelas = case_when(
    Award %like% "1 Star" ~ 1,
    Award %like% "2 Stars" ~ 2,
    Award %like% "3 Stars" ~ 3,
    TRUE ~ 0
  )) # Coluna contendo apenas o número estrelas vermelhas

dados %>%
  filter(estrelas == 2) %>%
  filter(dist_inicio != 0) %>%
  summarise(minimo = min(dist_inicio)) # 2 estrelas mais proximo


dados %>%
  filter(estrelas == 1 | estrelas == 2 | estrelas == 3) %>%
  filter(dist_inicio <= 500) %>%
  summarise(contagem = n()) # 1,2,3 estrelas raio de 500km


dados %>%
  filter(Cuisine == "Contemporary") %>%
  summarise(dist_min = min(dist_inicio)) # dist minima para Contemporary

dados %>%
  filter(nchar(Price) <= 2) %>%
  filter (estrelas >= 1) %>%
  filter(dist_inicio <= 2000) %>%
  summarise(contagem = n()) # ate 2 reais, 1 estrelas min, ate 2000km



#### 2

tuesdata <- tidytuesdayR::tt_load(2021, week = 48)


db <- bind_rows(tuesdata[["writers"]], tuesdata[["directors"]], tuesdata[["episodes"]], tuesdata[["imdb"]])


escritor <- tuesdata[["writers"]]

diretor <- tuesdata[["directors"]]

eps <- tuesdata[["episodes"]]

imdb <- tuesdata[["imdb"]]


db_join <- full_join(escritor, diretor, by = c("story_number"))

db_join2 <- full_join(db_join, eps, by = c("story_number"))

base <- full_join(db_join2, imdb, by = c("season_number" = "season","episode_number" = "ep_num"))
View(base)


base %>%
  filter(writer == "Steven Moffat" & director == "Rachel Talalay") %>%
  filter(type == "episode") %>%
  summarise(contagem = n())

base <- base %>%
  mutate(data = ymd(first_aired))

base %>%
  filter(year(data) == 2015) %>%
  filter(writer == "Steven Moffat") %>%
  filter(type == "episode") %>%
  summarise(contagem = n())


base %>%
  filter(writer == "Stephen Thompson") %>%
  summarise(tempo =  (difftime(max(data), min(data)))/365)

base %>%
  filter(writer ==  "Stephen Thompson") %>%
  summarise(contagem = n())


base %>%
  filter(director == "Nick Hurran") %>%
  filter(type == "episode") %>%
  summarise(media_duracao = mean(duration))

      


