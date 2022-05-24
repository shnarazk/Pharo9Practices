"
Compressed Lobby state
"
Class {
	#name : #LobbyStateIndex,
	#superclass : #Object,
	#instVars : [
		'cost',
		'index',
		'estimatedCost'
	],
	#classVars : [
		'NumberOfKinds'
	],
	#category : #'Advent-of-Code'
}

{ #category : #'instance creation' }
LobbyStateIndex class >> numberOfKinds [

	^ NumberOfKinds
]

{ #category : #comparing }
LobbyStateIndex >> <= other [
^ (self estimatedCost) <= (other estimatedCost)
]

{ #category : #accessing }
LobbyStateIndex >> cost [
^cost
]

{ #category : #accessing }
LobbyStateIndex >> cost: aCost [
cost := aCost 
]

{ #category : #accessing }
LobbyStateIndex >> estimatedCost [
^ estimatedCost 
]

{ #category : #accessing }
LobbyStateIndex >> estimatedCost: aCost [

	estimatedCost := aCost 
]

{ #category : #testing }
LobbyStateIndex >> isGoal [ 
self notYetImplemented 
]

{ #category : #converting }
LobbyStateIndex >> pack [
self shouldNotImplement .
]

{ #category : #converting }
LobbyStateIndex >> unpack [
"Return a new instance."
	| state l n vec |
	state := LobbyState new.
	n := self class numberOfKinds * 2.
	vec := Array new: n.
	l := index deepCopy.
	1 to: n do: [ :i | 
		| rem |
		rem := l \\ 4.
		vec at: n - i + 1 put: rem.
		l := l - rem / 4 ].
	state
		cost: self cost;
		estimatedCost: self estimatedCost;
		locations: vec;
		floor: l.
  ^state
]
