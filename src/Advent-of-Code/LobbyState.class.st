"
The status of y2016 day 11.
"
Class {
	#name : #LobbyState,
	#superclass : #LobbyStateIndex,
	#instVars : [
		'floor',
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

	^ self newFrom: aVec at: 0
]

{ #category : #'instance creation' }
LobbyState class >> newFrom: aVec at: aFloor [

	| state |
	state := self new.

	state
		cost: 0;
		estimatedCost: 0;
		floor: aFloor;
		locations: aVec asArray.

	NumberOfKinds := aVec size / 2.

	^ state
]

{ #category : #computing }
LobbyState >> adjacentFloors [
| floor |
  floor := self floor.
  floor = 3 ifTrue: [ ^ { 2 } ].
  floor = 0 ifTrue: [ ^ { 1 } ].
  ^ { floor - 1 . floor + 1 }
]

{ #category : #computing }
LobbyState >> adjacentStates [

	| floors objects collection |
	floors := self adjacentFloors.
	objects := self movableObjectPairs.
	collection := OrderedCollection new.
	"Make all combinations"
	floors do: [ :f | 
		objects do: [ :o | 
			| state |
			state := self moveTo: f with: (o at: 1) and: (o at: 2).
			state isSafe ifTrue: [ collection addLast: state ] ]].
	^ collection
]

{ #category : #accessing }
LobbyState >> chipsFloor: kind [
^ locations at: kind * 2 + 2
]

{ #category : #computing }
LobbyState >> estimate [

	| sumG sumC goalFloor |
	goalFloor := 3.
	sumG := 0.
	sumC := 0.
	1 to: locations size do: [ :index | 
		index % 2 = 1
			ifTrue: [ sumG := sumG + (3 - locations at: index) ]
			ifFalse: [ sumC := sumC + (3 - locations at: index) ] ].
	^ 1 * sumG + (2 * sumC)
]

{ #category : #accessing }
LobbyState >> floor [

	^ floor 
]

{ #category : #accessing }
LobbyState >> floor: aFloor [

	floor := aFloor
]

{ #category : #accessing }
LobbyState >> generatorsFloor: kind [

	^ locations at: (kind * 2 + 1)
]

{ #category : #computing }
LobbyState >> index [

| ret |
ret := floor .
locations do: [ :each | ret := ret * 4 + each ].
^ret 
]

{ #category : #predicates }
LobbyState >> indexOfGoal [

	| i |
	"start from the floor of elevator."
	i := 3.
	locations do: [ :each | i := i * 4 + 3 ].
	^ i
]

{ #category : #accessing }
LobbyState >> indexesOfMovableObjects [

	| indexes |
	indexes := OrderedCollection new.
	1 to: locations size do: [ :index | 
		floor = (locations at: index) ifTrue: [ indexes addLast: index ] ].
	^ indexes
]

{ #category : #predicates }
LobbyState >> isGoal [

^ floor = 3 and:  [ locations allSatisfy: [ :each | each = 3 ] ]
]

{ #category : #predicates }
LobbyState >> isSafe [

	| kinds |
	kinds := self numberOfKinds.
	0 to: kinds - 1 do: [ :kind | 
		| flr |
		flr := self chipsFloor: kind.
		flr = (self generatorsFloor: kind) ifFalse: [ 
			0 to: kinds - 1 do: [ :k | 
			flr = (self generatorsFloor: k) ifTrue: [ ^ false ] ] ] ].
	^ true
]

{ #category : #accessing }
LobbyState >> locationOf: anObject [

	^ locations at: anObject
]

{ #category : #accessing }
LobbyState >> locationOf: anObject at: aFloor [

	locations at: anObject put: aFloor
]

{ #category : #accessing }
LobbyState >> locations [
^locations 
]

{ #category : #accessing }
LobbyState >> locations: aVec [
 locations := aVec 

]

{ #category : #computing }
LobbyState >> movableObjectPairs [

	"Return all combination of movable objects"

	| indexes collection |
	collection := OrderedCollection new.
	indexes := self indexesOfMovableObjects.
	1 to: indexes size do: [ :i | 
		i to: indexes size do: [ :j | 
			collection addLast: { 
					(indexes at: i).
					(indexes at: j) } ] ].
	^ collection
]

{ #category : #'instance creation' }
LobbyState >> moveTo: aFloor with: anObject and: anotherObject [

	| state |
	state := self class newFrom: self locations deepCopy.
	state floor: aFloor.
	state
		locationOf: anObject at: aFloor;
		locationOf: anotherObject at: aFloor.
	state cost: self cost + 1.
	state estimatedCost: state cost + state estimate.
	^ state
]

{ #category : #accessing }
LobbyState >> numberOfKinds [

	^ self class numberOfKinds 
]

{ #category : #converting }
LobbyState >> pack [

	"locations := self index"

	| state |
	state := LobbyStateIndex new initialize: self index.
	state cost: self cost; estimatedCost: self estimatedCost.
	^state
]

{ #category : #converting }
LobbyState >> unpack [

	| n vec |
	n := self class numberOfKinds * 2.
	vec := Array new: n.
	1 to: n do: [ :i | 
		| rem |
		rem := locations \\ 4.
		vec at: n - i + 1 put: rem.
		locations := locations - rem / 4 ].
	locations = floor ifFalse: [ self error: 'failed to unpack.' ].
	locations := vec
]
