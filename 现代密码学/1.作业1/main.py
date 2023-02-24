#!/usr/bin/env python
# coding=utf-8
'''
  > File Name: main.py
  > Author: 施湘岚
  > Mail: admin@cloudtower.cc
  > Created Time: Fri Feb 24 20:15:44 2023
'''

import numpy as np

str = "PLEASE SEND ME THE BOOK, MY CREDIT CARD NO IS SIX ONE TWO ONE THREE EIGHT SIX ZERO ONE SIX EIGHT FOUR NINE SEVEN ZERO TWO."

A = np.array([[3, 13, 21, 9], [15, 10, 6, 25], [10, 17, 4, 8], [1, 23, 7, 2]])
A_ = np.array([[23, 13, 20, 5], [0, 10, 11, 0], [9, 11, 15, 22], [9, 22, 6, 25]])
B = np.array([1, 21, 8, 17]).T

str_original = str.replace(" ", "").replace(",", "").replace(".", "")
str_len = len(str_original)

print("The Original String is: ")
print(str_original)

# Data Preprocessing
Ms = []
Mi = []

for c in str:
    if ord(c) >= 65 and ord(c) <= 90:
        Mi.append(ord(c) - 65)

    if len(Mi) >= 4:
        Ms.append(np.array(Mi.copy()))
        Mi.clear()

if len(Mi) != 0:
    while len(Mi) < 4:
        Mi.append(0)
    Ms.append(Mi)
# print(Ms)

# Encrypting
print("The string encrypted is: ")
Cs = []
str_encoded = ""
for i in range(len(Ms)):
    Cs.append(np.add(np.dot(A, Ms[i]), B) % 26)

for i in range(len(Cs)):
    for j in range(len(Cs[i])):
        str_encoded += chr(Cs[i][j] + 65)

print(str_encoded[:str_len])

# Decrypting
print("The string decrypted is: ")
Mi = []
str_decoded = ""
for i in range(len(Cs)):
    Mi = ((np.dot(A_, np.subtract(Cs[i], B))) % 26)
    # print(Mi)
    for j in range(len(Mi)):
        str_decoded += chr(Mi[j] + 65)

print(str_decoded[:str_len])
