//
//  Solutions.swift
//  
//
//  Created by Ali Mantaev on 2021-11-13.
//

//----- Strings -----//

// 1. Write a function that takes input of type String and returns true if the letters of the string are unique. Note that the function should be case-sensitive (i.e A does not equal to a).
func challengeUnqiueString2(input: String) -> Bool {
    let uniqueCharacters: Set<Character> = Set(input)
    return uniqueCharacters.count == input.count
}

// 2. Write a function that returns true if the input string is read the same forwards as backwards ignoring case.
func challengePalindrome(input: String) -> Bool {
    // racecar -> true, madam -> true, pie -> false
    let lowercase = input.lowercased()
    return lowercase.reversed() == Array(lowercase)
}

// 3. Write a function that accepts two String parameters and returns true if they contain the same letters in any order taking into account letter case
func challengeSameLetters(s1: String, s2: String) -> Bool {
    // abcd, dcba -> true, abc, cbAa -> false
    // convert input strings to their canoncial forms (i.e most basic forms)
    return s1.sorted() == s2.sorted()
}

// 5. Write a program that retruns the total number of occurrences of a character in a string.
func challengeCount(input: String, c: Character) -> Int {
    // input: "The rain in Spain", character: "a" -> 2
    var count: Int = 0
    for character in input {
        if character == c {count += 1}
    }
    return count
}

// 6. Write a function that removes duplicate letters of a given string.
func challengeRemoveDuplicates(input: String) -> String {
    var result: String = ""
    for character in input {
        if !result.contains(character) {
            result.append(character)
        }
    }
    return result
}

// 7. Write a function that replaces any consecutive whitespaces with a single space.
func challengeCondenseWhitespace(input: String) -> String {
    // [space][space][space]a -> [space]a
    var result: String = String()
    var seenSpace: Bool = false
    
    for character in input {
        if character == " " {
            if seenSpace { continue } else { seenSpace = true }
        } else {
            seenSpace = false
        }
        
        result.append(character)
    }
    return result
}

//----- Numbers -----//

// 16. Write a program that counts from 1 to 100 and prints out "Fizz" if the count is evenly divisble 3, "Buzz" if the count is evenly divisble by 5, and "Fizz Buzz" if the count is evenly divisible by 3 and 5. For all other cases, print the count number.
func challengeFizzBuzz() -> Void {
    for count in 1...100 {
        if count % 3 == 0 {
            if count % 5 == 0 {
                print("Fizz Buzz")
            } else {
                print("Fizz")
            }
        } else if count % 5 == 0 {
            print("Buzz")
        } else {
            print(count)
        }
    }
}

// 17. Write a program that generates a random number between given minimum and maximum values of a range (inclusive).
func challengeRandomNumber(min: Int, max: Int) -> Int {
    Int(arc4random_uniform(UInt32(max - min + 1))) + min
}

//----- Collections -----//

// 37. Write an extension for a collection of integers that returns the number of times a specific digit appears in all of its elements.
extension Collection where Iterator.Element == Int {
    func digitCount(_ count: Character) -> Int {
        var result = 0
        // loop though the digits of each number and increae the count if digit is equal to the count
        for number in self {
            let string = String(number)
            for digit in string {
                if digit == count { result += 1 }
            }
        }
        return result
    }
}
