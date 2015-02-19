#!/usr/bin/env python
# -*- coding: utf-8 -*-
import random


class BingoMachine():
    numList = []

    def __init__(self, numMin, numMax):
        self.reset(numMin, numMax)

    def reset(self, numMin, numMax):
        self.numList = range(numMin, numMax + 1)

    def next(self):
        length = self.remain()
        if (length == 0):
            return -1
        index = int(random.uniform(0, length))
        return self.numList.pop(index)

    def remain(self):
        return len(self.numList)
