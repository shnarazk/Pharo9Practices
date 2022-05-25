Class {
	#name : #LobbyCodeTest,
	#superclass : #TestCase,
	#instVars : [
		'aStart',
		'aGoal'
	],
	#category : #'Advent-of-Code-Tests'
}

{ #category : #running }
LobbyCodeTest >> setUp [

	super setUp.
	LobbyCode setWidth: 8.
	aStart := LobbyCode new.
	aGoal := LobbyCode new initializeAs: 255.
]

{ #category : #tests }
LobbyCodeTest >> testAt [

	self assert: (aStart at: 1) equals: 0.
	self assert: (aStart at: 2) equals: 0.

	self assert: (aGoal at: 1) equals: 3.
	self assert: (aGoal at: 2) equals: 3
]

{ #category : #tests }
LobbyCodeTest >> testIsGoal [ 
 self assert: aStart isGoal equals: false.
 self assert: aGoal isGoal equals: true.
]
