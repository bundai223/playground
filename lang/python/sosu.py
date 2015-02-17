#!/usr/bin/env python
# -*- coding: utf-8 -*-


def isSosu(num):
    """ 素数かどうかの判定 """
    if num <= 1:
        return False
    elif num == 2:
        return True
    elif num % 2 == 0:
        return False

    # 2n + 1で自分より小さい奇数のみ割り切れるかのcheck
    rangemax = num / 2 - 1
    for n in range(2, rangemax):
        kisu = 2 * n + 1
        if num % kisu == 0:
            return False

    return True


def susu(start, end):
    """ 指定の数値の間の素数を計算して返す """
    list1 = []
    for num in range(start, end):
        if isSosu(num):
            list1.append(num)

    return list1


print susu(1, 10000)
