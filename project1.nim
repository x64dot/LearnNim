import std/rdstdin, std/strutils

let best_fruits: array[5, string] = ["pineapple","apple", "grape", "mango", "strawberry"]

stdout.write("Guess one of my favorite fruits: ")
var input: string = readLine(stdin)
input = toLowerAscii(input);

var found: bool = false

for fruit in best_fruits:
    if input == fruit:
        found = true 
        break
        
if found:
    echo ("You got it correct!")
else:
    echo ("You got it wrong!")

