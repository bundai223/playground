#! /usr/local/bin/ruby
# coding: utf-8
require "curses"

Curses::init_screen
Curses::setpos(5, 2)
Curses::addstr("Cursesの世界にようこそ")
Curses::refresh
Curses::getch
Curses::close_screen

