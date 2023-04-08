"
Cuis smalltalkからもってきた。
See [the puzzle description](https://adventofcode.com/2016/day/12).
"
Class {
	#name : #Y2016Day12,
	#superclass : #Object,
	#instVars : [
		'register',
		'code',
		'pc'
	],
	#category : #'Advent-of-Code-2016-day12'
}

{ #category : #'instance creation' }
Y2016Day12 class >> part1 [

	| code myComputer |
	code := {
		        { #cpy. 1. #a }.
		        { #cpy. 1. #b }.
		        { #cpy. 26. #d }.
		        { #jnz. #c. 2 }.
		        { #jnz. 1. 5 }.
		        { #cpy. 7. #c }.
		        { #inc. #d }.
		        { #dec. #c }.
		        { #jnz. #c. -2 }.
		        { #cpy. #a. #c }.
		        { #inc. #a }.
		        { #dec. #b }.
		        { #jnz. #b. -2 }.
		        { #cpy. #c. #b }.
		        { #dec. #d }.
		        { #jnz. #d. -6 }.
		        { #cpy. 16. #c }.
		        { #cpy. 12. #d }.
		        { #inc. #a }.
		        { #dec. #d }.
		        { #jnz. #d. -2 }.
		        { #dec. #c }.
		        { #jnz. #c. -5 } }.
	myComputer := self new.
	myComputer load: code.
	^myComputer start
]

{ #category : #'instance creation' }
Y2016Day12 class >> part2 [

	| code myComputer |
	code := {
		        { #cpy. 1. #a }.
		        { #cpy. 1. #b }.
		        { #cpy. 26. #d }.
		        { #jnz. #c. 2 }.
		        { #jnz. 1. 5 }.
		        { #cpy. 7. #c }.
		        { #inc. #d }.
		        { #dec. #c }.
		        { #jnz. #c. -2 }.
		        { #cpy. #a. #c }.
		        { #inc. #a }.
		        { #dec. #b }.
		        { #jnz. #b. -2 }.
		        { #cpy. #c. #b }.
		        { #dec. #d }.
		        { #jnz. #d. -6 }.
		        { #cpy. 16. #c }.
		        { #cpy. 12. #d }.
		        { #inc. #a }.
		        { #dec. #d }.
		        { #jnz. #d. -2 }.
		        { #dec. #c }.
		        { #jnz. #c. -5 } }.
	myComputer := self new.
	myComputer load: code.
	myComputer at: #c put: 1.
	^myComputer start
]

{ #category : #accessing }
Y2016Day12 >> at: reg put: val [

register at: reg put: val.
]

{ #category : #execution }
Y2016Day12 >> execute: anInstruction [

	| opCode  |
	opCode := anInstruction at: 1.
	opCode = #cpy ifTrue: [ self executeCpy: anInstruction ].
	opCode = #inc ifTrue: [ self executeInc: anInstruction ].
	opCode = #dec ifTrue: [ self executeDec: anInstruction ].
	opCode = #jnz ifTrue: [ self executeJnz: anInstruction ]
]

{ #category : #execution }
Y2016Day12 >> executeCpy: anInstruction [

	register at: (anInstruction at: 3) put: (self fetch: (anInstruction at: 2)).
	pc := pc + 1.
]

{ #category : #execution }
Y2016Day12 >> executeDec: anInstruction [

	| op1 |
	op1 := anInstruction at: 2.
	register at: op1 put: (register at: op1) - 1.
	pc := pc + 1
]

{ #category : #execution }
Y2016Day12 >> executeInc: anInstruction [

	| op1 |
	op1 := anInstruction at: 2.
	register at: op1 put: (register at: op1) + 1.
	pc := pc + 1
]

{ #category : #execution }
Y2016Day12 >> executeJnz: anInstruction [

	pc := pc +( (self fetch: (anInstruction at: 2)) = 0
		  ifTrue: [ 1 ]
		  ifFalse: [ self fetch: (anInstruction at: 3) ])
]

{ #category : #execution }
Y2016Day12 >> fetch: operand [


	^ operand isNumber
		       ifTrue: [ operand ]
		       ifFalse: [ register at: operand ].
	
]

{ #category : #initialization }
Y2016Day12 >> initialize [ 
super initialize .
register := Dictionary new.
register at: #a put: 0;
at: #b put: 0;
at: #c put: 0;
at: #d put: 0.
]

{ #category : #actions }
Y2016Day12 >> load: aProgram [

code := aProgram .
pc := 1.
]

{ #category : #execution }
Y2016Day12 >> start [

	| end |
	pc := 1.
	end := code size.
	[ end < pc ] whileFalse: [
		| oldPc |
		oldPc := pc.
		self execute: (code at: pc).
		oldPc = pc ifTrue: [ self error: 'Not uploaded PC' ] ].
	^ register at: #a
]
