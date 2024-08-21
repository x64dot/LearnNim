import std/strutils, std/rdstdin, std/random

randomize() 

let
    low_alphabet: string = "abcdefghijklmnopqrstuvwxyz"
    up_alphabet: string =  "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    special: string  = "!=<>'@#$%^&*()[\\],.;:-_/+?{|}`~"
    numbers: string = "0123456789"

proc low_security(): string = 
    var 
        new_password: string 
    let
        len1: int = low_alphabet.len
        len2: int = up_alphabet.len
    
    while true:
        let r1 = rand(1..2)

        if new_password.len == 10:
            return new_password

        if r1 == 1:
            let r2 = rand(len1)
            if r2 >= 0 and r2 < len1:
                new_password.add(low_alphabet[r2])          
        elif r1 == 2:
            let r3 = rand(len2)
            if r3 >= 0 and r3 < len2:
                new_password.add(up_alphabet[r3])                   
        
proc medium_security(): string = 
    var
        new_password: string 
    let
        len1: int = low_alphabet.len
        len2: int = up_alphabet.len 
        len3: int = numbers.len
    
    while true:
        let r1 = rand(1..3)

        if new_password.len == 14:
            return new_password

        if r1 == 1:
            let r2 = rand(len1)
            if r2 >= 0 and r2 < len1:
                new_password.add(low_alphabet[r2])          
        elif r1 == 2:
            let r3 = rand(len2)
            if r3 >= 0 and r3 < len2:
                new_password.add(up_alphabet[r3]) 
        elif r1 == 3:
            let r4 = rand(len3)
            if r4 >= 0 and r4 < len3:
                new_password.add(numbers[r4])

proc high_security(): string = 
    var
        new_password: string 
    let
        len1: int = low_alphabet.len
        len2: int = up_alphabet.len 
        len3: int = numbers.len
        len4: int = special.len
    
    while true:
        let r1 = rand(1..4)

        if new_password.len == 18:
            return new_password

        if r1 == 1:
            let r2 = rand(len1)
            if r2 >= 0 and r2 < len1:
                new_password.add(low_alphabet[r2])          
        elif r1 == 2:
            let r3 = rand(len2)
            if r3 >= 0 and r3 < len2:
                new_password.add(up_alphabet[r3]) 
        elif r1 == 3:
            let r4 = rand(len3)
            if r4 >= 0 and r4 < len3:
                new_password.add(numbers[r4])  
        elif r1 == 4:
            let r5 = rand(len4) 
            if r5 >= 0 and r5 < len4:
                new_password.add(special[r5])   

proc save_to_file(file_name: string, password: string): bool =
    try:
        var save = open(file_name, fmWrite)
        defer: 
            save.close()

        save.write(password)
        return true

    except Exception as e:
        echo e.msg, " please try again."
        return false

proc menu(): void =
    let symbol: char = '*'
    let line: string = symbol.repeat(30)

    echo line
    echo "x64dot password generator\n"
    echo "1. (Enter \"generate low\") To generate a basic password (low_security)"
    echo "2. (Enter \"generate medium\") to generate a strongish password (medium_security)"
    echo "3. (Enter \"generate high\") to generate a strong password (high_security)"
    echo "4. (Enter \"help\") to show this menu again"
    echo line

var 
    keep_going: bool = true
    not_empty: bool = false
    
var menu_input, input1: string
    
menu()

while keep_going != false: 
    if not_empty:
        not_empty = false

    stdout.write "Input >> "
    menu_input = readLine(stdin)
    menu_input = toLowerAscii(menu_input)

    case menu_input:
        of "generate low":
            var generated_password: string = low_security()
            generated_password.add('\n')

            echo "Generated password is: ", generated_password
            
            input1 = toLowerAscii(input1)
            while not_empty != true:
                stdout.write "Do you want to save the password in a file? (y/n): " 
                input1 = readLine(stdin)

                input1 = toLowerAscii(input1)                

                if input1 == "y":
                    stdout.write "Enter file name: "
                    let file_name: string = readLine(stdin)

                    if isEmptyOrWhitespace(file_name):
                        echo "File name cannot be empty!"

                    else:
                        if save_to_file(file_name, generated_password):
                            echo "Password was saved to ", file_name
                            not_empty = true
                elif input1 == "n":
                    not_empty = true
                else:
                    echo "Invalid input."

        of "generate medium":
            var generated_password: string = medium_security()
            generated_password.add('\n')

            echo "Generated password is: ", generated_password
            
            input1 = toLowerAscii(input1)
            while not_empty != true:
                stdout.write "Do you want to save the password in a file? (y/n): " 
                input1 = readLine(stdin)

                input1 = toLowerAscii(input1)                

                if input1 == "y":
                    stdout.write "Enter file name: "
                    let file_name: string = readLine(stdin)

                    if isEmptyOrWhitespace(file_name):
                        echo "File name cannot be empty!"

                    else:
                        if save_to_file(file_name, generated_password):
                            echo "Password was saved to ", file_name
                            not_empty = true
                elif input1 == "n":
                    not_empty = true
                else:
                    echo "Invalid input."

        of "generate high":
            var generated_password: string = high_security()
            generated_password.add('\n')

            echo "Generated password is: ", generated_password

            input1 = toLowerAscii(input1)
            while not_empty != true:
                stdout.write "Do you want to save the password in a file? (y/n): " 
                input1 = readLine(stdin)

                input1 = toLowerAscii(input1)                

                if input1 == "y":
                    stdout.write "Enter file name: "
                    let file_name: string = readLine(stdin)

                    if isEmptyOrWhitespace(file_name):
                        echo "File name cannot be empty!"

                    else:
                        if save_to_file(file_name, generated_password):
                            echo "Password was saved to ", file_name
                            not_empty = true
                elif input1 == "n":
                    not_empty = true
                else:
                    echo "Invalid input."

        of "help":
            menu()

        of "exit":
            echo "Thank you for using x64dot password generator!"
            keep_going = false

        else:
            echo "Invalid input."
