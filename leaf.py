#!/usr/bin/python3
from turtle import *
from random import *
from decimal import *
def diedai(x,y):
    k = randint(1,100)
    if  k<=1:
        x1 = 0.0
        y1 = 0.16*y
    elif k<=8:
        x1 = 0.20*x - 0.26*y
        y1 = 0.23*x +0.22*y+0.160
    elif k<=15:
        x1 = -0.15*x + 0.28*y
        y1 = 0.26*x + 0.24*y + 0.44
    else:
        x1 =  0.85*x +0.04*y
        y1 =  -0.04*x + 0.85*y + 0.160
    return x1,y1
def point(x,y):
    penup()
    goto(1000*x,1000*y-500)
    pendown()
    circle(0,1)
def main():
    tracer(False)
    setup(1200,1000)
    pensize(5)
    pencolor("green")
    x,y = 0.0000,0.0000
    getcontext().prec=10
    for i in range(9000):
        x1,y1=diedai(x,y)
        x,y = x1,y1
        point(x1,y1)
main()
done()
