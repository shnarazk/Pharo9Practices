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
