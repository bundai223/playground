#!/usr/bin/env python
# -*- coding: utf-8 -*-


def gusu(start, end):
    list1 = []
    for num in range(start, end):
        if num % 2 == 0:
            list1.append(num)

    return list1


print gusu(1, 100)
