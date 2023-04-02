"
I was copied from cuis version.
-[the puzzle](https://adventofcode.com/2016/day/17).
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
		'Hasher',
		'Input',
		'ToVisit',
		'Visit'
	],
	#category : #'Advent-of-Code-2016-day17'
}

{ #category : #examples }
Y2016Day17 class >> example [
	self initialize.
	"Input := 'hijkl'."
	"Input := 'ihgpwlah'."
	Input := 'kglvqrro'.
	^ self solve.
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
Y2016Day17 class >> hasher [

	^ Hasher
]

{ #category : #accessing }
Y2016Day17 class >> hasher: anObject [

	Hasher := anObject
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

{ #category : #initialization }
Y2016Day17 class >> setHasher [
Hasher := MD5 new.
]

{ #category : #evaluating }
Y2016Day17 class >> solve [

	| start stage |
	self flag: #TODO. "pay attention"
	FoundGoal := nil.
	start := self new.
	start location: 1 @ 1.
	stage := Set new.
	stage add: start.
	[ FoundGoal isNil & stage isEmpty ] whileFalse: [ "Transcript show: stage."
		stage := stage
			         inject: Set new
			         into: [ :aSet :each | "Transcript show: each path." 
				         self flag: #TODO. "use addAll: aCollection"
				         (each neighbars: [ :path | FoundGoal := path ]) do: [
					         :next | aSet add: next ].
				         aSet ] ].
	^ FoundGoal
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
Y2016Day17 >> neighbars: aBlock [
	| next masks locations |
	4 @ 4 = location ifTrue: [
		aBlock value: path.
		^ {} ].
	next := self nextKey.
	masks := #(1 2 3 4 ) collect: [ :each |
		(next at: each) > $a ].
	locations := {0 @ -1. 0 @ 1. -1 @ 0. 1 @ 0} collect: [ :each |
		location + each ].
	^ (1 to: 4)
		select: [ :each |
			(masks at: each) and: [
				(locations at: each)
					between: 1 @ 1
					and: 4 @ 4 ]]
		thenCollect: [ :each |
			self class
				newAt: (locations at: each)
				from:
					path ,
						({'U'. 'D'. 'L'. 'R'} at: each) ].
]

{ #category : #accessing }
Y2016Day17 >> nextKey [
^self class hasher hash: (self class input, path)
]

{ #category : #accessing }
Y2016Day17 >> path [

	^ path
]

{ #category : #accessing }
Y2016Day17 >> path: anObject [

	path := anObject
]
