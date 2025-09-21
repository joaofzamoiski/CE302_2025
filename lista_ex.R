2^3*2 ## 16

### IRIS ----

iris
View(iris)
ncol(iris)

iris[, seq(3, ncol(iris), 3)]

iris[seq(7, nrow(iris), 7), ]

### MTCARS ----

mtcars
View(mtcars)
nrow(mtcars)

mtcars[(nrow(mtcars)-5):nrow(mtcars), 1:2]
mtcars[tail(1:nrow(mtcars), 6), 1:2]
tail(mtcars, 6)[, 1:2]


mtcars[seq(2, nrow(mtcars), 2), ]

### 

utils:::format.object_size(sapply(ls(), function(x) object.size(get(x))))

x <- 10
y <- 100

rep(1:3, times=5)




lst <- list(a = 1:5, b = list(c = 10, d = 20))
lst[[2]][[2]]
lst$b[2]


v <- c(3,6,9,12,15)
v[v%%6==0]

arr <- array(1:24, dim = c(2,3,4))

arr[1,,3]


update.packages(ask = TRUE)
packageStatus()$upgrade



x <- c(1, 2, 3, 4)
is.atomic(x)
is.list(x)




df <- data.frame(x = 1:3, y = letters[1:3])
df$z <- c(10,20,30)
df$z2 <- list(10,20,30)
df$z3 <- I(list(10,20,30))
df$z4 <- unlist(list(10,20,30))



x <- c(4, 7, 2, 9)
(x %% 2 == 0) | (x > 8)



v <- c(2,4,6,8,10)
v > 5
v[v > 5]



df <- data.frame(a = 1:5, b = letters[1:5], stringsAsFactors = FALSE)
df[-3,]





ls(envir = environment(Global Environment), all.names = TRUE)
get(globalenv(), show.hidden = TRUE)

objects(globalenv(), hidden = TRUE)


View(airquality)
airquality
airquality[, grep("R$", names(airquality))]

airquality[endsWith(names(airquality), "R"), ]

airquality[, endsWith(names(airquality), "R")]




