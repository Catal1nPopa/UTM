import os
import pathlib

import numpy as np
import matplotlib.pyplot as plt
from PIL import Image
from sklearn.utils import shuffle
from sklearn.model_selection import train_test_split
import tensorflow as tf
from tensorflow.keras import layers, models

# Paso 2: Citirea primelor 10 imagini din fișier
director_imagini = pathlib.Path("Vehicles")

# Citirea imaginilor și etichetelor din directorul specificat
def citeste_imagini_si_etichete(director):
    imagini = []
    etichete = []
    for filename in os.listdir(director):
        img = Image.open(os.path.join(director, filename))
        if img is not None:
            imagini.append(img)
            # Verificăm dacă numele fișierului conține cuvântul "masina" sau "motocicleta" pentru a stabili eticheta
            if "Cars" in filename:
                etichete.append(1)  # 1 pentru mașini
            elif "Moto" in filename:
                etichete.append(0)  # 0 pentru motociclete
    return imagini, etichete

imagini, etichete = citeste_imagini_si_etichete(director_imagini)

# Paso 3: Amestecarea imaginilor și etichetelor
imagini, etichete = shuffle(imagini, etichete)