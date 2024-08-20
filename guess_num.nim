import std/rdstdin, std/strutils, std/random

randomize()

var 
    correct: bool = false
    attempts: int = 0
    guess: int = 0
    
let num = rand(1..10)


echo "The range is from: 1-10."
echo "You only have 5 attempts."
while correct != true and attempts != 5:
    echo "Guess the number: "

    let input: string = readLine(stdin)
    try:
        guess = parseInt(input)
        
        if guess > 10 or guess < 1:
            echo "[!] Number must be between 1-10" 
        elif guess == num:
            attempts += 1
            correct = true
            echo "[+] You guessed it right, the number is ", input, "."
            echo "Attempts: ", $attempts
        else:
            echo "Wrong, try again."
            attempts += 1
            echo "You have ", 5 - attempts, " attempts left."
    except ValueError:
        echo "[!] Please enter a valid interger."
        
if not correct:
    echo "[!] Sorry you have used all your attempts, the number was ", $num, "."    
