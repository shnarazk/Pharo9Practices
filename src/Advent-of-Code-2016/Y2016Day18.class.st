"
transated from [rust version](https://github.com/shnarazk/advent-of-code/blob/main/src/y2016/day18.rs)
"
Class {
	#name : #Y2016Day18,
	#superclass : #Object,
	#instVars : [
		'line',
		'count'
	],
	#classVars : [
		'Input'
	],
	#category : #'Advent-of-Code-2016-day18'
}

{ #category : #accessing }
Y2016Day18 class >> input [

	^ Input
]

{ #category : #accessing }
Y2016Day18 class >> input: aString [

	Input := (' ' , aString , ' ') asArray collect: [ :ch | ch = $^ ]
]

{ #category : #'instance creation' }
Y2016Day18 class >> part1 [

	| solver |
	solver := self new.
	^ solver part1:  Input
]

{ #category : #'instance creation' }
Y2016Day18 class >> part2 [

	| solver |
	solver := self new.
	^ solver part2: Input
]

{ #category : #evaluating }
Y2016Day18 >> part1: input [

	| length tmp work |
	line := input copy.
	work := input copy.
	length := input size.
	count := input
		         inject: -2
		         into: [ :total :bool | total + bool not asInteger ].
	2 to: 40 do: [ :k |
		1 to: length do: [ :n |
			n = 1 | (n = length) ifFalse: [
				| val |
				val := (line at: n - 1) asTrapPairedWith: (line at: n + 1).
				work at: n put: val.
				count := count + val not asInteger ] ].
		tmp := line.
		line := work.
		work := tmp ].
	^ count
]

{ #category : #evaluating }
Y2016Day18 >> part2: input [

	| length  tmp work |
line  := input copy.
	work := input copy.
	length := input size.
	count := input
		         inject: -2
		         into: [ :total :bool | total + bool not asInteger ].
	2 to: 400000 do: [ :k |
		1 to: length do: [ :n |
			n = 1 | (n = length) ifFalse: [
				| val |
				val := (line at: n - 1) asTrapPairedWith: (line at: n + 1).
				work at: n put: val.
				count := count + val not asInteger ] ].
		tmp := line.
		line := work.
		work := tmp ].
	^ count
]
