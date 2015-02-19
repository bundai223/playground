#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from fieldObj import fieldObj


class Player(fieldObj):
    posX = 0
    posY = 0

    dirX = 0
    dirY = 0

    def __init__(self, x, y):
        super(Player, self).__init__()

        self.posX = x
        self.posY = y

    def update(self):
        input()

    def move(self, dirx, diry):
        pass

    def render(self):
        pass
