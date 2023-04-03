"
Cuis smalltalkからもってきた。
See [the puzzle description](https://adventofcode.com/2016/day/12).
"
Class {
	#name : #Day12,
	#superclass : #Object,
	#instVars : [
		'register',
		'code',
		'pc'
	],
	#category : #'Advent-of-Code-2016-day12'
}

{ #category : #'instance creation' }
Day12 class >> part1 [

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
Day12 class >> part2 [

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
Day12 >> at: reg put: val [

register at: reg put: val.
]

{ #category : #execution }
Day12 >> execute: anInstruction [
	| opCode |
	opCode := anInstruction at: 1.
	"Transcript show: opCode."
	opCode = #cpy ifTrue: [ | from to val |
		from := anInstruction at: 2.
		to := anInstruction at: 3.
		val := from isNumber
			ifTrue: [ from ]
			ifFalse: [ register at: from ].
		register
			at: to
			put: val.
		pc := pc + 1.
		^ self ].
	opCode = #inc ifTrue: [ | name val |
		name := anInstruction at: 2.
		val := register at: name.
		register
			at: name
			put: val + 1.
		pc := pc + 1.
		^ self ].
	opCode = #dec ifTrue: [ | name val |
		name := anInstruction at: 2.
		val := register at: name.
		register
			at: name
			put: val - 1.
		pc := pc + 1.
		^ self ].
	opCode = #jnz ifTrue: [ | op1 cond op2 offset |
		op1 := anInstruction at: 2.
		cond := op1 isNumber
			ifTrue: [ op1 ]
			ifFalse: [ register at: op1 ].
		op2 := anInstruction at: 3.
		offset := op2 isNumber
			ifTrue: [ op2 ]
			ifFalse: [ register at: op2 ].
		pc := pc +
			(cond = 0
				ifTrue: [ 1 ]
				ifFalse: [ offset ]).
		^ self ].
]

{ #category : #initialization }
Day12 >> initialize [
super initialize .
register := Dictionary new.
register at: #a put: 0;
at: #b put: 0;
at: #c put: 0;
at: #d put: 0.
]

{ #category : #actions }
Day12 >> load: aProgram [

code := aProgram .
pc := 1.
]

{ #category : #execution }
Day12 >> start [

	| end |
	pc := 1.
	end := code size.
	[ end < pc ] whileFalse: [
		| instruction oldPc |
		oldPc := pc.
		instruction := code at: pc.
		self execute: instruction.
		oldPc = pc ifTrue: [ self error: 'Not uploaded PC' ] ].
	^register at: #a
]
