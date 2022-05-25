"
bit-array coded version.

**Note**: index starts with 1.

"
Class {
	#name : #LobbyCode,
	#superclass : #Object,
	#instVars : [
		'code'
	],
	#classVars : [
		'Goal',
		'NumberOfKinds',
		'Width'
	],
	#category : #'Advent-of-Code'
}

{ #category : #initialization }
LobbyCode class >> goal [
^Goal 
]

{ #category : #initialization }
LobbyCode class >> setNumberOfKinds: num [

	NumberOfKinds := num.
	Width := (num + 1) * 2.
	Goal := (2 raisedToInteger: Width) - 1
]

{ #category : #initialization }
LobbyCode class >> setWidth: aWidth [

	Width := aWidth.
	Goal := (2 raisedToInteger: aWidth) - 1
]

{ #category : #accessing }
LobbyCode class >> width [
^Width 
]

{ #category : #accessing }
LobbyCode >> at: index [

	| mask result |
	mask := 1 << (self class width - (index * 2) + 1).
	result := (code bitAnd: mask) > 0
		          ifTrue: [ 2 ]
		          ifFalse: [ 0 ].
	mask := mask >> 1.
	(code bitAnd: mask) > 0
		ifTrue: [ ^ result + 1 ]
		ifFalse: [ ^ result ]
]

{ #category : #accessing }
LobbyCode >> changeAt: index to: val [

self notYetImplemented .
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
