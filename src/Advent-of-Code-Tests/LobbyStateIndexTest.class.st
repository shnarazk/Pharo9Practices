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

{ #category : #tests }
LobbyStateIndexTest >> testUnpack [

	| tmp |
	tmp := aStart unpack pack.
	self assert: tmp index equals: 0
]
