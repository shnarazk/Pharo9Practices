"
A Y2016Day18Test is a test class for testing the behavior of Y2016Day18
"
Class {
	#name : #Y2016Day18Test,
	#superclass : #TestCase,
	#category : #'Advent-of-Code-2016-Tests-day18'
}

{ #category : #running }
Y2016Day18Test >> setUp [

	super setUp.
	Y2016Day18 input: '.^^^^^.^^.^^^.^...^..^^.^.^..^^^^^^^^^^..^...^^.^..^^^^..^^^^...^.^.^^^^^^^^....^..^^^^^^.^^^.^^^.^^'
]

{ #category : #tests }
Y2016Day18Test >> testPart1 [

	self assert: Y2016Day18 part1 equals: 1989
]

{ #category : #tests }
Y2016Day18Test >> testPart2 [

	self assert: Y2016Day18 part2 equals: 19999894
]
