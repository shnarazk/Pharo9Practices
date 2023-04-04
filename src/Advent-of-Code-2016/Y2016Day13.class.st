"
I'm copied from cuis version.

"
Class {
	#name : #Y2016Day13,
	#superclass : #Object,
	#instVars : [
		'cost',
		'goal',
		'toEvaluate',
		'favorite'
	],
	#category : #'Advent-of-Code-2016-day13'
}

{ #category : #'instance creation' }
Y2016Day13 class >> part1 [ 

| solver |

solver := self new.
solver favorite: 1364.
^solver stepsTo: 31@39
]

{ #category : #'instance creation' }
Y2016Day13 class >> part2 [

	| solver |
	solver := self new.
	solver favorite: 1364.
	^ solver reachableSitesBy: 50
]

{ #category : #accessing }
Y2016Day13 >> favorite [

	^ favorite
]

{ #category : #accessing }
Y2016Day13 >> favorite: anObject [

	favorite := anObject
]

{ #category : #evaluating }
Y2016Day13 >> isGoal: aTuple [

^(aTuple at: 3) = goal 
]

{ #category : #evaluating }
Y2016Day13 >> isOpenSpace: aTuple [
	| x y val ones |
	x := (aTuple at: 3) x.
	y := (aTuple at: 3) y.
	val := x * x + (x * 3) + (x * y * 2) + y + (y * y).
	val := val + favorite.
	ones := 0.
	[ val > 0 ] whileTrue: [
		(val bitAnd: 1) > 0 ifTrue: [ ones := ones + 1 ].
		val := val // 2 ].
	^ ones even.
]

{ #category : #accessing }
Y2016Day13 >> rangeX: aRange andY: anotherRange require: filterBlock on: aBlock [
	aRange do: [ :x |
		anotherRange do: [ :y |
			(filterBlock
				value: x@y) ifTrue: [
				aBlock
					value: x@y ]]].
]

{ #category : #evaluating }
Y2016Day13 >> reachableSitesBy: aLimit [

	goal := 1 @ 1.
	cost := Dictionary new.
	cost at: goal put: 0.
	toEvaluate := Heap sortBlock: [ :a :b | (a at: 1) <= (b at: 1) ].
	toEvaluate add: {
			(goal x + goal y).
			0.
			(1 @ 1) }.
	[ toEvaluate isEmpty ] whileFalse: [
		| state |
		state := toEvaluate removeFirst.
		aLimit < (state at: 2) ifTrue: [
			^ (cost select: [ :val | val isNil not and: [ val <= aLimit ] ])
				  size ].
		self registerNextStatesOf: state ]
]

{ #category : #evaluating }
Y2016Day13 >> registerNextStatesOf: aState [

	| c x y xrange yrange |
	c := aState at: 2.
	x := (aState at: 3) x.
	y := (aState at: 3) y.
	xrange := x = 0
		          ifTrue: [ { 0. 1 } ]
		          ifFalse: [
			          {  (x - 1).  x.   (x + 1) } ].
	yrange := y = 0
		          ifTrue: [ { 0. 1 } ]
		          ifFalse: [
			          {
				          (y - 1).
				          y.
				          (y + 1) } ].
	self
		rangeX: xrange
		andY: yrange
		require: [ :p | p x = x or: p y = y ]
		on: [ :p |
			| newState xdist ydist |
			xdist := (goal x - p x) abs.
			ydist := (goal y - p y) abs.
			newState := {
				            (c + 1 + xdist + ydist).
				            (c + 1).
				            p }.
			(cost includesKey: p) ifFalse: [
				(self isOpenSpace: newState)
					ifTrue: [
						cost at: p put: c + 1.
						toEvaluate add: newState ]
					ifFalse: [ cost at: p put: nil ] ] ]
]

{ #category : #evaluating }
Y2016Day13 >> stepsTo: aGoal [

	goal := aGoal.
	cost := Dictionary new.
	cost at: 1 @ 1 put: 0.
	toEvaluate := Heap sortBlock: [ :a :b | (a at: 1) <= (b at: 1) ].
	toEvaluate add: {
			(goal x + goal y).
			0.
			(1 @ 1) }.
	[ toEvaluate isEmpty ] whileFalse: [
		| state |
		state := toEvaluate removeFirst.
		(self isGoal: state) ifTrue: [ 
			^ state at: 2 ].
		self registerNextStatesOf: state ]
]
