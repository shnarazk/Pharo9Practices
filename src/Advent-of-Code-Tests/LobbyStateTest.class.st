Class {
	#name : #LobbyStateTest,
	#superclass : #TestCase,
	#instVars : [
		'aStart',
		'aGoal'
	],
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

	self assert: aStart isSafe.
	self assert: aGoal isSafe
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

	self assert: aGoal estimate equals: 0
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
	res := aStart index.
	self assert: res equals: 5.
	state := LobbyState newFrom: { 0. 0. 0. 0 } at: 0.
	self assert: state index equals: 0.
	state := LobbyState newFrom: { 1 } at: 1.
	self assert: state index equals: 5
]

{ #category : #tests }
LobbyStateTest >> testIndexesOfMovableObjects [

	| ret |

	ret := aStart  indexesOfMovableObjects.
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

	self assert: aStart isGoal equals: false.
	self assert: aGoal isGoal equals: true
]

{ #category : #tests }
LobbyStateTest >> testIsSafe [

	self assert: aStart isSafe equals: true.
	self assert: aGoal isSafe equals: true.
	self
		assert: (LobbyState newFrom: { 0. 1. 1. 0 }) isSafe
		equals: false
]

{ #category : #tests }
LobbyStateTest >> testMovableObjectPairs [

	| ret |
	ret := aStart movableObjectPairs.
	self assert: ret size equals: 3
]

{ #category : #tests }
LobbyStateTest >> testPack [

| state |
state := LobbyState newFrom: { 1 . 0 . 3 . 2 }.
state pack; unpack.
self assert: state locations equals: { 1 . 0 . 3 . 2 }.
]

{ #category : #tests }
LobbyStateTest >> testStateOrder [

	| s1 s2 |
	s1 := LobbyState newFrom: OrderedCollection new.
	s2 := LobbyState newFrom: OrderedCollection new.
	s2 estimatedCost: 1.
	self assert: s1 <= s2
]
