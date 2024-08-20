import std/rdstdin, std/strutils

var my_seq: seq[float]
var sum: float = 0
echo "Enter sum to add all the numbers up"

while true:
    stdout.write("Enter a number: ")
    var input: string = readLine(stdin)
    
    if input == "sum":
        for num in my_seq:
            sum += num
        break
    else:
        try:
            var number: float = parseFloat(input)
            my_seq.add(number)
        except ValueError:
            echo "Enter a number or sum"

echo "Sum: ", sum
