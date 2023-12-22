import sys
if sys.argv[1].isdigit():
    print(chr(int(sys.argv[1])))
else:
    print(ord(sys.argv[1]))
