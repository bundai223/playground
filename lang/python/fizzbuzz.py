#!/usr/bin/env python
# -*- coding: utf-8 -*-


def fizzbuzz(n):
    if n % 15 == 0:
        return "fizz buzz"
    elif n % 3 == 0:
        return "fizz"
    elif n % 5 == 0:
        return "buzz"
    return str(n)

for n in range(1, 101):
    print fizzbuzz(n)
