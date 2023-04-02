"
A Y2016Day17Test is a test class for testing the behavior of Y2016Day17
"
Class {
	#name : #Y2016Day17Test,
	#superclass : #TestCase,
	#category : #'Advent-of-Code-2016-Tests-day17'
}

{ #category : #tests }
Y2016Day17Test >> testExample [

	self assert: Y2016Day17 example equals: 'DDUDRLRRUDRD'
]

{ #category : #tests }
Y2016Day17Test >> testNextKey [

	| target |
	target := Y2016Day17 new.
	Y2016Day17 input: 'hijkl'.

	self assert: target nextKey equals: 'ced9'.
	
target path: 'D'.
self assert: target nextKey equals: 'f2bc'.

]

{ #category : #tests }
Y2016Day17Test >> testPart1 [

	self assert: Y2016Day17 part1 equals: 'DUDDRLRRRD'
]

{ #category : #tests }
Y2016Day17Test >> testPart2 [

	self assert: Y2016Day17 part2 equals: 'gdjjyniy'
]
