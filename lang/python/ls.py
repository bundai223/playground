#! /usr/bin/env python
# -*- coding: utf-8 -*-
import os


class ListFile:
    """ lsっぽいことを実行するためのクラス """

    def __init__(self, path):
        """ コンストラクタ """
        self.path = path

    def printDir(self):
        """ ディレクトリ内のファイル・ディレクトリを一覧で表示 """
        for fileName in os.listdir(self.path):
            print(fileName)
        for fileName in os.listdir(self.path):
            if os.path.isdir(fileName):
                lf = ListFile(os.path.abspath(fileName))
                lf.printDir()


print("[{}]".format(os.getcwd()))

lf = ListFile(os.getcwd())
lf.printDir()

