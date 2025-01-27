#Itemul1
# Creați data frame A
A <- data.frame(Sexe = c("H", "F", "F", "H", "H"),
                Poids = c(75, 68, 48, 72, 83))
# Creați data frame B
B <- data.frame(Sexe = c("H", "F", "F", "H", "H"),
                Taille = c(182, 165, 160, 178, 183))
# Combinarea frame-urilor A și B
C <- cbind(A, B$Taille)
# Redenumirea coloanelor pentru a se potrivi cerințelor
colnames(C) <- c("Sexe", "Poids", "Taille")
# Afișarea frame-ului C
print(C)

#Itemul2
x = c(0.2, 0.6, 2.1, 3.7, 2.8, 2.7, 1.9, 2.3, 5.9)
# Extrage numerele între 2 și 3
rezultat <- x[x >= 2 & x <= 3]
# Afișează rezultatul
print(rezultat)

#Itemul3
# Definește datele
matrice <- matrix(c(1, 0, 3, 4, 6, 6, 0, 4, 5, 6, 2, 3, 0, 1, 2, 4), nrow = 4, ncol = 4)
# Creează matricea Y cu nume pentru rânduri și coloane
colnames(matrice) <- c("column 1", "column 2", "column 3", "column 4")
rownames(matrice) <- c("row-1", "row-2", "row-3", "row-4")
# Afișează matricea Y
print(matrice)

#Itemul4
#A)

# Încărcați pachetul de date Orange (dacă nu a fost deja încărcat)
data("Orange")
# Accesați ultimele două variabile din setul de date Orange
variabile <- Orange[, c("circumference", "age")]
# Calculați statisticile de bază pentru aceste două variabile
statistici <- summary(variabile)
print(statistici)

#B)
# Calculați quartilele pentru ambele variabile folosind funcția quantile
quartile_variabile <- sapply(variabile, quantile, probs = c(0.25, 0.5, 0.75))
# Afișați rezultatele
print(quartile_variabile)

#C)
# Calculăm toate decilele pentru ambele variabile
probs <- seq(0.1, 1, by = 0.1) # Specificăm decilele dorite

# Folosim funcția "apply" pentru a calcula decilele pentru fiecare variabilă
decile <- apply(variabile, 2, function(x) quantile(x, probs = probs))
print(decile)

#Itemul5
#A)
k <- rep(c(8, 2, 6), times = 3)
print(k)

#B)
# Metoda 1
w <- rep(c(4, 9, 2), times = c(7, 5, 3))
print(w)

# Metoda 2
w <- c(rep(4, 7), rep(9, 5), rep(2, 3))
print(w)
#Itemul6
size <- c(178, 175, 160, 191, 176, 155, 163, 174, 182)

size_1 <- c(164, 172, 156, 195, 166)

new.size <- c(rep(size_1, each = 2), tail(size, 7))

write.csv(new.size, file = "new_size.csv")

#Itemul7
data(iris)
head(iris, 7)
new.iris <- subset(iris, Species == "versicolor")
new.iris <- new.iris[order(new.iris$Sepal.Length, decreasing = TRUE), ]
new.iris

#Itemul8
A <- matrix(c("8", "9", "16", "2"), nrow = 2, ncol = 2)
A_num <- as.numeric(A)
#După convertire obținem un vector numeric, astfel mai jos creem o matrice pentru a avea matrice numerică
A_num <- matrix(as.numeric(A), nrow = nrow(A), ncol = ncol(A))

#Itemul9

# Crearea cadru de date "person"
person <- data.frame(
  height = c(160, 180, 175),
  weight = c(52, 96, 60),
  age = c(18, 43, 29),
  c.eyes = c("green", "blue", "blue")
)
# Afișarea cadru de date
print(person)

colnames(person)[3] <- "new.age"

#1.
colnames(person)[3] <- "new.age"
#2.
rownames(person)[2] <- "Mary"
#3.
rownames(person) <- NULL
#4.
colnames(person) <- c("a", "b", "c", "d")
#5.
element <- person[1, 3]
#6.
# Data frame
variable_dataframe <- data.frame(person[, 2])

# Vector
variable_vector <- person[, 2]
#7.
elements <- person[c(1, 3), 3]
#8.
superioare <- person$height[person$height >= 160]

inferioare <- person$height[person$height <= 180]
#9
var <- person$weight[person$height > 170]
#10
mai_mult_52kg <- person[person$weight > 52, ]
#11
person$a[1:2] <- c(190, 158)


#Itemul10
# Crearea listei "my_list"
my_list <- list(
  (5),
  (c(160, 180, 175)),
  (matrix(1:12, nrow = 4)),
  (data.frame(
    height = c(160, 180, 175),
    weight = c(52, 96, 60),
    age = c(18, 43, 29),
    c.eyes = c("green", "blue", "blue")
  ))
)
#1
names(my_list) <- c("lista1", "lista2", "lista3", "lista4")
#2
# In vector
vector <- unlist(my_list$lista2)
# In listă
list <- my_list$lista2
#3
element1 <- my_list$lista2
element3 <- my_list$lista3
#4
compartiment4 <- my_list$lista4
element0 <- compartiment4[[3, 2]]

