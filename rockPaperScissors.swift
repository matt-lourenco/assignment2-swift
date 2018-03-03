//
//  rockPaperScissors.swift
//  This program allows the user to play a game of rock paper scissors
//
//  Created by Matthew Lourenco on 02/03/18.
//  Copyright © 2018 MTHS. All rights reserved.
//

import Foundation

enum Choices: String {
	case ROCK = "ROCK"
	case PAPER = "PAPER"
	case SCISSORS = "SCISSORS"

	func getValues()->[String] {
		//organize the values into an array
		return ["ROCK", "PAPER", "SCISSORS"]
	}

	func inValues(value: String)->Bool {
		//check if inputted value is an option
		for item in getValues() {
			if item == value {
				return true
			}
		}
		return false
	}

	func findWinner(user: Choices, computer: Choices)->String{
		//Finds the winner
		if user==computer {
			return "Tie!"
		} else if user == .ROCK && computer == .SCISSORS {
			return "You won!"
		} else if user == .PAPER && computer == .ROCK {
			return "You won!"
		} else if user == .SCISSORS && computer == .PAPER {
			return "You won!"
		} else {
			return "You lost."
		}
	}
}

var input: String?
var userChoice: Choices = Choices.ROCK

//Get the user's choice
while true {
	print("Choose \"rock,\" \"paper,\" or \"scissors\" by typing it on your keyboard: ")
    input = readLine(strippingNewline: true)
	if input! != nil && userChoice.inValues(value: input!.uppercased()) {
		userChoice = Choices(rawValue: input!.uppercased())!
		break
	} else {
		print("Please choose \"rock,\" \"paper,\" or \"scissors\"")
	}
}

//Generate computer's choice
srand(UInt32(time(nil)))
var referenceValue: String = userChoice.getValues()[Int(random()%(3))]
var computerChoice: Choices = Choices(rawValue: referenceValue)!

//Print results
print("Computer: \(computerChoice)\nUser: \(userChoice)")
print(userChoice.findWinner(user: userChoice, computer: computerChoice))