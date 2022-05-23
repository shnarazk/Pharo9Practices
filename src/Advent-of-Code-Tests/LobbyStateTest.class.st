Class {
	#name : #LobbyStateTest,
	#superclass : #TestCase,
	#category : #'Advent-of-Code-Tests'
}

{ #category : #tests }
LobbyStateTest >> testCost [

	| start state loc |
	loc := { 0 . 0 . 0 . 1 . 0 } asOrderedCollection.
	start := LobbyState newFrom: loc.
	state := start moveTo: 1 with: 1 and: 2.
	self assert: start estimatedCost < state estimatedCost
]

{ #category : #tests }
LobbyStateTest >> testInitialization [

	| s1 s2 |
	s1 := LobbyState newFrom: OrderedCollection  new.
	s2 := LobbyState newFrom: OrderedCollection  new.
	self assert: s1 estimatedCost equals: 0
]

{ #category : #tests }
LobbyStateTest >> testOrder [

	| s1 s2 |
	s1 := LobbyState newFrom: OrderedCollection  new.
	s2 := LobbyState newFrom: OrderedCollection  new.
	s2 estimatedCost: 1.
	self assert: s1 <= s2
]
