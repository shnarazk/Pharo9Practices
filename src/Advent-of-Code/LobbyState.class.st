"
The status of y2016 day 11.
"
Class {
	#name : #LobbyState,
	#superclass : #Object,
	#instVars : [
		'cost',
		'estimatedCost',
		'locations'
	],
	#category : #'Advent-of-Code'
}

{ #category : #'instance creation' }
LobbyState class >> createFrom: aState to: aFloor with: anObject and: anotherObject [

	| state |
	state := self new.
	state floor: aFloor.
	state
		locationOf: anObject at: aFloor;
		locationOf: anotherObject at: aFloor.
	state cost: aState cost + 1.
	state estimatedCost: (state cost + state estimate).
	^ state
]

{ #category : #'instance creation' }
LobbyState class >> newFrom: aVec [

	| state |
	state := self new.

	state
		cost: 0;
		estimatedCost: 0;
		locations: aVec asOrderedCollection.
	^ state
]

{ #category : #comparing }
LobbyState >> <= other [
^ (self estimatedCost) <= (other estimatedCost)
]

{ #category : #accessing }
LobbyState >> cost [
	^ cost
]

{ #category : #accessing }
LobbyState >> cost: aCost [
cost := aCost 
]

{ #category : #computing }
LobbyState >> estimate [

	| sumG sumC |
	sumG := 0.
	sumC := 0.
	2 to: locations size do: [ :index | 
		index % 2 = 0
			ifTrue: [ sumG := sumG + locations at: index ]
			ifFalse: [ sumC := sumC + locations at: index ] ].
	^ 1 * sumG + (2 * sumC)
]

{ #category : #accessing }
LobbyState >> estimatedCost [

	^ estimatedCost
]

{ #category : #accessing }
LobbyState >> estimatedCost: aCost [

	estimatedCost := aCost
]

{ #category : #accessing }
LobbyState >> floor [

	^ locations at: 1
]

{ #category : #accessing }
LobbyState >> floor: aFloor [

	locations at: 1 put: aFloor
]

{ #category : #accessing }
LobbyState >> locationOf: anObject [

	^ locations at: anObject + 1
]

{ #category : #accessing }
LobbyState >> locationOf: anObject at: aFloor [

	locations at: (anObject + 1) put: aFloor
]

{ #category : #accessing }
LobbyState >> locations [
^locations 
]

{ #category : #accessing }
LobbyState >> locations: aVec [
 locations := aVec 

]

{ #category : #'instance creation' }
LobbyState >> moveTo: aFloor with: anObject and: anotherObject [

	| state |
	state := self class newFrom: self locations.
	state floor: aFloor.
	state
		locationOf: anObject at: aFloor;
		locationOf: anotherObject at: aFloor.
	state cost: self cost + 1.
	state estimatedCost: state cost + state estimate.
	^ state
]
