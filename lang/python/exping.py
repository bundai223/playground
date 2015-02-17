#!/usr/bin/env python
# -*- coding: utf-8 -*-

import commands


def ping(dest):
    result = commands.getoutput("ping -c 5 {}".format(dest))
    lines = result.split("\n")
    length = len(lines)
    packetLoss = lines[length - 2].split()[6]
    rtt = lines[length - 1].split()[3].split("/")[1]
    return (dest, packetLoss, rtt)

dests = ["cisco.com", "google.com", "yahoo.com"]
for dest in dests:
    print(ping(dest))
