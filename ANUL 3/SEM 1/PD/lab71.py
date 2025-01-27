#1
import numpy as np
num = np.sqrt(2)
num = np.round(num, 100)
print(num)

#2
import numpy as np
from fractions import Fraction
frac1 = Fraction(1, 2)
frac2 = Fraction(1, 3)
num = np.add(frac1, frac2)
print(num)

#3
from sympy import symbols, expand
x, y = symbols('x y')
expresie = (x + y)**6
forma_exstinsa = expand(expresie)
print(forma_exstinsa)

#4
from sympy import symbols, simplify, sin, cos
x = symbols('x')
expresie = sin(x) / cos(x)
forma_exstinsa = simplify(expresie)
print(forma_exstinsa)

#5

