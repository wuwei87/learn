#!/usr/bin/env python3

import sys

filename = input("Please enter the flie path :")
f=open(filename)
num = 0
for i in f.readlines():
    num+=1
    if num ==2 :
        print(i)
        break
f.close()
