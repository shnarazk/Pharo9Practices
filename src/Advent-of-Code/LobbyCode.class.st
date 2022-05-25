"
bit-array coded version
"
Class {
	#name : #LobbyCode,
	#superclass : #Object,
	#instVars : [
		'code'
	],
	#classVars : [
		'Goal',
		'Width'
	],
	#category : #'Advent-of-Code'
}

{ #category : #initialization }
LobbyCode class >> goal [
^Goal 
]

{ #category : #initialization }
LobbyCode class >> setWidth: aWidth [

	Width := aWidth.
	Goal := (2 raisedToInteger: aWidth) - 1
]

{ #category : #initialization }
LobbyCode >> initialize [ 
super initialize.
code := 0
]

{ #category : #initialization }
LobbyCode >> initializeAs: aCode [
self initialize .
code := aCode 
]

{ #category : #testing }
LobbyCode >> isGoal [

	^ code = self class goal
]

{ #category : #testing }
LobbyCode >> isStart [
^ code = 0
]
