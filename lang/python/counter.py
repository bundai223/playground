#!/usr/bin/env python
# -*- coding: utf-8 -*-


class Counter():
    def __init__(self):
        self.clear()

    def clear(self):
        self.counter = 1

    def countup(self):
        self.counter += 1

    def getCount(self):
        return self.counter

counter = Counter()
print(str(counter.getCount()))
counter.countup()
counter.countup()
counter.countup()
counter.countup()
print(str(counter.getCount()))
counter.clear()
print(str(counter.getCount()))
