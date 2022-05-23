"
Implement and evaluate A* algorithm!
"
Class {
	#name : #Day11,
	#superclass : #Object,
	#instVars : [
		'start',
		'visit',
		'toCheck'
	],
	#category : #'Advent-of-Code'
}

{ #category : #initialization }
Day11 class >> startFrom: start [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	| instance |
	instance := self new.
	^instance startFrom: start 
]

{ #category : #computing }
Day11 >> findGoal: aStart [

	| visit toCheck |
	visit := Dictionary new.
	toCheck := Heap new.
	start := LobbyState newFrom: aStart.
	^ start
]

{ #category : #testing }
Day11 >> hasNoCands [
 ^ toCheck isEmpty 
]

{ #category : #accessing }
Day11 >> start [
^start
]

{ #category : #accessing }
Day11 >> visited [

	^ visit size
]
