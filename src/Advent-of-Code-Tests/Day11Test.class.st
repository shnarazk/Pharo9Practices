Class {
	#name : #Day11Test,
	#superclass : #TestCase,
	#category : #'Advent-of-Code-Tests'
}

{ #category : #tests }
Day11Test >> testCostToGoal [

	| example cost |
	example := LobbyState newFrom: { 1. 0. 2. 0 }.
	cost := Day11 start: example.
	self assert: cost equals: 11
]
