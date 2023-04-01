"
copied from cuis and revised massively
"
Class {
	#name : #Y2016Day16,
	#superclass : #Object,
	#instVars : [
		'vec',
		'limit',
		'length'
	],
	#category : #'Advent-of-Code-2016-day16'
}

{ #category : #examples }
Y2016Day16 class >> example [
	"Y2016Day16 example >>> '01100'"

	| solver |
	solver := self new.
	solver limit: 20.
	solver set: '10000'.
	^ solver expand
]

{ #category : #'instance creation' }
Y2016Day16 class >> part1 [

	| solver  |
	solver := self new.
	solver limit: 272.
	solver set: '10001110011110000'.
	Transcript
		show: 'Given: ';
		show: (solver toString).
	^ solver expand
]

{ #category : #'instance creation' }
Y2016Day16 class >> part2 [

	| solver  |
	solver := self new.
	solver limit: 35651584.
	 solver set: '10001110011110000'.
	Transcript
		show: 'Given: ';
		show: (solver toString).
	^ solver expand
]

{ #category : #evaluation }
Y2016Day16 >> expand [

	[ vec size < limit ] whileTrue: [
		vec := vec , { false } , (vec reverse collect: [ :v | v not ]) ].
	vec := vec copyFrom: 1 to: limit.
	^ self shrink
]

{ #category : #accessing }
Y2016Day16 >> limit [

	^ limit
]

{ #category : #accessing }
Y2016Day16 >> limit: anObject [

	limit := anObject
]

{ #category : #'instance creation' }
Y2016Day16 >> set: aString [

	vec := aString asOrderedCollection collect: [ :char | char = $1 ].
	length := vec size.
]

{ #category : #evaluation }
Y2016Day16 >> shrink [

	[ vec size odd ] whileFalse: [
		vec := ((1 to: vec size) select: [ :i | i odd ]) collect: [ :i |
			       (vec at: i) = (vec at: i + 1) ] ].
	^ self toString
]

{ #category : #convertion }
Y2016Day16 >> toString [

	| stream |
	stream := WriteStream on: (String new: vec size).
	vec do: [ :bool |
		bool
			ifFalse: [ stream nextPut: $0 ]
			ifTrue: [ stream nextPut: $1 ] ].
	^ stream contents 
]
