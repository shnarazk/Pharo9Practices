"
I was copied from cuis version.
See [the puzzle description](https://adventofcode.com/2016/day/17).

"
Class {
	#name : #Y2016Day17,
	#superclass : #Object,
	#instVars : [
		'location',
		'key',
		'path'
	],
	#classVars : [
		'FoundGoal',
		'Input',
		'ToVisit',
		'Visit'
	],
	#category : #'Advent-of-Code-2016-day17'
}

{ #category : #examples }
Y2016Day17 class >> example [
	"Y2016Day17 example >>> 'DDUDRLRRUDRD'"

	self initialize.
	"Input := 'hijkl'."
	"Input := 'ihgpwlah'."
	Input := 'kglvqrro'.
	^ self solve
]

{ #category : #accessing }
Y2016Day17 class >> foundGoal [

	^ FoundGoal
]

{ #category : #accessing }
Y2016Day17 class >> foundGoal: anObject [

	FoundGoal := anObject
]

{ #category : #accessing }
Y2016Day17 class >> input [

	^ Input
]

{ #category : #accessing }
Y2016Day17 class >> input: anObject [

	Input := anObject
]

{ #category : #'instance creation' }
Y2016Day17 class >> newAt: aPoint from: aPath [

	| instance |
	instance := self new.
	^ instance
		  location: aPoint;
		  path: aPath;
		  yourself
]

{ #category : #'instance creation' }
Y2016Day17 class >> part1 [
	self initialize.
	Input := 'gdjjyniy'.
	^ self solve.
]

{ #category : #'instance creation' }
Y2016Day17 class >> part2 [
	self initialize.
	Input := 'gdjjyniy' "'ihgpwlah'".
	^ self solve2.
]

{ #category : #evaluating }
Y2016Day17 class >> solve [

	| start stage |
	FoundGoal := nil.
	start := self new.
	start location: 1 @ 1.
	stage := Set new.
	stage add: start.
	[ stage isEmpty ] whileFalse: [
		stage := stage inject: Set new into: [ :aSet :each |
			         aSet
				         addAll: (each neighbars: [ :found | ^ found ]);
				         yourself ] ].
	^ nil
]

{ #category : #evaluating }
Y2016Day17 class >> solve2 [

	| start stage |
	FoundGoal := 0.
	start := self new.
	start location: 1 @ 1.
	stage := Set new.
	stage add: start.
	[ stage isEmpty ] whileFalse: [
		stage := stage
			         inject: Set new
			         into: [ :aSet :each | 
				aSet addAll: 
				         (each neighbars: [ :found |
					          FoundGoal := FoundGoal max: found size ]);
				         yourself ] ].
	^ FoundGoal
]

{ #category : #accessing }
Y2016Day17 class >> toVisit [

	^ ToVisit
]

{ #category : #accessing }
Y2016Day17 class >> toVisit: anObject [

	ToVisit := anObject
]

{ #category : #accessing }
Y2016Day17 class >> visit [

	^ Visit
]

{ #category : #accessing }
Y2016Day17 class >> visit: anObject [

	Visit := anObject
]

{ #category : #accessing }
Y2016Day17 >> cost [

^key size
]

{ #category : #initialization }
Y2016Day17 >> initialize [
super initialize .
	location := 1 @ 1.
	path := ''
]

{ #category : #accessing }
Y2016Day17 >> key [

	^ key
]

{ #category : #accessing }
Y2016Day17 >> key: anObject [

	key := anObject
]

{ #category : #accessing }
Y2016Day17 >> location [

	^ location
]

{ #category : #accessing }
Y2016Day17 >> location: anObject [

	location := anObject
]

{ #category : #accessing }
Y2016Day17 >> neighbars: aBlockAsFoundGoal [

	| locations masks |
	4 @ 4 = location ifTrue: [ ^ aBlockAsFoundGoal value: path ].
	locations := location fourNeighbors. "This returns #(right down left up)."
	locations := #( 4 2 3 1 ) collect: [ :n | locations at: n ].
	masks := self nextKey asArray collect: [ :each | each > $a ]. "This return up, down, left, and right."
	^ #( 1 2 3 4 )
		  select: [ :each |
			  (masks at: each) and: [
				  | loc |
				  loc := locations at: each.
				  1 @ 1 <= loc and: [ loc <= (4 @ 4) ] ] ]
		  thenCollect: [ :each |
			  self class
				  newAt: (locations at: each)
				  from: path , ({ 'U'. 'D'. 'L'. 'R' } at: each) ]
]

{ #category : #accessing }
Y2016Day17 >> nextKey [

	^ (MD5 hashMessage: self class input , path) hex copyFrom: 1 to: 4
]

{ #category : #accessing }
Y2016Day17 >> path [

	^ path
]

{ #category : #accessing }
Y2016Day17 >> path: anObject [

	path := anObject
]
