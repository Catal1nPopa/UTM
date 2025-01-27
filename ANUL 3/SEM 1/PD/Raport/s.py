import numpy as np
import matplotlib.pyplot as plt

fr1 = 50  # Hz
fr2 = 70  # Hz

timp_total = 0.5  # sec
frecventa_esantionare = 1000  # Hz (nr. eșantioane/sec)

timp = np.linspace(0, timp_total, int(timp_total * frecventa_esantionare), endpoint=False)
semnal = np.sin(2 * np.pi * fr1 * timp) + np.sin(2 * np.pi * fr2 * timp + np.pi/4)

plt.figure(figsize=(15, 6))
plt.plot(timp, semnal)
plt.xlabel('Time [s]')
plt.ylabel('Signal')
plt.show()

transformata = np.fft.fft(semnal)
frecvente = np.fft.fftfreq(len(semnal), 1 / frecventa_esantionare)

plt.figure(figsize=(15, 6))
plt.plot(np.abs(frecvente), np.abs(transformata))
plt.xlabel('Frecvență [Hz]')
plt.ylabel('abs(DFT(signal))')
plt.xlim(0, 250)
plt.show()

componenta_50Hz = np.where((np.abs(frecvente) >= fr1 - 1) & (np.abs(frecvente) <= fr1 + 1))[0][0]
componenta_70Hz = np.where((np.abs(frecvente) >= fr2 - 1) & (np.abs(frecvente) <= fr2 + 1))[0][0]

semnal_reconstruit = np.fft.ifft(transformata)
semnal_reconstruit = semnal_reconstruit.real

plt.figure(figsize=(15, 6))
plt.plot(timp, semnal_reconstruit, label='Semnal reconstruit')
plt.xlabel('Time')
plt.ylabel('Amplitude')
plt.legend()
plt.show()