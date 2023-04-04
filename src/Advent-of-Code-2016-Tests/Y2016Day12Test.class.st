"
A Y2016Day12Test is a test class for testing the behavior of Y2016Day12
"
Class {
	#name : #Y2016Day12Test,
	#superclass : #TestCase,
	#category : #'Advent-of-Code-2016-Tests-day12'
}

{ #category : #tests }
Y2016Day12Test >> testPart1 [ 

self assert: Y2016Day12 part1 equals: 318003.
]

{ #category : #tests }
Y2016Day12Test >> testPart2 [

	self assert: Y2016Day12 part2 equals: 9227657
]
