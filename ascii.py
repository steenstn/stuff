import sys

def printInfo():
    print("""
Convert from to ASCII
Usage: python3 ascii.py 65
       python3 ascii.py A
    """)

if len(sys.argv) == 1:
    printInfo()
    quit()
if sys.argv[1].isdigit():
    print(chr(int(sys.argv[1])))
else:
    print(ord(sys.argv[1]))
