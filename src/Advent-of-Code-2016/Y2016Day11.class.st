"
Advent of Code 2016 part11.

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
Y2016Day11 class >> goal: anObject [

	Goal := anObject
]

{ #category : #accessing }
Y2016Day11 class >> kinds [

	^ Kinds
]

{ #category : #accessing }
Y2016Day11 class >> kinds: anObject [

	Kinds := anObject
]

{ #category : #'instance creation' }
Y2016Day11 class >> newAs: aCode [
| instance |
instance := self new. instance initializeAs: aCode.
^instance 
]

{ #category : #accessing }
Y2016Day11 class >> numberOfObjects [

	^ NumberOfObjects
]

{ #category : #accessing }
Y2016Day11 class >> numberOfObjects: anObject [

	NumberOfObjects := anObject
]

{ #category : #'instance creation' }
Y2016Day11 class >> part1 [


	self setKinds: 5.
	^(self represents: { 0. 0. 0. 0. 1. 2. 1. 1. 1. 1 }) cost

]

{ #category : #'instance creation' }
Y2016Day11 class >> part2 [
"Y2016Day11 part2 >>> 61"

	self setKinds: 7.
	^ (self represents: { 0. 0. 0. 0. 1. 2. 1. 1. 1. 1. 0. 0. 0. 0 })
		  cost
]

{ #category : #'instance creation' }
Y2016Day11 class >> represents: aVec [

| code |
code := aVec inject: 0 into: [ :total :val | (total * 4) + val ] .
^self newAs: code 
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

{ #category : #computing }
Y2016Day11 >> adjacentFloors [
	| floor |
	floor := self floorOfElevator.
	floor = 0 ifTrue: [ ^ {1} ].
	floor = 3 ifTrue: [ ^ {2} ].
	^ {floor - 1 . floor + 1}.
]

{ #category : #controlling }
Y2016Day11 >> allObjectPairsOn: floor do: aBlock [
	"all but elevator"
	| objects |
	objects := self class numberOfObjects .
	2
		to: objects
		do: [ :i |
			(self floorOfObject: i) = floor ifTrue: [
				i
					to: objects
					do: [ :j |
						(self floorOfObject: j) = floor ifTrue: [
							aBlock
								value: i
								value: j ]]]].
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

	| visited toCheck depth |
	depth := 0.
	visited := Set new.
	toCheck := Heap with: self.
	[ toCheck isEmpty ] whileFalse: [
		| state |
		state := toCheck removeFirst.
		state isGoal ifTrue: [ ^ state currentCost ].
		(visited includes: state code) ifFalse: [
			visited add: state code.
			depth := depth max: state currentCost.
			toCheck addAll: state neighborStates ] ].
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
mask := (self class numberOfObjects - anObject ) * 2.
mask := 2 << mask.
result := (code bitAnd: mask) > 0 ifTrue:  [2 ] ifFalse: [ 0 ].
mask := mask >> 1.
(code bitAnd: mask) > 0 ifTrue:  [^result + 1] ifFalse: [ ^result  ]
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

{ #category : #controlling }
Y2016Day11 >> forAllKinds: aBlock [

1 to: self class kinds do: aBlock 
]

{ #category : #evaluating }
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

{ #category : #evaluating }
Y2016Day11 >> isGoal [ 
^code = self class goal
]

{ #category : #evaluating }
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
	| state |
	state := self class new initializeAs: code.
	state floorOfElevator: floor.
	state
		floorOfObject: anObjest
		to: floor.
	state
		floorOfObject: anotherObject
		to: floor.
	state currentCost: self currentCost + 1.
	^ state.
]

{ #category : #evaluating }
Y2016Day11 >> neighborStates [
	"the main logic"
	| floor result |
	result := Set new.
	floor := self floorOfElevator.
	self
		allObjectPairsOn: floor
		do: [ :i :j |
			self adjacentFloors do: [ :f | | newState |
				newState := self
					moveTo: f
					with: i
					and: j.
				newState ifSafe: [ :s |
					result add: s ]]].
	^ result.
]

{ #category : #accessing }
Y2016Day11 >> objectIndexOfChip: k [
^k * 2 + 1
]

{ #category : #accessing }
Y2016Day11 >> objectIndexOfGenerator: k [

	^ k * 2
]
