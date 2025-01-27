import tensorflow as tf
import numpy as np
import pathlib
import os
from tqdm import tqdm
DataPath = pathlib.Path("Pets")
all_paths = []

# Parcurge recursiv fiecare fișier .jpg din directorul "Pets" și subdirectoarele sale
for file_path in DataPath.glob("**/*.jpg"):
    all_paths.append(file_path)

# Afișează lista de căi către fișiere .jpg
print(all_paths)

#citirea primelor 10 imagini
all_paths = list(all_paths)
print(all_paths[:10])

all_paths = list(map(lambda  x : str(x) , all_paths))
print(all_paths[:10])

#Pasul 3
from random import shuffle
shuffle(all_paths)
print(all_paths[:10])

#pasul  4
def TestImageQuality(all_paths):
    new_all_paths = []
    for path in tqdm(all_paths):
        try:
            image = tf.io.read_file(path)
            image = tf.io.decode_jpeg(image, channels = 3)
        except :
            continue
        new_all_paths.append(path)
    return  new_all_paths

all_paths = TestImageQuality(all_paths)
#print(all_paths[:10])

#pasul 5
def get_label(image_path):# Folosește separatorul de cale de fișier corespunzător sistemului de operare
    segments = image_path.split(os.path.sep)
    if len(segments) >= 2:
        return segments[-2]
    else:
        return None

al_labels = list(map(lambda x: get_label(x), all_paths))
#print(al_labels[:10])
from sklearn.preprocessing import LabelEncoder
Le = LabelEncoder()
all_paths = Le.fit_transform(all_paths)
print(all_paths[:10])

#Pasul 6
from sklearn.model_selection import train_test_split
Train_paths, Val_paths, Train_labels, Val_labels = train_test_split(all_paths, all_paths)
print(Train_paths[:10], Train_labels[:10])

def load(image, label):
    image = tf.io.read_file(image)
    image = tf.io.decode_jpeg(image,channels = 1)
    return image,label

# Define IMAGE SIZE and BATCH SIZE
IMG_SIZE = 224
BATCH_SIZE = 128

# Basic Transformation
resize = tf.keras.Sequential([
    tf.keras.layers.Lambda(lambda x: tf.image.resize(x, (IMG_SIZE, IMG_SIZE)))
])

# Data Augmentation
data_augmentation = tf.keras.Sequential([
    tf.keras.layers.Lambda(lambda x: tf.image.random_flip_left_right(x)),
    tf.keras.layers.Lambda(lambda x: tf.image.random_rotation(x, 0.2)),
    tf.keras.layers.Lambda(lambda x: tf.image.random_zoom(x, (0.8, 1.0))),
])


#Function used to create a tensorflow data object
AUTOTUNE = tf.data.AUTOTUNE

def get_dataset(paths, labels, train=True):
    image_paths = tf.convert_to_tensor(paths)
    labels = tf.convert_to_tensor(labels)  # Corectare: utilizare '=' în loc de '-'

    image_dataset = tf.data.Dataset.from_tensor_slices(image_paths)
    label_dataset = tf.data.Dataset.from_tensor_slices(labels)

    dataset = tf.data.Dataset.zip((image_dataset, label_dataset))  # Corectare: tuplu de dataset-uri

    dataset = dataset.map(lambda image, label: load(image, label))
    dataset = dataset.map(lambda image, label: (resize(image), label), num_parallel_calls=AUTOTUNE)
    dataset = dataset.shuffle(1000)
    dataset = dataset.batch(BATCH_SIZE)

    if train:
        dataset = dataset.map(lambda image, label: (data_augmentation(image), label), num_parallel_calls=AUTOTUNE)
        dataset = dataset.repeat()
    return dataset

train_dataset = get_dataset(Train_paths, Train_labels)


image, labels = next(iter(train_dataset))
print(image.shape)
print(labels.shape)

