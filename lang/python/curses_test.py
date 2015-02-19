#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import curses
import time


def main(sc):
    sc.nodelay(1)

    while True:
        sc.addstr(1, 1, time.strftime("%H:%M:%S"))
        sc.refresh()

        key = sc.getch()
        if key == ord('q'):
            break
        elif key < 0:
            time.sleep(1)


if __name__ == '__main__':
    curses.wrapper(main)
