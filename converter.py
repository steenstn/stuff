import sys

def printInfo():
    print("""
    Converter
    ---------
    Converts a number between different systems.

    Usage: convert ab x
           convert b x
    a/b is one of [hbd] for hexadecimal, decimal or binary
    x is the number to convert

    Example:
    Convert 15 from hexadecimal to decimal:
    convert hd 15

    If the first parameter only has one character it assumes converting from decimal
    convert h 15 - Convert 15 to hexadecimal
    """)

if len(sys.argv) == 1:
    printInfo()
    quit()

if(len(sys.argv) != 3):
    print("Invalid number of parameters. Expected 2")
    quit()
input = sys.argv[1]
target = sys.argv[2]

convertFrom = "d"
convertTo = "d"

if len(input) == 1:
    convertFrom = "d"
    convertTo = input[0]
elif len(input) != 2:
    print("Invalid number of parameters in (" + input + "). Expected 1 or 2")
else:
    convertFrom = input[0]
    convertTo = input[1]

tempValue = 0
if convertFrom == 'h':
    tempValue = int(target, 16)

elif convertFrom == 'b':
    tempValue = int(target,2)
else:
    tempValue = int(target)

if convertTo == 'b':
    print(format(tempValue, "b"))
elif convertTo == 'h':
    print(hex(tempValue))
else:
    print(tempValue)
