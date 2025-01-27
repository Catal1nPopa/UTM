#Itemul 1
dictionar = {
    "key1": 5.5,
    "key2": 7.1,
    "key3": 3.2,
    "key4": 1.3
}

print("Chei:")
for key in dictionar.keys():
    print(key)

print("\nTupluri cheie-valoare:")
for key, value in dictionar.items():
    tuplu = (key, value)
    print(tuplu)

#Itemul 2
import random
from datetime import timedelta

num_secunde = random.randint(0, 10000)

s = timedelta(seconds=num_secunde)

ore = s.seconds // 3600
minute = (s.seconds % 3600) // 60
secunde = s.seconds % 60
formatat = f"{ore:02d}:{minute:02d}:{secunde:02d}"

print(num_secunde)
print(formatat)

###
import random

num_secunde = random.randint(0, 10000)
ore = num_secunde // 3600
minute = (num_secunde % 3600) // 60
secunde = num_secunde % 60

formatat = f"{ore:02d}:{minute:02d}:{secunde:02d}"

print(num_secunde)
print(formatat)

#Itemul 3
num1 = 2.2
num2 = 7.1
suma = lambda x, y: x + y
diferenta = lambda x, y: x - y
suma1 =suma(num1, num2)
diferenta1 = diferenta(num1, num2)

num3 = [10, 2.5, 3, -1.2]

# Apelarea funcțiilor lambda utilizând map()
suma2 = list(map(lambda x: suma(num1, x), num3))
diferenta2 = list(map(lambda x: diferenta(num2, x), num3))

print(suma1)
print(diferenta1)
print(suma2)
print(diferenta2)

#Itemul4
num = [4,4,1,7,43,3,3,1,1,6]
distinct = list(filter(lambda x: num.count(x) == 1, num))
print(distinct)

#Itemul5
from functools import reduce
def rep(șir, caracter):
    count = reduce(lambda x, y: x + 1 if y == caracter else x, șir, 0)
    return count
sir = "catalin"
variable = 'a'
rezultat = rep(sir, variable)
print(f"Apariții ale '{variable}' este: {rezultat}")

#Itemul 6
def con(*text):
    rez = ""
    for s in text:
        rez += s
    return rez

s1 = "Salut, "
s2 = "ce "
s3 = "faci?"

rez = con(s1, s2, s3)
print(rez)

#Itemul7
functii = [
    lambda s: s[1],
    lambda s: s.upper(),
    lambda s, c: s.find(c)]

text = "Catalin"

for x in functii:
    if x.__code__.co_argcount == 1:
        rez = x(text)
        print(f"Rezultat: {rez}")
    elif x.__code__.co_argcount == 2:
        var = 'l'
        rez = x(text, var)
        print(f"Rezultat: {rez}")

#Itemul 8
def media(nota1=4, nota2=4, nota3=4):
    media = (nota1 + nota2 + nota3) / 3
    return media

m1 = media(1, 2, 3)
m2 = media(1, 2)
m3 = media()
m4 = media(nota1=2, nota3=3)

print(f"{m1}")
print(f"{m2}")
print(f"{m3}")
print(f"{m4}")

#Itemul9
def suma(n):
    if n == 1:
        return 1
    else:
        return n + suma(n - 1)

n = 5
rez = suma(n)
print(f"{rez}")
