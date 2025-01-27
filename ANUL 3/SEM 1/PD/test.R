
library(ggplot2)
x <- seq(0.5, 3 * pi, by = 0.01)
z<- -x
y <- sin(z)
plot(z, y, col = "red", lwd = 15, main = "Graficul functiei sinus")
abline(h = 0, lwd =2, col = "black", lty = 3)

