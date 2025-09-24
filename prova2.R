TRUE + FALSE * 5

seq(100, 10, by=-10)

arr <- array(1:12, dim = c(2,3,2))
arr[1,1,2]

mtcars[seq(5, nrow(mtcars), 5), ]

lst <- list(a = 1:3, b = list(c = 10, d = 20:21))
lst[[2]][[2]]
lst[["b"]][["d"]]
lst$b$d


v <- c("a","b","c")
factor(v, levels = c("c","b","a"), ordered = TRUE)

seq(1,9,by=2)
(1:9)[seq(1,9,by=2)]
seq(1,9,length.out=5)
c(1,3,5,7,9)


#########

notas <- c("João" = 59,
          "Maria" = 97,
          "José" = 66,
          "Ana" = 49,
          "Pedro" = 54,
          "Paula" = 100,
          "Carlos" = 76,
          "Mariana" = 93,
          "Fernando" = 64,
          "Luiza" = 95)

trabalhos <- c(
  "João" = FALSE,
  "Maria" = TRUE,
  "José" = FALSE,
  "Ana" = FALSE,
  "Pedro" = FALSE,
  "Paula" = TRUE,
  "Carlos" = TRUE,
  "Mariana" = TRUE,
  "Fernando" = FALSE,
  "Luiza" = TRUE
)

sqrt(mean(notas))
median(notas[trabalhos == TRUE])
max(notas[trabalhos == FALSE])
notas[trabalhos & notas < 70 & notas > 40]
sd(notas[trabalhos])


#########

notas2 <- c("João" = 97,
           "Maria" = 31,
           "José" = 83,
           "Ana" = 62,
           "Pedro" = 85,
           "Paula" = 92,
           "Carlos" = 30,
           "Mariana" = 86,
           "Fernando" = 83,
           "Luiza" = 49)

trabalhos2 <- c(
  "João" = TRUE,
  "Maria" = FALSE,
  "José" = TRUE,
  "Ana" = FALSE,
  "Pedro" = TRUE,
  "Paula" = TRUE,
  "Carlos" = FALSE,
  "Mariana" = TRUE,
  "Fernando" = TRUE,
  "Luiza" = FALSE
)

sqrt(mean(notas2))
median(notas2[trabalhos2 == TRUE])
max(notas2[trabalhos2 == FALSE])
notas2[trabalhos2 & notas2 < 70 & notas2 > 40]
sd(notas2[trabalhos2])

#########

notas3 <- c("João" = 80,
            "Maria" = 85,
            "José" = 70,
            "Ana" = 31,
            "Pedro" = 48,
            "Paula" = 91,
            "Carlos" = 59,
            "Mariana" = 51,
            "Fernando" = 100,
            "Luiza" = 47)

trabalhos3 <- c(
  "João" = TRUE,
  "Maria" = TRUE,
  "José" = TRUE,
  "Ana" = FALSE,
  "Pedro" = FALSE,
  "Paula" = TRUE,
  "Carlos" = FALSE,
  "Mariana" = FALSE,
  "Fernando" = TRUE,
  "Luiza" = FALSE
)

sqrt(mean(notas3))
median(notas3[trabalhos3 == TRUE])
max(notas3[trabalhos3 == FALSE])
notas2[trabalhos3 & notas3 < 70 & notas3 > 40]
sd(notas3[trabalhos3])
  
######

# Criando a matriz A
A <- matrix(
  c(38, 30, 7, 45, 44,
    19, 11, 23, 45, 43,
    17, 39, 4, 10, 18,
    23, 17, 32, 14, 36,
    21, 12, 13, 5, 4),
  nrow = 5,
  ncol = 5,
  byrow = TRUE
)

# Criando a matriz B
B <- matrix(
  c(6, 43, 9, 22, 43,
    16, 41, 31, 17, 22,
    7, 5, 22, 31, 24,
    19, 30, 47, 20, 31,
    12, 10, 50, 48, 45),
  nrow = 5,
  ncol = 5,
  byrow = TRUE
)

C <- B%*%solve(t(B)%*%B)%*%t(B)
log10(abs(det(C)))


log10(abs(det(A%*%B)))

sum(abs(diag(B)))


sum(A[upper.tri(A)])


max(diag(solve(A%*%B)))


######

# Criando a matriz A
A1 <- matrix(
  c(16, 3, 21, 49, 23,
    39, 20, 7, 15, 19,
    13, 46, 18, 33, 23,
    23, 5, 35, 28, 16,
    42, 17, 17, 14, 33),
  nrow = 5,
  ncol = 5,
  byrow = TRUE
)

# Criando a matriz B
B1 <- matrix(
  c(50, 38, 37, 24, 1,
    22, 21, 32, 30, 26,
    33, 40, 50, 2, 45,
    40, 34, 13, 6, 21,
    29, 22, 42, 3, 49),
  nrow = 5,
  ncol = 5,
  byrow = TRUE
)

C1 <- B1%*%solve(t(B1)%*%B1)%*%t(B1)
log10(abs(det(C1)))


log10(abs(det(A1%*%B1)))

sum(abs(diag(B1)))


sum(A1[upper.tri(A1)])


max(diag(solve(A1%*%B1)))

######

# Criando a matriz A
A2  <- matrix(
  c(45, 42, 11, 46, 26,
    18, 20, 6, 44, 39,
    16, 9, 21, 24, 13,
    11, 20, 6, 44, 3,
    49, 29, 45, 2, 4),
  nrow = 5,
  ncol = 5,
  byrow = TRUE
)

# Criando a matriz B
B2 <- matrix(
  c(26, 48, 4, 14, 37,
    47, 19, 42, 33, 9,
    48, 31, 34, 8, 28,
    46, 17, 34, 39, 46,
    35, 18, 40, 32, 44),
  nrow = 5,
  ncol = 5,
  byrow = TRUE
)

C2 <- B2%*%solve(t(B2)%*%B2)%*%t(B2)
log10(abs(det(C1)))


log10(abs(det(A2%*%B2)))

sum(abs(diag(B2)))


sum(A2[upper.tri(A2)])


max(diag(solve(A2%*%B2)))


#######

var(airquality$Temp)
sum((airquality$Temp - mean(airquality$Temp))^2)/(nrow(airquality)-1)


(sum(abs(airquality$Temp - mean(airquality$Temp))))/(nrow(airquality) - 1)

nivel8 <- airquality[airquality$Month == 8,]

3*((mean(nivel8$Wind)-median(nivel8$Wind))/sd(nivel8$Wind))

(sum(abs(nivel8$Wind - mean(nivel8$Wind))))/(nrow(nivel8) - 1)


sum((airquality$Temp - mean(airquality$Temp))^2)



####

var(airquality$Wind)
sum((airquality$Wind - mean(airquality$Wind))^2)/(nrow(airquality)-1)
  
(sum(abs(airquality$Wind - mean(airquality$Wind))))/(nrow(airquality) - 1)


nivel7 <- airquality[airquality$Month == 7 & is.na(airquality$Ozone) == FALSE,]

3*((mean(nivel7$Ozone)-median(nivel7$Ozone))/sd(nivel7$Ozone))

(sum(abs(nivel7$Ozone - mean(nivel7$Ozone))))/(nrow(nivel7) - 1)



####

semna <- airquality[is.na(airquality$Ozone) == FALSE,]

var(airquality$Ozone, na.rm = TRUE)
sum((semna$Ozone - mean(semna$Ozone))^2)/(nrow(semna)-1)

(sum(abs(semna$Ozone - mean(semna$Ozone))))/(nrow(semna) - 1)




