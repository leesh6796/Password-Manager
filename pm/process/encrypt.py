#-*- coding:utf-8 -*-
import hashlib, os
from Crypto.Cipher import AES

def Encrypt(password, plaintext, base64=False):
    SALT_LENGTH = 32
    DERIVATION_ROUNDS=1337
    BLOCK_SIZE = 16
    KEY_SIZE = 32
    MODE = AES.MODE_CBC

    salt = os.urandom(SALT_LENGTH)
    iv = os.urandom(BLOCK_SIZE)

    plaintext = plaintext.encode("utf-8", "ignore")

    paddingLength = 16 - (len(plaintext) % 16)
    paddedPlaintext = plaintext+chr(paddingLength)*paddingLength

    derivedKey = password.encode("utf-8", "ignore")  # unicode로 하고 싶지 않으면 encode 지운다.

    for i in range(0,DERIVATION_ROUNDS):
        derivedKey = hashlib.sha256(derivedKey+salt).digest()
    derivedKey = derivedKey[:KEY_SIZE]
    cipherSpec = AES.new(derivedKey, MODE, iv)
    ciphertext = cipherSpec.encrypt(paddedPlaintext)
    ciphertext = ciphertext + iv + salt
    if base64:
        import base64
        return base64.b64encode(ciphertext)
    else:
        return ciphertext.encode("hex")

def Decrypt(password, ciphertext, base64=False):
    SALT_LENGTH = 32
    DERIVATION_ROUNDS=1337
    BLOCK_SIZE = 16
    KEY_SIZE = 32
    MODE = AES.MODE_CBC

    if base64:
        import base64
        decodedCiphertext = base64.b64decode(ciphertext)
    else:
        decodedCiphertext = ciphertext.decode("hex")
    startIv = len(decodedCiphertext)-BLOCK_SIZE-SALT_LENGTH
    startSalt = len(decodedCiphertext)-SALT_LENGTH
    data, iv, salt = decodedCiphertext[:startIv], decodedCiphertext[startIv:startSalt], decodedCiphertext[startSalt:]
    derivedKey = password.encode("utf-8", "ignore")
    for i in range(0, DERIVATION_ROUNDS):
        derivedKey = hashlib.sha256(derivedKey+salt).digest()
    derivedKey = derivedKey[:KEY_SIZE]
    cipherSpec = AES.new(derivedKey, MODE, iv)
    plaintextWithPadding = cipherSpec.decrypt(data)
    paddingLength = ord(plaintextWithPadding[-1])
    plaintext = plaintextWithPadding[:-paddingLength]
    return plaintext