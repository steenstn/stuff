import sys
print(sys.argv[0])
input = sys.argv[1]
target = sys.argv[2]
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
