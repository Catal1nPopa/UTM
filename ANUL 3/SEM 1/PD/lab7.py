#1
from mpmath import mp
mp.dps = 100
raspuns = mp.sqrt(2)
print(raspuns)

#2
from fractions import Fraction
fractie1 = Fraction(1, 2)
fractie2 = Fraction(1, 3)
rezultat = fractie1 + fractie2
print("Rezultatul adunării:", rezultat)

#3
from sympy import symbols, expand
x, y = symbols('x y')
expresie = (x + y)**6
forma_extinsa = expand(expresie)
print(forma_extinsa)

#4
from sympy import symbols, simplify, sin, cos
x = symbols('x')
expresie = sin(x) / cos(x)
expresie_simplificata = simplify(expresie)
print("Expresia simplificată:", expresie_simplificata)

#5
from sympy import symbols, limit, sin
x = symbols('x')
expresie = sin(x) / x
rezultat_limita = limit(expresie, x, 0)
print("Limita când x se apropie de 0 pentru sin(x)/x:", rezultat_limita)

#6
from sympy import symbols, diff, log
x = symbols('x')
expresie = log(x)
derivata = diff(expresie, x)
print("Derivata pentru log(x):", derivata)

#7
from sympy import symbols, Eq, solve
x, y = symbols('x y')
ec1 = Eq(2*x + 3*y, 5)
ec2 = Eq(4*x - 3*y, -4)
rezultat = solve((ec1, ec2), (x, y))
print(f"x = {rezultat[x]}, y = {rezultat[y]}")

#8
from sympy import symbols, Not, Or, And, satisfiable
x, y = symbols('x y')
expresie = And(Or(x, Not(y)), Or(y, Not(x)))
# Verificăm dacă există asignări care satisfac expresia
asignare = satisfiable(expresie)

if asignare:
    print("Există valori pentru x și y care fac expresia adevărată:")
    print(asignare)
else:
    print("Nu există valori pentru x și y care să facă expresia adevărată.")

#9
from sympy import symbols, Function,dsolve
x = symbols('x')
# Definim funcția necunoscută f(x)
f = Function('f')
# Definim ecuația diferențială Bernoulli
ecuatie = x * f(x).diff(x) + f(x) - f(x)**2
# Rezolvare fără hint
sol_fara_hint = dsolve(ecuatie)
# Rezolvare cu hint 'Bernoulli'
sol_cu_hint = dsolve(ecuatie, hint='Bernoulli')

print("Rezolvare fără hint:")
print(sol_fara_hint)
print("\nRezolvare cu hint 'Bernoulli':")
print(sol_cu_hint)

#10
from scipy.integrate import quad
import numpy as np
def f(x):
    return np.cos(2 * np.pi * x)
integrala, eroare = quad(f, 0, 1)
print("Valoarea integrală:", integrala)
print("Estimarea erorii:", eroare)

#11
import numpy as np
import matplotlib.pyplot as plt

# Parametrii semnalului
fs = 1000  # Frecvența de eșantionare
t = np.arange(0, 1, 1/fs)  # Vectorul timp

# Creează semnalul ca o suprapunere de sinusuri
f1 = 50  # Frecvența primei sinusoidale
f2 = 70  # Frecvența celei de-a doua sinusoidale
amplitudine1 = 1.0
amplitudine2 = 0.7
faza1 = 0  # Faza primei sinusoidale
faza2 = np.pi/4  # Faza celei de-a doua sinusoidale cu o ușoară schimbare de fază

semnal = amplitudine1 * np.sin(2 * np.pi * f1 * t + faza1) + amplitudine2 * np.sin(2 * np.pi * f2 * t + faza2)

# Realizează transformata Fourier
fft_result = np.fft.fft(semnal)
frecvente = np.fft.fftfreq(len(semnal), 1/fs)

# Afișează semnalul și spectrul Fourier
plt.figure(figsize=(10, 6))

# Afișează semnalul în domeniul timpului
plt.subplot(2, 1, 1)
plt.plot(t, semnal)
plt.title('Semnal în domeniul timpului')
plt.xlabel('Timp (s)')
plt.ylabel('Amplitudine')

# Afișează spectrul Fourier
plt.subplot(2, 1, 2)
plt.plot(frecvente, np.abs(fft_result))
plt.title('Spectrul Fourier')
plt.xlabel('Frecvență (Hz)')
plt.ylabel('Amplitudine')

plt.tight_layout()
plt.show()


#12
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import fmin

# Definirea funcției de minimizat
def f(x):
    return np.cos(x) - 3 * np.exp(-(x - 0.2)**2)

# Căutarea minimului pentru x0 = 1.0
x_min_1 = fmin(f, x0=1.0)
min_value_1 = f(x_min_1)

# Căutarea minimului pentru x0 = 2.0
x_min_2 = fmin(f, x0=2.0)
min_value_2 = f(x_min_2)

# Afișarea rezultatelor
print(f"Minimul pentru x0 = 1.0: x = {x_min_1}, f(x) = {min_value_1}")
print(f"Minimul pentru x0 = 2.0: x = {x_min_2}, f(x) = {min_value_2}")

# Generarea unui set de puncte pentru a afișa funcția
x_values = np.linspace(-2, 4, 100)
y_values = f(x_values)

# Afișarea funcției și punctelor de minim pe un plot
plt.plot(x_values, y_values, label='f(x)')
plt.scatter([x_min_1, x_min_2], [min_value_1, min_value_2], color='red', label='Minim')

# Adăugarea etichetelor și a titlului
plt.xlabel('x')
plt.ylabel('f(x)')
plt.title('Funcția și Minimele Găsite')

# Adăugarea unei legende
plt.legend()

# Afișarea plotului
plt.show()


#13
import numpy as np
import matplotlib.pyplot as plt
from scipy import signal, ndimage
from PIL import Image, ImageFilter


image_path = 'Screenshot_2.png'
original_image = Image.open(image_path)

# Convertiți imaginea la scala de gri
gray_image = original_image.convert('L')
gray_array = np.array(gray_image)

# Afișați imaginea originală
plt.figure(figsize=(8, 8))
plt.subplot(4, 4, 1)
plt.imshow(gray_array, cmap='gray')
plt.title('Imaginea originală (scala de gri)')
plt.axis('off')

# Generați zgomot aleator
noisy_array = np.random.normal(loc=0, scale=25, size=(original_image.height, original_image.width)).astype(np.uint8)
noisy_image = original_image.copy()
noisy_image_array = np.array(noisy_image)
noisy_image_array[:, :, 0] += noisy_array

# afisare zgomot
plt.subplot(4, 4, 2)
plt.imshow(noisy_image_array)
plt.title('Imagine cu zgomot')
plt.axis('off')

# Aplicați filtrele Gaussian
gaussian_filtered = noisy_image.filter(ImageFilter.GaussianBlur(radius=30))

# Afișați rezultatele filtrării
plt.subplot(4, 4, 3)
plt.imshow(gaussian_filtered)
plt.title('Filtru Gaussian')
plt.axis('off')

#median
median_filtered = gray_image.filter(ImageFilter.MedianFilter(size=1))
plt.subplot(4, 4, 4)
plt.imshow(median_filtered)
plt.title('Filtru Median')
plt.axis('off')

# Aplicați filtrul Wiener
wiener_filtered = signal.wiener(gray_array, mysize=(1, 1))
plt.subplot(4, 4, 5)
plt.imshow(wiener_filtered, cmap='gray')
plt.title('Filtru Wiener')
plt.axis('off')

# Aplicați filtrul Wiener
rotat = original_image.rotate(180)
plt.subplot(4, 4, 6)
plt.imshow(rotat, cmap='gray')
plt.title('Rotat (180)')
plt.axis('off')


im_resized = original_image.resize((250, 250))
plt.subplot(4, 4, 7)
plt.imshow(im_resized)
plt.title('Redimensionarea')
plt.axis('off')

plt.show()