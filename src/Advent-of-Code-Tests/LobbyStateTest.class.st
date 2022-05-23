Class {
	#name : #LobbyStateTest,
	#superclass : #TestCase,
	#category : #'Advent-of-Code-Tests'
}

{ #category : #'creation tests' }
LobbyStateTest class >> aStart [
 ^ LobbyState newFrom: 		{ 0 . 0 . 0 . 1 . 1 } asOrderedCollection 
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
LobbyStateTest >> testGoalHasLowestEstimation [

	| goal |
	goal := LobbyState newFrom: { 3. 3. 3. 3. 3 } asOrderedCollection.
	self assert: goal estimate equals:  0
]

{ #category : #tests }
LobbyStateTest >> testIndexesOfMovableObjects [

	| start |
	start := self class aStart.

	self assert: start indexesOfMovableObjects size equals: 2
]

{ #category : #tests }
LobbyStateTest >> testInitialization [

	| s1 s2 |
	s1 := LobbyState newFrom: OrderedCollection  new.
	s2 := LobbyState newFrom: OrderedCollection  new.
	self assert: s1 estimatedCost equals: 0
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
