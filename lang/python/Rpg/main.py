#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from Map import Map
from Player import Player


objList = []
objList.append(Map(10, 10))
objList.append(Player(0, 0))

while True:
    for obj in objList:
        obj.update()

    for obj in objList:
        obj.render()
