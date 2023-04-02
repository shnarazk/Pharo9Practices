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
	start := self new.
	start location: 1 @ 1.
	stage := Set new.
	stage add: start.
	[ stage isEmpty ] whileFalse: [
		stage := stage
			         inject: Set new
			         into: [ :aSet :each |
				Transcript show: each path; cr.
				         aSet
					         addAll: (each neighbars: [ :path | ^ path ]);
					         yourself ] ].
	^ nil
]

{ #category : #evaluating }
Y2016Day17 class >> solve2 [

	| start stage |
	self flag: #TODO. "pay attension"
	FoundGoal := 0.
	start := self new.
	start location: 1 @ 1.
	stage := Set new.
	stage add: start.
	[ stage isEmpty ] whileFalse: [ "Transcript show: FoundGoal asString."
		stage := stage
			         inject: Set new
			         into: [ :aSet :each | "Transcript show: each key."
				         (each neighbars: [ :path |
					          FoundGoal := FoundGoal max: path size ]) do: [ :next |
					         aSet add: next ].
				         aSet ] ].
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

	| next masks locations |
	4 @ 4 = location ifTrue: [ ^ aBlockAsFoundGoal value: path ].
	next := self nextKey.
	masks := #( 4 2 3 1 ) collect: [ :each | (next at: each) > $a ].
	locations := location fourNeighbors.
	^ #(4 2 3 1)
		  select: [ :each |
			  (masks at: each) and: [
				  (locations at: each) isInsideRectangle: (1 @ 1 corner: 4 @ 4) ] ]
		  thenCollect: [ :each |
			  self class
				  newAt: (locations at: each)
				  from: path , ({ 'U'. 'D'. 'L'. 'R' } at: each) ]
]

{ #category : #accessing }
Y2016Day17 >> nextKey [
Transcript show: self class input, path; cr.
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
