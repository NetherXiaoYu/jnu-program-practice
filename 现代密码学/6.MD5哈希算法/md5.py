#!/usr/bin/env python
# coding=utf-8

'''
  > File Name: md5.py
  > Author: 施湘岚
  > Mail: admin@cloudtower.cc
  > Created Time: Sat May 13 08:18:23 2023
'''

import numpy as np
import hashlib

# T Table
T = [[0xD76AA478, 0xE8C7B756, 0x242070DB, 0xC1BDCEEE, 0xF57C0FAF, 0x4787C62A, 0xA8304613, 0xFD469501, 0x698098D8, 0x8B44F7AF, 0xFFFF5BB1, 0x895CD7BE, 0x6B901122, 0xFD987193, 0xA679438E, 0x49B40821], 
     [0xF61E2562, 0xC040B340, 0x265E5A51, 0xE9B6C7AA, 0xD62F105D, 0x02441453, 0xD8A1E681, 0xE7D3FBC8, 0x21E1CDE6, 0xC33707D6, 0xF4D50D87, 0x455A14ED, 0xA9E3E905, 0xFCEFA3F8, 0x676F02D9, 0x8D2A4C8A], 
     [0xFFFA3942, 0x8771F681, 0x6D9D6122, 0xFDE5380C, 0xA4BEEA44, 0x4BDECFA9, 0xF6BB4B60, 0xBEBFBC70, 0x289B7EC6, 0xEAA127FA, 0xD4EF3085, 0x04881D05, 0xD9D4D039, 0xE6DB99E5, 0x1FA27CF8, 0xC4AC5665], 
     [0xF4292244, 0x432AFF97, 0xAB9423A7, 0xFC93A039, 0x655B59C3, 0x8F0CCC92, 0xFFEFF47D, 0x85845DD1, 0x6FA87E4F, 0xFE2CE6E0, 0xA3014314, 0x4E0811A1, 0xF7537E82, 0xBD3AF235, 0x2AD7D2BB, 0xEB86D391]]

ROLStep = [[7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22], 
           [5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20], 
           [4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23], 
           [6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21]]

# Logic Functions
f = lambda b, c, d : (b & c) | ((~b) & d)
g = lambda b, c, d : (b & d) | (c & (~d))
h = lambda b, c, d : b ^ c ^ d
i = lambda b, c, d : c ^ (b | (~d))
rho_2 = lambda i : (1 + 5 * (i)) % 16
rho_3 = lambda i : (5 + 3 * (i)) % 16
rho_4 = lambda i : (7 * (i)) % 16

def ROLs(x, y):
    x, y = int(x), int(y)
    mask1 = (1 << y) - 1
    return ((x >> (32 - y)) & mask1) | ((x << y) & ~mask1)

# Compress Hash Functions
def FF(a, b, c, d, M, s):
    # print("%x"%a, "%x"%b, "%x"%c, "%x"%d, "%x"%M, s, "%x"%((f(b, c, d)) % (2 ** 32)))
    a = (b + ROLs((a + f(b, c, d) + M + T[0][s]) % (2 ** 32), ROLStep[0][s])) % (2 ** 32)
    return d, a, b, c
    
def GG(a, b, c, d, M, s):
    # print("%x"%a, "%x"%b, "%x"%c, "%x"%d, "%x"%M, s, "%x"%((g(b, c, d)) % (2 ** 32)))
    a = (b + ROLs((a + g(b, c, d) + M + T[1][s]) % (2 ** 32), ROLStep[1][s])) % (2 ** 32)
    return d, a, b, c
    
def HH(a, b, c, d, M, s):
    # print("%x"%a, "%x"%b, "%x"%c, "%x"%d, "%x"%M, s, "%x"%((h(b, c, d)) % (2 ** 32)))
    a = (b + ROLs((a + h(b, c, d) + M + T[2][s]) % (2 ** 32), ROLStep[2][s])) % (2 ** 32)
    return d, a, b, c
    
def II(a, b, c, d, M, s):
    # print("%x"%a, "%x"%b, "%x"%c, "%x"%d, "%x"%M, s, "%x"%((i(b, c, d)) % (2 ** 32)))
    a = (b + ROLs((a + i(b, c, d) + M + T[3][s]) % (2 ** 32), ROLStep[3][s])) % (2 ** 32)
    return d, a, b, c

# Read 32bit Litte Endian From y to x
def load32L(y):
    # print(y)
    x = (((ord(y[3]) & 255) << 24) + ((ord(y[2]) & 255) << 16) + ((ord(y[1]) & 255) << 8) + (ord(y[0]) & 255))
    return x

# Store 32bit Little Endian From x to y
def store32L(x):
    y = [""] * 4
    y[0] = chr(x & 255)
    y[1] = chr((x>>8) & 255)
    y[2] = chr((x>>16) & 255)
    y[3] = chr((x>>24) & 255)
    return "".join(y)

def gen64LS(x):
    x, y = int(x), ""
    y += chr(x & 255)
    y += chr((x>>8) & 255)
    y += chr((x>>16) & 255)
    y += chr((x>>24) & 255)
    y += chr((x>>32) & 255)
    y += chr((x>>40) & 255)
    y += chr((x>>48) & 255)
    y += chr((x>>56) & 255)
    return y

def compressMD5(msg, a, b, c, d):
    for i in range(int(len(msg) / 64)):
        aa, bb, cc, dd = a, b, c, d
        s = msg[64 * i : 64 * (i + 1)]
        w = [0] * 16
        for j in range(16):
            w[j] = load32L(s[4 * j: 4 * (j + 1)])
        for j in range(16):
            # print("%x"%a, "%x"%b, "%x"%c, "%x"%d, "%x"%w[j])
            a, b, c, d = FF(a, b, c, d, w[j], j)
        for j in range(16):
            # print("%x"%a, "%x"%b, "%x"%c, "%x"%d, "%x"%w[rho_2(j)])
            a, b, c, d = GG(a, b, c, d, w[rho_2(j)], j)
        for j in range(16):
            # print("%x"%a, "%x"%b, "%x"%c, "%x"%d, "%x"%w[rho_3(j)])
            a, b, c, d = HH(a, b, c, d, w[rho_3(j)], j)
        for j in range(16):
            # print("%x"%a, "%x"%b, "%x"%c, "%x"%d, "%x"%w[rho_4(j)])
            a, b, c, d = II(a, b, c, d, w[rho_4(j)], j)
        
        # a, b, c, d = (a + aa) & 0xFFFFFFFF, (b + bb) & 0xFFFFFFFF, (c + cc) & 0xFFFFFFFF, (d + dd) & 0xFFFFFFFF
        a, b, c, d = a + aa, b + bb, c + cc, d + dd
    return a, b, c, d

def hexDigest(hexNum):
    s = ""
    s += "%0.2x"%(hexNum & 255)
    s += "%0.2x"%((hexNum >> 8) & 255)
    s += "%0.2x"%((hexNum >> 16) & 255)
    s += "%0.2x"%((hexNum >> 24) & 255)
    return s

def hashMD5(msg):
    a, b, c, d = 0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476
    msg = str(msg)
    strlen, endLen = len(msg), len(msg) % 64
    segments = []
    msg += chr(0x80)
    endLen += 1
    fill = 0

    while endLen > 56:
        while endLen < 64:
            msg += chr(fill)
            endLen = (endLen + 1) % 64
            # print("endLen =", endLen, "filled =", chr(fill), "Msg =", msg)
        endLen = 0

    while endLen < 56:
        msg += chr(fill)
        endLen = (endLen + 1) % 64

    msg = msg + gen64LS(strlen * 8)
    a, b, c, d = compressMD5(msg, a, b, c, d)
    # print(hex(a), hex(b), hex(c), hex(d))

    output = hexDigest(a) + hexDigest(b) + hexDigest(c) + hexDigest(d)

    return output

# Main Program
if __name__ == "__main__":
    message = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!#@$%^&*()'

    print("Original:", message)
    print("My MD5 Hash     :", hashMD5(message.encode("UTF-8").decode("UTF-8")))
    print("HashLib MD5 Hash:", hashlib.md5(message.encode("UTF-8")).hexdigest())
