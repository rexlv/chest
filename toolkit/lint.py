#!/usr/bin/env python

import os
import re
import os.path

dir = "./"

pattern = re.compile(r"res*p, err :*= http\.[Post,Get]")
def cursor(path):
    def iterator(num=1):
        line = ""
        while num > 0:
            line = line + file.readline()
            if not line:
                return None
            line = line.strip().lstrip().rstrip()
            if len(line) == 0:
                continue
            num = num - 1
        return line
    file = open(path, 'r')
    return iterator

for parent, dirnames, filenames in os.walk(dir):
    for filename in filenames:
        filepath = os.path.join(parent, filename)
        ite = cursor(filepath)
        num = 0
        while 1:
            line = ite()
            if line is None:
                break
            num = num + 1
            match = re.search(pattern, line)
            if match is None:
                continue
            follow = ite(5)
            nPos = follow.find('Body.Close()')
            if nPos <= 0:
                print '{file}: {line}'.format(file=filepath,line=line)



