colnames(mtcars)

mtcars[, grep("mpg|hp", names(mtcars))]

df <- data.frame(a = 1:3, b = c("x","y","z"))
df[,1]



m <- matrix(1:9, 3, 3)
all(m > 0)



seq(0,1,length.out=11)
rep(7, times=10)

v <- c("a","b","c")
factor(v, levels = c("c","b","a"), ordered = TRUE)


class(m)
typeof(m)


f <- c("alta","media","baixa")
factor(f, levels =  c("baixa","media","alta"), ordered = TRUE)          
is.factor(f)            
is.ordered(f)
f[1] > f[3]


a <- 10
b <- 3
a %% b * 2 + a %/% b


seq(100, 10, by=-10)

lst <- list(a = 1:3, b = list(c = 10, d = 20:21))
lst[[2]][[2]]
lst[["b"]][["d"]]
lst$b


df <- data.frame(a = 1:3, b = letters[1:3])
is.vector(df)
is.matrix(df)
is.list(df)
is.factor(df$a)
is.table(df)


matrix(1:6, nrow = 3, ncol = 2)



airquality[1:10, seq(1, ncol(airquality), 2)]
head(airquality)



seq(1,9,by=2)


iris[iris$Species %in% c("versicolor", "virginica"), ]

x <- c(2, 5, 0, -3)
x^2 - 2*x + 1

iris[which(iris$Sepal.Length > mean(iris$Sepal.Length)), ]
iris[iris$Sepal.Length>mean(iris$Sepal.Length), ]
iris[Sepal.Length > mean(iris$Sepal.Length), ]


TRUE + FALSE * 5


v <- 1:10
v > 5
v[v>=5]
subset(v, v>5)



mtcars[mtcars$mpg >= 20 & mtcars$mpg <= 25, ]

rep(1:4, times=5)

arr <- array(1:12, dim = c(2,3,2))
arr[1,1,2]



x <- seq(2,20,by=2)
x[seq(1,length(x),by=2)]


df <- data.frame(a = 1:4, b = c("x","y","z","w"))
df[df$a > 2, ]



head(mtcars, n = 10)
mtcars[seq(5, nrow(mtcars), 5), ]



x <- c(3, 6, 7, 12)

sum(x[which(x > 5 & x%%3 == 0)])

