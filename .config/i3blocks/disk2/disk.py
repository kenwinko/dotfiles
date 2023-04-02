#!/usr/bin/python

import os
import sys

def disk(directory):
    diskStats = os.statvfs(directory)
    space = diskStats.f_bfree * diskStats.f_bsize / 1024 ** 3 
    print(f' {space:.{0}f}G')

if __name__ == '__main__':
    disk(sys.argv[1])
