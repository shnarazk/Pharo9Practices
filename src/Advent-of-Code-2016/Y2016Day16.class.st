"
From cuis
"
Class {
	#name : #Y2016Day16,
	#superclass : #Object,
	#instVars : [
		'length'
	],
	#category : #'Advent-of-Code-2016-day16'
}

{ #category : #examples }
Y2016Day16 class >> example [
	| solver data |
	solver := self new.
	solver length: 20.
	data := solver fromString: '10000'.
	^ solver  expand: data.
]

{ #category : #'instance creation' }
Y2016Day16 class >> part1 [

	| solver data |
	solver := self new.
	solver length: 272.
	data := solver fromString: '10001110011110000'.
	Transcript show: 'Given: '; show:  (solver toString: data).
	^ solver expand: data
]

{ #category : #'instance creation' }
Y2016Day16 class >> part2 [

	| solver data |
	solver := self new.
	solver length: 35651584.
	data := solver fromString: '10001110011110000'.
	Transcript show: 'Given: '; show: (solver toString: data).
	^ solver expand: data
]

{ #category : #'instance creation' }
Y2016Day16 >> fromString: aString [

	^ aString asOrderedCollection  collect: [ :char | char = $1 ]
]

{ #category : #accessing }
Y2016Day16 >> length [

	^ length
]

{ #category : #accessing }
Y2016Day16 >> length: anObject [

	length := anObject
]

{ #category : #evaluation }
Y2016Day16 >> shrink: aVec [
| tmp |
aVec size odd ifTrue:  [^self toString: aVec ].
tmp := ((1 to: aVec size) 
	select: [ :i | i odd  ]) collect: [ :i |
		(aVec at: i) = (aVec at: i + 1) ].
^self shrink: tmp
		 
]

{ #category : #convertion }
Y2016Day16 >> toString: aVec [

^ aVec inject:  '' into: [ :str :bool | bool ifTrue: [ str, '1' ] ifFalse:  [ str, '0' ]].
]
