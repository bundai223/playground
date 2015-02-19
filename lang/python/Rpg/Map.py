#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from fieldObj import fieldObj


class Res():
    WALL_VERTICAL = "|"
    WALL_HORIZONTAL = "-"
    WALL_CORNER = "+"
    SPACE = " "


class Map(fieldObj):
    CORNER = 2
    WALL = 1
    SPACE = 0

    mapWidth = 0
    mapHeight = 0
    mapGrid = []

    def __init__(self, width, height):
        super(Map, self).__init__()

        self.mapWidth = width
        self.mapHeight = height
        self.mapGrid = []
        for y in range(height + 2):
            row = []
            for x in range(width + 2):
                if (y == 0 or y == height + 1) and\
                   (x == 0 or x == width + 1):
                    row.append(Map.CORNER)
                elif (y == 0 or y == height + 1) or \
                     (x == 0 or x == width + 1):
                    row.append(Map.WALL)
                else:
                    row.append(Map.SPACE)

            self.mapGrid.append(row)

    def update(self):
        pass

    def render(self):
        for gridRow in self.mapGrid:
            rowStr = ""
            for grid in gridRow:
                gridChr = Res.SPACE
                if grid == Map.CORNER:
                    gridChr = Res.WALL_CORNER
                elif grid == Map.WALL:
                    if grid is gridRow[0] or grid is gridRow[-1]:
                        gridChr = Res.WALL_VERTICAL
                    else:
                        gridChr = Res.WALL_HORIZONTAL
                rowStr = rowStr + gridChr

            print(rowStr)
