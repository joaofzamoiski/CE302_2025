x <- 1:4 
ifelse(x > 2, x^2, 0)
#####################

if (NA) 1 
  else 0 # ERRO
######################

for(i in c()) {
  print(i^2)
} # Não executa nenhuma iteração
##################################

s <- 0 
for(i in 1:5) { 
  if(i %% 2 == 0) next 
  s <- s + i 
  } 
s # O "next" pula para o próximo indexador do for
##################################################

tipo <- "aritmetica"
tipo <- "harmonica"
tipo <- "geometrica"
tipo <- "ajhfaksfhdkashd"

x <- 1:10

switch(tipo,
       "aritmetica" = {
         mean(x)
       },
       "harmonica" = {
         length(x)/sum(1/x)
       },
       "geometrica" = {
         prod(x)^(1/length(x))
       }
       ) # Retorna nada
############################################

notas <- c("João" = 70, 
           "Ana" = 89,
           "Márcia" = 81, 
           "Tiago" = 65,
           "Rodrigo" = 35)
if (notas > 70) {
  print("aprovado")
} # Erro: if não é vetorizado!

############################################

x <- 1 
while(x < 3) {
  x <- x + 1 
  } 
print(x)
#######################################
x <- 0 
while(TRUE) {
  x <- x + 1 
  if(x == 4) break 
  } 
x
#######################################
calcula_imc_numero <- function(peso, altura) {
  imc <- peso/(altura^2)
  return(imc)
}
body(calcula_imc_numero)
#######################################
for(i in 1:3) {
  if(i == 2) break 
  print(i) 
  }
##########
sqrt(-1) # Nan













