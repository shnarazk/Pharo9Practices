"
A Y2016Day11Test is a test class for testing the behavior of Y2016Day11
"
Class {
	#name : #Y2016Day11Test,
	#superclass : #TestCase,
	#instVars : [
		'aStart',
		'aGoal',
		'example'
	],
	#category : #'Advent-of-Code-2016-Tests-day11'
}

{ #category : #running }
Y2016Day11Test >> setUp [
super setUp .

	Y2016Day11 setKinds: 2.
	aStart := Y2016Day11 new.
	aGoal := Y2016Day11 new initializeAs: 1023.
	example := Y2016Day11 represents: { 1. 0. 2. 0 }
]

{ #category : #tests }
Y2016Day11Test >> testAdjacentFloors [
	self
		assert:
			{1}
		equals: aStart adjacentFloors.
	self
		assert:
			{2}
		equals: aGoal adjacentFloors.
	example floorOfElevator: 1.
	self
		assert:
			{0. 2}
		equals: example adjacentFloors.
]

{ #category : #tests }
Y2016Day11Test >> testFloorOfElevator [
	example floorOfElevator: 3.
	self
		assert: 3
		equals: example floorOfElevator.
	example floorOfElevator: 1.
	self
		assert: 1
		equals: example floorOfElevator.
	example floorOfElevator: 2.
	self
		assert: 2
		equals: example floorOfElevator.
]

{ #category : #tests }
Y2016Day11Test >> testFloorOfObject [
	self
		assert: 0
		equals: (example floorOfObject: 1).
	self
		assert: 1
		equals: (example floorOfObject: 2).
	self
		assert: 0
		equals: (example floorOfObject: 3).
	self
		assert: 2
		equals: (example floorOfObject: 4).
	self
		assert: 0
		equals: (example floorOfObject: 5).
	self
		assert: 1
		equals: (example floorOfObject: (example objectIndexOfGenerator: 1)).
	self
		assert: 0
		equals: (example floorOfObject: (example objectIndexOfChip: 1)).
	self
		assert: 2
		equals: (example floorOfObject: (example objectIndexOfGenerator: 2)).
	self
		assert: 0
		equals: (example floorOfObject: (example objectIndexOfChip: 2)).
	self assert: 3 equals: (aGoal floorOfObject: 1).
]

{ #category : #tests }
Y2016Day11Test >> testFloorOfObjectTo [
	example
		floorOfObject: 2
		to: 3.
	self assert: 3 equals: (example floorOfObject: 2).
	example
		floorOfObject: 3
		to: 2.
	self assert: 2 equals: (example floorOfObject: 3).
	example
		floorOfObject: 4
		to: 1.
	self assert: 1 equals: (example floorOfObject: 4).
	example
		floorOfObject: 5
		to: 0.
	self assert: 0 equals: (example floorOfObject: 5).
]

{ #category : #tests }
Y2016Day11Test >> testIsSafe [
	self
		assert: true
		equals: aStart isSafe.
	self
		assert: true
		equals: aGoal isSafe.
	self
		assert: true
		equals: example isSafe.
]

{ #category : #tests }
Y2016Day11Test >> testPart1 [ 

self assert: Y2016Day11 part1 equals: 37
]

{ #category : #tests }
Y2016Day11Test >> testPart2 [

	self assert: Y2016Day11 part2 equals: 61
]
