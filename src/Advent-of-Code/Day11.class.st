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
Day11 class >> part1 [


	^self start: (LobbyState newFrom: { 0. 0. 0. 0. 1. 2. 1. 1. 1. 1 })
]

{ #category : #initialization }
Day11 class >> start: start [

	"comment stating purpose of class-side method"

	"scope: class-variables  &  class-instance-variables"

	| instance |
	instance := self new.
	^ instance costToGoal:  start
]

{ #category : #computing }
Day11 >> costToGoal: aStart [

	| count |
	count := 0.

	Transcript
		show: 'Start';
		cr.
	visit := Bag new.
	toCheck := Heap new.
	start := aStart.
	toCheck add: start.
	[ toCheck isEmpty ] whileFalse: [ 
		| state |
		count := count + 1.
		state := toCheck removeFirst.
		Transcript
			show: 'Expand ';
			show: state locations;
			show: ' at ';
			show: state floor;
			show: ' cost: ';
			show: state cost;
			show: ' goal? ';
			show: state isGoal;
			show: ' visited? ';
			show: (visit includes: state index);
			cr.
		state isGoal ifTrue: [ ^ state cost ].
		(visit includes: state index) ifFalse: [ 
			visit add: state index.
			state adjacentStates do: [ :next | toCheck add: next ] ] ].
	self error: 'No more candidates'
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
