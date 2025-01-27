# Itemul 1
x <- c(2:4, 9:13)

y <- c("b", "c", "E")

x[5]

y[2:3]

y[c(2,2,3)]

x[50]

x[-5]

x[3]

x[c(2,2,5:7)]

x[6:1]

x[-(1:4)]

x[-c(1,4)]

# Itemul 2
varianta <- function(vector) {
  varianta <- var(vector)
  return(varianta)
}
# Folosirea funcției
rez <- varianta(x)
cat("Varianta vectorului =", rez)

#Itemul 3
vector=1:10

matrice1=matrix(vector, ncol=2)

matrice1

matrice2=matrix(1:10,nrow=2,byrow=T)

matrice2

m=matrix(1:4,nrow=3,ncol=3)

m

print(matrice2)

dim(matrice1)

ncol(matrice1)

nrow(matrice1)

resultat= matrice1 %*% matrice2

#Itemul 4

dim(matrice1)

ncol(matrice1)

nrow(matrice1)

resultat= matrice1 %*% matrice2

t (matrice1)

diag (resultat)

diag(c(3,2,4))

vecteur1= c(8,3,2)

vecteur2 = c(23,6,9)

res=rbind(vecteur1,vecteur2)

vecteur3=c(2,4)

cbind(res,vecteur3)

eigen(resultat)

#Itemul 5
resultat[1,]

resultat[, c(2,2,1)]

resultat[-1, ]

resultat [1 :2,-1]

resultat [resultat>51]

matrix(vector,nrow=2)

matrix(vector,nrow=2, byrow=T)

#Itemul 6
new_vector <- c(1, 10, 5, 7, 2, 12, 9, 1, 3, 13, 8, 4, 5, 22, 34, 3)
new_matrix <- matrix(new_vector, nrow = 4, ncol = 4)

element <- new_matrix[3,2]
print(element)

new_matrix[2, ]

new_matrix[, 4]

new_matrix[-1, -2]

## itemul 6.3
new_matrix <- matrix(c("1", "10", "5", "7", "2",
                       "12", "9", "1", "3",
                       "13", "8", "4", "5", "22",
                       "34", "3"),
                    nrow = 4, ncol = 4)

# Convert to numeric
new_matrix
new_matrix <- as.numeric(new_matrix)
write.table(new_matrix, file = "data.txt", row.names = FALSE, col.names = TRUE)
##############

#Itemul 7
creare_grafic <-function(file){
  x <- read.table(file)
  y <- plot(x, col="red", type="o", pch=19)
  title(main="Grafic", col.main="Blue", font.main=4)
  return (y)
}
creare_grafic("data.txt")

#hist(x)
#x <- read.table("data.txt", header = TRUE)
#plot(x)

#Itemul 8
summary(airquality)

mean(airquality$Temp)
median(airquality$Temp)
sd(airquality$Temp)

varianta <- var(airquality$Temp)
abaterea_standart <- sqrt(varianta)

abaterea_standart <- function(data) {
  varianta <- var(data)
  ab <- sqrt(varianta)
  return(ab)
}
abaterea <- abaterea_standart(airquality$Temp)

data(airquality)

airquality[2, ]

airquality[ , 3]

airquality[c(1, 2, 4), ]

airquality[2:6, ]

airquality[, -c(1, 2)]

airquality[airquality$Temp > 90, ]
