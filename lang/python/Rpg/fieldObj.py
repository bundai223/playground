#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from abc import abstractmethod


class fieldObj():
    @abstractmethod
    def update(self):
        pass

    @abstractmethod
    def render(self):
        pass
