#!/usr/bin/env python
# coding=utf-8
'''
  > File Name: main.py
  > Author: 施湘岚
  > Mail: admin@cloudtower.cc
  > Created Time: Fri Mar 17 13:44:38 2023
'''

import numpy as np

pc1 = np.array([57, 49, 41, 33, 25, 17, 9, 1, 58, 50, 42, 34, 26, 18, 10, 2, 59, 51, 43, 35, 27, 19, 11, 3, 60, 52, 44, 36, 63, 55, 47, 39, 31, 23, 15, 7, 62, 54, 46, 38, 30, 22, 14, 6, 61, 53, 45, 37, 29, 21, 13, 5, 28, 20, 12, 4])

pc2 = np.array([14, 17, 11, 24, 1, 5, 3, 28, 15, 6, 21, 10, 23, 19, 12, 4, 26, 8, 16, 7, 27, 20, 13, 2, 41, 52, 31, 37, 47, 55, 30, 40, 51, 45, 33, 48, 44, 49, 39, 56, 34, 53, 46, 42, 50, 36, 29, 32])

sd = np.array([1, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1])

ip = np.array([58,50,42,34,26,18,10,2,
            60,52,44,36,28,20,12,4,
            62,54,46,38,30,22,14,6,
            64,56,48,40,32,24,16,8,
            57,49,41,33,25,17,9,1,
            59,51,43,35,27,19,11,3,
            61,53,45,37,29,21,13,5,
            63,55,47,39,31,23,15,7])

ipReverse = np.array([40,8,48,16,56,24,64,32,
                    39,7,47,15,55,23,63,31,
                    38,6,46,14,54,22,62,30,
                    37,5,45,13,53,21,61,29,
                    36,4,44,12,52,20,60,28,
                    35,3,43,11,51,19,59,27,
                    34,2,42,10,50,18,58,26,
                    33,1,41,9,49,17,57,25])

E = np.array([32,1,2,3,4,5,
            4,5,6,7,8,9,
            8,9,10,11,12,13,
            12,13,14,15,16,17,
            16,17,18,19,20,21,
            20,21,22,23,24,25,
            24,25,26,27,28,29,
            28,29,30,31,32,1])

P = np.array([16,7,20,21,
           29,12,28,17,
           1,15,23,26,
           5,18,31,10,
           2,8,24,14,
           32,27,3,9,
           19,13,30,6,
           22,11,4,25])

s = np.array([[14,4,13,1,2,15,11,8,3,10,6,12,5,9,0,7,
                0,15,7,4,14,2,13,1,10,6,12,11,9,5,3,8,
                4,1,14,8,13,6,2,11,15,12,9,7,3,10,5,0,
                15,12,8,2,4,9,1,7,5,11,3,14,10,0,6,13,],
                [15,1,8,14,6,11,3,4,9,7,2,13,12,0,5,10,
                3,13,4,7,15,2,8,14,12,0,1,10,6,9,11,5,
                0,14,7,11,10,4,13,1,5,8,12,6,9,3,2,15,
                13,8,10,1,3,15,4,2,11,6,7,12,10,5,14,9,],
                [10,0,9,14,6,3,15,5,1,13,12,7,11,4,2,8,
                13,7,0,9,3,4,6,10,2,8,5,14,12,11,15,1,
                13,6,4,9,8,15,3,0,11,1,2,12,5,10,14,7,
                1,10,13,0,6,9,8,7,4,15,14,3,11,5,2,12],
                [7,13,14,3,0,6,9,10,1,2,8,5,11,12,4,15,
                13,8,11,5,6,15,0,3,4,7,2,12,1,10,14,9,
                10,6,9,0,12,11,7,13,15,1,3,14,5,2,8,4,
                3,15,0,6,10,1,13,8,9,4,5,11,12,7,2,14,],
                [2,12,4,1,7,10,11,6,8,5,3,15,13,0,14,9,
                14,11,2,12,4,7,13,1,5,0,15,10,3,9,8,6,
                4,2,1,11,10,13,7,8,15,9,12,5,6,3,0,14,
                11,8,12,7,1,14,2,13,6,15,0,9,10,4,5,3],
                [12,1,10,15,9,2,6,8,0,13,3,4,14,7,5,11,
                10,15,4,2,7,12,9,5,6,1,13,14,0,11,3,8,
                9,14,15,5,2,8,12,3,7,0,4,10,1,13,11,6,
                4,3,2,12,9,5,15,10,11,14,1,7,6,0,8,13,],
                [4,11,2,14,15,0,8,13,3,12,9,7,5,10,6,1,
                13,0,11,7,4,9,1,10,14,3,5,12,2,15,8,6,
                1,4,11,13,12,3,7,14,10,15,6,8,0,5,9,2,
                6,11,13,8,1,4,10,7,9,5,0,15,14,2,3,12],
                [13,2,8,4,6,15,11,1,10,9,3,14,5,0,12,7,
                1,15,13,8,10,3,7,4,12,5,6,11,0,14,9,2,
                7,11,4,1,9,12,14,2,0,6,10,13,15,3,5,8,
                2,1,14,7,4,10,8,13,15,12,9,0,3,5,6,11]])

subKeys = [];

def str2bin(s):
    res = []
    for c in s:
        k = str(bin(ord(c))[2:])
        while len(k) < 8:
            k = '0' + k
        for i in k:
            res.append(i)
    return res

def bin2str(seq):
    k = 0b0
    s = ""
    for i in range(len(seq)):
        if i % 8 == 0:
            s = s + chr(k)
            k = 0b0
        k = k << 1
        k += int(seq[i])
    if k != 0:
        s = s + chr(k)
    return s

def binListXOR(a, b):
    res = []
    for i in range(len(a)):
        res.append(str(int(a[i]) ^ int(b[i])))
    return res

def permuBinList(seq, per):
    res = []
    for i in range(len(per)):
        res.append(seq[per[i] - 1])
    return res

def leftRecurrentShift(seq, n):
    seq = list(seq)
    for i in range(n):
        seq.append(seq[0])
        del seq[0]
    return seq

def PermuKey(ci, di):
    k = []
    k.extend(ci)
    k.extend(di)
    return permuBinList(k, pc2)

def genSubKeys(key):
    # init Ci and Di
    k = str2bin(key)
    new_k = permuBinList(k, pc1)
    ci, di = new_k[:28], new_k[28:]

    # generate subKeys
    for i in range(16):
        ci, di = leftRecurrentShift(ci, sd[i]), leftRecurrentShift(di, sd[i])
        subKeys.append(PermuKey(ci, di))

    return

def sBox(ri):
    res = []
    for i in range(8):
        tmp = ri[i * 6: (i + 1) * 6]
        row = int(ri[0]) * 2 + int(ri[5]);
        col = int(ri[1]) * 8 + int(ri[2]) * 4 + int(ri[3]) * 2 + int(ri[4])
        res.extend(str2bin(chr(s[i][row * 15 + col])))
    return res

def fFunc(li, ri, k):
    new_ri = permuBinList(ri, E)
    new_ri = binListXOR(new_ri, k)
    new_ri = sBox(new_ri)
    new_ri = permuBinList(new_ri, P)
    return binListXOR(new_ri, li)

key = "kabg3s$f"
message = "Mineswee"
print("Message (Original):", message)
genSubKeys(key)

# DES Encryption

binMessage = str2bin(message)
print("binMessage (Original):", "".join(binMessage))
binMessage = permuBinList(binMessage, ip)
li, ri = binMessage[:32], binMessage[32:]
for i in range(16):
    li, ri = ri, fFunc(li, ri, subKeys[i])

li, ri = ri, li
binMessage = []
binMessage.extend(li)
binMessage.extend(ri)
binMessage = permuBinList(binMessage, ipReverse)
print("binMessage (Encrypted):", "".join(binMessage))
print("Message (Encrypted):", bin2str(binMessage))

# DES Decryption
binMessage = permuBinList(binMessage, ip)
li, ri = binMessage[:32], binMessage[32:]
for i in range(16):
    li, ri = ri, fFunc(li, ri, subKeys[15 - i])

li, ri = ri, li
binMessage = []
binMessage.extend(li)
binMessage.extend(ri)
binMessage = permuBinList(binMessage, ipReverse)
print("binMessage (Decrypted): ", "".join(binMessage))
print("Message (Decrypted): ", bin2str(binMessage))
