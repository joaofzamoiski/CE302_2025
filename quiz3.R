x <- 0 
repeat { x <- x + 1 
if (x == 5) break 
}

x
################
soma <- 0 
for (i in 1:5) { 
  if (i %% 2 == 0) next 
  soma <- soma + i 
} 
soma
###############
x <- 1 
while (x < 3) { 
  x <- x + 0.5 
} 
x
##############
total <- 1 
for (i in 1:4) { 
  total <- total * i 
} 
total
##############
vec <- numeric(0) 
for (i in 1:3) { 
  vec <- c(vec, i) 
} 
vec
#############
x <- 1 
repeat { 
  x <- x * 2 
  if (x > 10) break 
} 
x
############
x <- 0 
while (x < 5) {
  x <- x + 2 
} 
x
############
s <- 0 
for (i in seq(2, 10, 2)) {
  s <- s + i 
} 
s
###########
vec <- c() 
for (i in 1:3) {
  vec[i] <- i^2 
} 
vec
###########
for (i in 1:5) {
  if (i == 3) break 
}
i
###########
x <- 1 
while (TRUE) {
  if (x > 3) break 
  x <- x + 1 
} 
x
###########
count <- 0 
for (i in 1:3) {
  for (j in 1:2) {
    count <- count + 1 
  } 
} 
count