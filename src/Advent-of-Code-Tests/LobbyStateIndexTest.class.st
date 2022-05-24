Class {
	#name : #LobbyStateIndexTest,
	#superclass : #TestCase,
	#instVars : [
		'state',
		'aStart',
		'aGoal'
	],
	#category : #'Advent-of-Code-Tests'
}

{ #category : #running }
LobbyStateIndexTest >> setUp [

	super setUp.
	state := LobbyStateIndex  new.
	state
		cost: 0;
		estimatedCost: 0;
		initialize: 0.

	aStart := LobbyStateIndex new.
	aStart
		cost: 0;
		estimatedCost: 100;
		initialize: 0.


	aGoal := LobbyStateIndex  new.
	aGoal
		cost: 11;
		estimatedCost: 0;
		initialize: 127
]

{ #category : #tests }
LobbyStateIndexTest >> testUnpack [

	| tmp |
	tmp := aStart unpack pack.
	self assert: tmp index equals: 0
]
