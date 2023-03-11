#!/bin/python

import i3
import os
import sys

def readall(path):
    result = []
    with open(path) as f:
        for line in f:
            result.append(line.rstrip())
    return result

def parse(data):
    workspaces = [None] * 9
    for i in range(1, 10):
        ws = next(filter(lambda w : w['num'] == i, data), None)
        if not ws:
            workspaces[i - 1] = 0
        elif ws['focused']:
            workspaces[i - 1] = 1
        elif ws['urgent']:
            workspaces[i - 1] = 2
        else:
            workspaces[i - 1] = 3
    return workspaces

def mode():
    with open(os.path.expanduser('~/.config/polybar/active-mode')) as f:
        for line in f:
            return line.rstrip()

def sendhooks(old, new):
    for i in range(1, 10):
        if old[i - 1] != new[i - 1]:
            os.system('polybar-msg -p ' + (pids[i - 1] if mode() == 'laptop' else tabpids[i - 1]) +
                      ' action "#wsindicator-' + str(i) + '.hook.' + str(new[i - 1]) + '"')

def wsupdate(event, data, subscription):
    global workspaces
    newws = parse(data)
    sendhooks(workspaces, newws)
    workspaces = newws



pids = readall(os.path.expanduser('~/.config/polybar/pids/wss'))
tabpids = readall(os.path.expanduser('~/.config/polybar/pids/wss-tablet'))

workspaces = parse(i3.get_workspaces())

sendhooks([None] * 9, workspaces)
if len(sys.argv) > 1 and sys.argv[1] == 'single-shot':
    exit()

subscription = i3.Subscription(wsupdate, 'workspace')
