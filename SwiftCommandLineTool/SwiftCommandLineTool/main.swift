//
//  main.swift
//  swiftcommandlinetool
//
//  Created by Sarah Clark on 4/19/24.
//

import Foundation

print("Hello, Swift")
print()

// MARK: - if

print("=== IF ===")

if true {
    print("This is true")
}

print("=== IF ELSE ===")

var userIsLoggedIn = true
if userIsLoggedIn {
    print("Welcome")
} else {
    print("Please log in")
}

var name = "Bob"
if name.count < 4 {
    print("\(name) is a very short name")
} else {
    print("Good name.")
}

print("=== IF ELSE IF ===")

var score = 70
if score >= 100 {
    print("You've won")
} else if score > 80 {
    print("Nearly there...")
} else {
    print("Keep going")
}

print()

// MARK: - switch

print("=== SWITCH ===")

var grade = "B"
switch grade {
    case "A":
        print("Top of the class!")
    case "B":
        print("Excellent work.")
    case "C":
        print("Solid effort.")
    case "D":
        print("Try harder next time.")
    default:
        print("More effort needed.")
}

print()

// MARK: - loops

print("=== FOR ===")

for number in 1 ... 5 {
    print(number)
}

print("=== WHILE ===")

var counter = 0
while counter < 5 {
    print("Counter: \(counter)")
    counter += 1
}

print("=== REPEAT WHILE ===")

counter = 0
repeat {
    print("Counter: \(counter)")
    counter += 1
} while counter < 5

let toys = ["Andy", "Bo-peep", "Buzz", "Jessie", "Rex"]
for toy in toys {
    print(toy)
}

print()

// MARK: - functions

print("=== FUNCTION ===")

func showVersion() {
    print("swifty - version 1.0")
}
showVersion()

print("=== FUNCTION WITH INPUT ===")

func showVersion(versionNumber: Double) {
    print("swifty - version \(versionNumber)")
}
showVersion(versionNumber: 1.2)

print("=== FUNCTION WITH OUTPUT ===")

func getVersion() -> Double {
    return 1.3
}
let versionNumber = getVersion()
print("Version \(versionNumber)")

print("=== FUNCTION WITH INPUT & OUTPUT ===")

func areaOfCircle(radius: Double) -> Double {
    let area = Double.pi * radius * radius
    return area
}
let area = areaOfCircle(radius: 6)
print(area)

print()

// MARK: - optionals

print("=== UNWRAPPING OPTIONAL ===")

var mightBeNumber: Int? = 3
if let mightBeNumber {
    print(mightBeNumber)
} else {
    print("mightBeNumber is nil")
}

print("=== FORCE UNWRAPPING OPTIONAL ===")

var forcedString: String? = "This really is a string."
print(forcedString!)

print("=== GUARD LET ===")

func handlingOptionals(name: String?, age: Int?) {
    guard let name, let age else {
        print("One of the arguments is not valid")
        return
    }
    print("All input data is valid: \(name) & \(age)")
}

handlingOptionals(name: nil, age: nil)
handlingOptionals(name: "Swift", age: nil)
handlingOptionals(name: nil, age: 8)
handlingOptionals(name: "Swift", age: 8)
