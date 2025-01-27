#Itemul1
media <- function(vector) {
  media <- sum(vector) / length(vector)
  media_rot <- round(media, digits = 4)
  return(media_rot)
}
x <- c(1.532312, 4.2131231, 5.2121, 1.212, 3.23131, 2.5432, 6.7453)
media <- media(x)
print(media)


#Itemul2
#Cu for
num <- 6
factorial <- 1
   if (num == 0) {
   factorial <- 1
  } else {
for(i in 1:num) {
factorial <- factorial * i
}}
print(factorial)


#Cu prod
factorial <- function(n) {
  if (n == 0) {
    return(1)
  } else {
    fact <- prod(1:n)
    return(fact)
  }
}

rezultat<- factorial(6)
print(rezultat)

#Itemul3
functie <- function(x, optiune) {
  switch(optiune,
         "media" = {
           rezultat <- mean(x)
           return(rezultat)
         },
         "mediana" = {
           rezultat <- median(x)
           return(rezultat)
         },
         "SD" = {
           rezultat <- sd(x)
           return(rezultat)
         }
  )
}
x <- c(1,3,5,7,11)
optiune <- "SD"
functie(x, optiune)

#Itemul4
valoarea_absoluta <- function(x){
  return(abs(x))
}
x <- c(-1, -5, -2, -7 ,-11, -54)
x <- valoarea_absoluta(x)
print(x
)

#Itemul5
install.packages("ggplot2")
library(ggplot2)
x <- seq(0.5, 3 * pi, by = 0.01)
y <- sin(x)
plot(x, y, col = "red", lwd = 15, main = "Graficul functiei sinus")

#Itemul6
data("Orange")
plot(Orange$age, Orange$circumference,
     pch = 6, col = "green",
     main = "Dispersia varstei in functie de circumferinta",
     xlab = "Varstă", ylab = "Circumferitna")

#Itemul7

x <- seq(-6, 6, by = 0.01)
y <- dnorm(x, mean = 0, sd = 1)
plot(x, y, type = "l", lwd = 2, xlab = "x", ylab = "dnorm(x)")
legend("topright", legend = "Distributie normala intre -6 si 6", col = "blue", lwd = 2)
abline(v = 0,  lty = 2)

#Itemul8
y <- x^5 + x^3 - 3*x
x <- seq(-2, 2, by = 0.01)
plot(x, y, type = "l", lwd = 2, xlab = "x", ylab = "x^5 + x^3 - 3*x")
