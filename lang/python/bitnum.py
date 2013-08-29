#! c:Python27/python.exe
# -*- coding: utf-8 -*-

import sys

if __name__ == "__main__":
    argv = sys.argv
    argc = len(argv)

    if argc < 2:
        print("no argment")
        sys.exit()

    num = 1
    bit = int(argv[1],10)
    for index in range(bit):
        num *= 2
#         print(str(index) + " : " + str(num))

    print(str(bit) + " : " + str(num))
