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

