"
A Y2016Day16Test is a test class for testing the behavior of Y2016Day16
"
Class {
	#name : #Y2016Day16Test,
	#superclass : #TestCase,
	#category : #'Advent-of-Code-2016-Tests-day16'
}

{ #category : #tests }
Y2016Day16Test >> testExample [

	self assert: Y2016Day16 example equals: '01100'
]

{ #category : #tests }
Y2016Day16Test >> testPart1 [

	self assert: Y2016Day16 part1 equals: '10010101010011101'
]

{ #category : #tests }
Y2016Day16Test >> testPart2 [

	self assert: Y2016Day16 part2 equals: '01100111101101111'
]

{ #category : #tests }
Y2016Day16Test >> testToString [

	| v |
	v := '0011001'.
	self assert: (Y2016Day16 new: v) toString equals: v
]
