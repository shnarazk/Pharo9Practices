"
A Y2016Day13Test is a test class for testing the behavior of Y2016Day13
"
Class {
	#name : #Y2016Day13Test,
	#superclass : #TestCase,
	#category : #'Advent-of-Code-2016-Tests-day13'
}

{ #category : #tests }
Y2016Day13Test >> testPart1 [ 

self assert: Y2016Day13 part1 equals: 86
]

{ #category : #tests }
Y2016Day13Test >> testPart2 [

	self assert: Y2016Day13 part2 equals: 127
]
