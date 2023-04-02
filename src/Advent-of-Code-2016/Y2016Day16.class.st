"
I was copied from cuis and revised massively not to copy vectors.
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
Y2016Day16 class >> new: aString [
"(Y2016Day16 new: '011') limit >>> 3"
	| solver |
	solver := self new.
	solver set: aString.
	^ solver
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

	[ length < limit ] whileTrue: [ "vec := vec , { false } , (vec reverse collect: [ :v | v not ]) ."
		| offset count |
		count := 0.
		offset := length + 1 * 2.
		1 to: length do: [ :i |
			| j |
			j := offset - i.
			j <= limit ifTrue: [ vec at: j put: (vec at: i) not ] ].
		vec at: length + 1 put: false.
		length := limit min: length * 2 + 1.
		count := count + 1 ].
	"vec := vec copyFrom: 1 to: limit."
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

	limit ifNil: [ limit := aString size ].
	vec := Array new: limit.
	aString withIndexDo: [ :char :index | vec at: index put: char = $1 ].
	length := aString size
]

{ #category : #evaluation }
Y2016Day16 >> shrink [

	[ length  odd ] whileFalse: [
		1 to: length  do: [ :i |
			i odd ifTrue: [
				vec at: i + 1 // 2 put: (vec at: i) = (vec at: i + 1) ] ].
		length  := length  + 1 // 2 ].
	^ self toString
]

{ #category : #convertion }
Y2016Day16 >> toString [

"(Y2016Day16 new: '011') toString >>> '011'"

	| stream |
	stream := WriteStream on: (String new: length).
	1 to: length do: [ :i |
	stream nextPut: (vec at: i) asInteger asCharacterDigit ].
	^ stream contents
]
