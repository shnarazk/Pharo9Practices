Class {
	#name : #LobbyStateTest,
	#superclass : #TestCase,
	#category : #'Advent-of-Code-Tests'
}

{ #category : #'creation tests' }
LobbyStateTest class >> aGoal [
| goal |
	goal := LobbyState newFrom: { 3 . 3 . 3 . 3 } asOrderedCollection.
	goal floor: 3.
	^goal 

]

{ #category : #'creation tests' }
LobbyStateTest class >> aStart [

	^ LobbyState newFrom: { 0. 0. 1. 1 } asOrderedCollection
]

{ #category : #tests }
LobbyStateTest >> testAdjacentStates [

	self assert: self class aStart isSafe.
	self assert: self class aGoal isSafe
]

{ #category : #tests }
LobbyStateTest >> testCost [

	| start state loc |
	loc := { 0 . 0 . 0 . 1 . 0 } asOrderedCollection.
	start := LobbyState newFrom: loc.
	state := start moveTo: 1 with: 1 and: 2.
	self assert: start estimatedCost < state estimatedCost
]

{ #category : #tests }
LobbyStateTest >> testEstimate [


	self assert: self class aGoal estimate equals: 0.
]

{ #category : #tests }
LobbyStateTest >> testGoalHasLowestEstimation [

	| goal |
	goal := LobbyState newFrom: { 3. 3. 3. 3. 3 } asOrderedCollection.
	self assert: goal estimate equals:  0
]

{ #category : #tests }
LobbyStateTest >> testIndex [

	| state res |
	res := self class aStart index.

	self assert: res equals: 5.
state := LobbyState newFrom: { 0 . 0 . 0 . 0 } at: 0.
	self assert: state index equals: 0.
	state := LobbyState newFrom: { 1 } at: 1.
	self assert: state index equals: 5
]

{ #category : #tests }
LobbyStateTest >> testIndexesOfMovableObjects [

	| start ret |
	start := self class aStart.
	ret := start indexesOfMovableObjects.

	self assert: ret size equals: 2
]

{ #category : #tests }
LobbyStateTest >> testInitialization [

	| s1 s2 |
	s1 := LobbyState newFrom: OrderedCollection  new.
	s2 := LobbyState newFrom: OrderedCollection  new.
	self assert: s1 estimatedCost equals: 0
]

{ #category : #tests }
LobbyStateTest >> testIsGoal [

self assert: (self class aStart isGoal) equals: false.
self assert: (self class aGoal isGoal) equals: true.
]

{ #category : #tests }
LobbyStateTest >> testIsSafe [

	"self assert: self class aStart isSafe equals: true."

	"self assert: self class aGoal isSafe equals: true."

	self
		assert: (LobbyState newFrom: { 0. 1. 1. 0 }) isSafe
		equals: false
]

{ #category : #tests }
LobbyStateTest >> testMovableObjectPairs [

	| start ret |
	start := self class aStart.
	ret := start movableObjectPairs.
	self assert: ret size equals: 3
]

{ #category : #tests }
LobbyStateTest >> testStateOrder [

	| s1 s2 |
	s1 := LobbyState newFrom: OrderedCollection new.
	s2 := LobbyState newFrom: OrderedCollection new.
	s2 estimatedCost: 1.
	self assert: s1 <= s2
]
