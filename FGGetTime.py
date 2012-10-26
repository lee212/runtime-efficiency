import datetime
import sys
import re

print sys.argv
fname = sys.argv[1]
f = open(fname, 'r')
for line in f:
    print line
    matchObj = re.search(r'(.*) - (.*) - (.*) - (.*)TIME Image available:(.*)', line.rstrip(), re.M|re.I)
    if matchObj:
        print matchObj.group(1)
        print "0:"+ matchObj.group(2)
        b = datetime.strptime("2011-12-12 10:43:35,625", '%Y-%m-%d %H:%M:%S,%f')
