"
See [Advent of Code 2016 part11](https://adventofcode.com/2016/day/11).

"
Class {
	#name : #Y2016Day11,
	#superclass : #Object,
	#instVars : [
		'code',
		'currentCost',
		'estimatedCost'
	],
	#classVars : [
		'Goal',
		'Kinds',
		'NumberOfObjects',
		'Width'
	],
	#category : #'Advent-of-Code-2016-day11'
}

{ #category : #accessing }
Y2016Day11 class >> goal [

	^ Goal
]

{ #category : #accessing }
Y2016Day11 class >> kinds [

	^ Kinds
]

{ #category : #accessing }
Y2016Day11 class >> numberOfObjects [

	^ NumberOfObjects
]

{ #category : #'instance creation' }
Y2016Day11 class >> part1 [
|solver|
	self setKinds: 5.
	solver := self new.
	solver  represents: { 0. 0. 0. 0. 1. 2. 1. 1. 1. 1 }.
	^solver cost
]

{ #category : #'instance creation' }
Y2016Day11 class >> part2 [
	"Y2016Day11 part2 >>> 61"

	| solver |
	self setKinds: 7.
	solver := self new.
	solver represents: { 0. 0. 0. 0. 1. 2. 1. 1. 1. 1. 0. 0. 0. 0 }.
	^ solver cost
]

{ #category : #initialization }
Y2016Day11 class >> setKinds: k [

	Kinds := k.
	"
	Generator and Microchip, and Elevator
	"
	Width := k * 2 + 1.
	NumberOfObjects := k * 2 + 1.
	Goal := 4 ** NumberOfObjects - 1
]

{ #category : #comparing }
Y2016Day11 >> <= other [
	^ estimatedCost <= other estimatedCost 
]

{ #category : #enumerating }
Y2016Day11 >> adjacentFloors [

	^ #( #( 1 ) #( 0 2 ) #( 1 3 ) #( 2 ) ) at: self floorOfElevator + 1

]

{ #category : #enumerating }
Y2016Day11 >> allObjectPairsOn: floor do: aBlock [
	"all but elevator"

	| indices numSelected |
	indices := (2 to: self class numberOfObjects) select: [ :i |
		           (self floorOfObject: i) = floor ].
	numSelected := indices size.
	^ indices doWithIndex: [ :object :n | 
		  n to: numSelected do: [ :i |
		  aBlock value: object value: (indices at: i) ] ]
]

{ #category : #accessing }
Y2016Day11 >> code [

	^ code
]

{ #category : #accessing }
Y2016Day11 >> code: anObject [

	code := anObject
]

{ #category : #evaluating }
Y2016Day11 >> cost [
"The main search code"
	| visited toCheck |
	visited := IdentitySet with: self code.
	toCheck := Heap with: self.
	toCheck untilEmpty: [ :state |
		state isGoal ifTrue: [ ^ state currentCost ].
		state neighborStates
			reject: [ :cand | visited includes: cand code ]
			thenDo: [ :s |
				visited add: s code.
				toCheck add: s ] ].
	self error: 'wrong calculation'
]

{ #category : #accessing }
Y2016Day11 >> currentCost [

	^ currentCost
]

{ #category : #accessing }
Y2016Day11 >> currentCost: anObject [
| g c |
	currentCost := anObject.
	"
	And update the estimated cost too
	"
	g  := 0.
	c := 0.
	1 to: self class kinds do: [ :kind |
		g := g + 3 - (self floorOfGenerator: kind).
		c := c + 3 - (self floorOfChip: kind). ].
	estimatedCost := currentCost + g +(c * 2).
]

{ #category : #accessing }
Y2016Day11 >> estimatedCost [

	^ estimatedCost
]

{ #category : #accessing }
Y2016Day11 >> estimatedCost: anObject [

	estimatedCost := anObject
]

{ #category : #accessing }
Y2016Day11 >> floorOfChip: kind [

	^ self floorOfObject: (self objectIndexOfChip: kind)
]

{ #category : #accessing }
Y2016Day11 >> floorOfElevator [

	^ self floorOfObject: 1
]

{ #category : #accessing }
Y2016Day11 >> floorOfElevator: aFloor [

	^ self floorOfObject: 1 to: aFloor 
]

{ #category : #accessing }
Y2016Day11 >> floorOfGenerator: kind [

	^ self floorOfObject: (self objectIndexOfGenerator: kind)
]

{ #category : #accessing }
Y2016Day11 >> floorOfObject: anObject [

	| mask result |
	mask := self class numberOfObjects - anObject * 2.
	mask := 2 << mask.
	result := ((code bitAnd: mask) > 0) asInteger * 2.
	mask := mask >> 1.
	^ ((code bitAnd: mask) > 0) asInteger + result

]

{ #category : #update }
Y2016Day11 >> floorOfObject: anObject to: floor [

	| mask  |
	mask := self class numberOfObjects - anObject * 2.
	mask := 2 << mask.
      code := code bitClear: mask.
floor > 1 ifTrue: [ code := code bitOr: mask ].
	mask := mask >> 1.
	code := code bitClear: mask.
	floor odd ifTrue: [ code := code bitOr: mask ]
]

{ #category : #enumerating }
Y2016Day11 >> forAllKinds: aBlock [

1 to: self class kinds do: aBlock 
]

{ #category : #testing }
Y2016Day11 >> ifSafe: aBlock [

	self isSafe ifTrue: [ aBlock value: self ]
]

{ #category : #initialization }
Y2016Day11 >> initialize [ 
super initialize .
code := 0.
currentCost := 0.
estimatedCost := 0.
]

{ #category : #testing }
Y2016Day11 >> isGoal [ 
^code = self class goal
]

{ #category : #testing }
Y2016Day11 >> isSafe [

	self forAllKinds: [ :k |
		| floor |
		floor := self floorOfChip: k.
		(self floorOfGenerator: k) = floor ifFalse: [
			self forAllKinds: [ :i |
				(self floorOfGenerator: i) = floor ifTrue: [ ^ false ] ] ] ].
	^ true
]

{ #category : #'instance creation' }
Y2016Day11 >> moveTo: floor with: anObjest and: anotherObject [
	"make a new instance"

	| state |
	state := self class new.
	state
		code: code;
		floorOfElevator: floor;
		floorOfObject: anObjest to: floor;
		floorOfObject: anotherObject to: floor;
		currentCost: currentCost + 1.
	^ state
]

{ #category : #enumerating }
Y2016Day11 >> neighborStates [
	"I must return a set without duplicated elements."

	| floor result |
	result := Set new.
	floor := self floorOfElevator.
	self allObjectPairsOn: floor do: [ :i :j |
		self adjacentFloors do: [ :f |
			| newState |
			newState := self moveTo: f with: i and: j.
			newState ifSafe: [ :s | result add: s ] ] ].
	^ result
]

{ #category : #accessing }
Y2016Day11 >> objectIndexOfChip: k [
^k * 2 + 1
]

{ #category : #accessing }
Y2016Day11 >> objectIndexOfGenerator: k [

	^ k * 2
]

{ #category : #initialization }
Y2016Day11 >> represents: aVec [

	code := aVec inject: 0 into: [ :total :val | total * 4 + val ].

]
