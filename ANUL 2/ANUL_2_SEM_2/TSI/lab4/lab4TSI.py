import tkinter as tk
from tkinter import ttk
from tkinter import font
from Crypto.Cipher import DES, AES
from Crypto.PublicKey import RSA
from Crypto.Signature.pkcs1_15 import PKCS115_SigScheme
from Crypto.Hash import SHA256
from Crypto.Util.Padding import pad
import rsa
import binascii

keyPair = RSA.generate(bits=1024)
pubKey = keyPair.publickey()


def generateKeys():
    (publicKey, privateKey) = rsa.newkeys(2048)
    with open('publicKey.pem', 'wb') as p:
        p.write(publicKey.save_pkcs1('PEM'))
    with open('privateKey.pem', 'wb') as p:
        p.write(privateKey.save_pkcs1('PEM'))

def loadKeys():
    with open('publicKey.pem', 'rb') as p:
        publicKey = rsa.PublicKey.load_pkcs1(p.read())
    with open('privateKey.pem', 'rb') as p:
        privateKey = rsa.PrivateKey.load_pkcs1(p.read())
    return privateKey, publicKey
    
def encryptRSA(message, key):
    return rsa.encrypt(message.encode('ascii'), key)

def decryptRSA(ciphertext, key):
    try:
        return rsa.decrypt(ciphertext, key).decode('ascii')
    except:
        return False

class Application(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        self.master = master
        self.pack()
        self.create_widgets()

    def create_widgets(self):
        # Setari font si culori
        label_font = font.Font(family='Helvetica', size=12, weight='bold')
        button_style = {'background': 'blue', 'foreground': 'white'}

        self.style = ttk.Style()
        self.style.theme_use("alt")

        # Creează un cadru pentru grupul de radiobutoane AES
        aes_frame = ttk.Frame(self)
        aes_frame.pack(pady=10)

        # Radiobutoane pentru grupul AES
        self.algo_var = tk.StringVar(value="AES")

        self.algo_aes_radio = ttk.Radiobutton(aes_frame, text="AES", variable=self.algo_var, value="AES")
        self.algo_aes_radio.pack(side=tk.LEFT, padx=(10, 5), pady=10)

        # Stil pentru radiobutoanele grupului AES
        self.style.configure("AES.TRadiobutton", background="#f0f0f0", foreground="#000000", font=("Arial", 12))

        # Creează un cadru pentru grupul de radiobutoane RSA
        rsa_frame = ttk.Frame(self)
        rsa_frame.pack(pady=10)

        # Radiobutoane pentru grupul RSA
        self.algo_rsa_radio = ttk.Radiobutton(rsa_frame, text="RSA", variable=self.algo_var, value="RSA")
        self.algo_rsa_radio.pack(side="left", padx=10)

        # Stil pentru radiobutoanele grupului RSA
        self.style.configure("RSA.TRadiobutton", background="#f0f0f0", foreground="#000000", font=("Arial", 12))

        # Creează un cadru pentru grupul de radiobutoane DS
        ds_frame = ttk.Frame(self)
        ds_frame.pack(pady=10)

        # Radiobutoane pentru grupul DS
        self.algo_ds_radio = ttk.Radiobutton(ds_frame, text="DS", variable=self.algo_var, value="DS")
        self.algo_ds_radio.pack(side="left", padx=10)

        # Stil pentru radiobutoanele grupului DS
        self.style.configure("DS.TRadiobutton", background="#f0f0f0", foreground="#000000", font=("Arial", 12))

        # Crearea unui container pentru butoane
        button_container = tk.Frame(self)
        button_container.pack(pady=10)

        # Butonul pentru criptare
        self.encrypt_button = tk.Button(button_container, text="Criptare", font=label_font, command=self.encrypt, **button_style)
        self.encrypt_button.pack(side=tk.LEFT, padx=(10, 5), pady=10)

        # Butonul pentru decriptare
        self.decrypt_button = tk.Button(button_container, text="Decriptare", font=label_font, command=self.decrypt, **button_style)
        self.decrypt_button.pack(side=tk.LEFT, padx=5, pady=10)

        # Butonul pentru semnare
        self.sign_button = tk.Button(button_container, text="Semnare", font=label_font, command=self.sign, **button_style)
        self.sign_button.pack(side=tk.LEFT, padx=5, pady=10)

        # Butonul pentru verificare
        self.verify_button = tk.Button(button_container, text="Verificare", font=label_font, command=self.verify, **button_style)
        self.verify_button.pack(side=tk.LEFT, padx=(5, 10), pady=10)

        self.input_text = tk.Text(self, height=4)
        self.input_text.pack(pady=5)

        self.output_text = tk.Text(self, height=4)
        self.output_text.pack(pady=5)

    
    def encrypt(self):
        algo = self.algo_var.get()
        plaintext = self.input_text.get("1.0", "end-1c")
        if algo == "AES":
            key = b"1myaeskey1234567"
            cipher = AES.new(key, AES.MODE_ECB)
            ciphertext = cipher.encrypt(pad(plaintext.encode(), AES.block_size))
        elif algo == "RSA":
            generateKeys()
            publicKey, privateKey = loadKeys()
            ciphertext = encryptRSA(plaintext, publicKey)
        else:
            self.output_text.insert("end", "Criptarea nu este posibila pentru algoritmul ales.")
            return
        
        self.output_text.delete("1.0", "end")
        self.output_text.insert("end", ciphertext.hex())

    def decrypt(self):
        algo = self.algo_var.get()
        ciphertext = bytes.fromhex(self.input_text.get("1.0", "end-1c"))
        if algo == "AES":
            key = b"1myaeskey1234567"
            cipher = AES.new(key, AES.MODE_ECB)
            plaintext = cipher.decrypt(ciphertext).decode()
        elif algo == "RSA":
            publicKey, privateKey = loadKeys()
            plaintext = decryptRSA(ciphertext, publicKey)
        else:
            self.output_text.insert("end", "Decriptarea nu este posibila pentru algoritmul ales.")
        self.output_text.delete("1.0", "end")
        self.output_text.insert("end", plaintext)

    def sign(self):
        plaintext = self.input_text.get("1.0", "end-1c")
        msg = bytes(plaintext, encoding = 'utf-8')
        hash = SHA256.new(msg)
        signer = PKCS115_SigScheme(keyPair)
        signature = signer.sign(hash)
        with open('signature.txt', 'wb') as p:
            p.write(signature)
        self.output_text.delete("1.0", "end")
        self.output_text.insert("end", binascii.hexlify(signature))

    def verify(self):
        plaintext = self.input_text.get("1.0", "end-1c")
        msg = bytes(plaintext, encoding = 'utf-8')
        hash = SHA256.new(msg)
        with open('signature.txt', 'rb') as p:
            signature = p.read()
        verifier = PKCS115_SigScheme(pubKey)
        try:
            verifier.verify(hash, signature)
            self.output_text.delete("1.0", "end")
            self.output_text.insert("end", "Semnatura este valida.")
            print("Signature is valid.")
        except:
            self.output_text.delete("1.0", "end")
            self.output_text.insert("end", "Semnatura nu este valida.")
            print("Signature is invalid.")
            

root = tk.Tk()
app = Application(master=root)
app.mainloop()
