"
I am a pi calculator using only float ind int. So I'm supposed to be fast.
"
Class {
	#name : #PiFinderFloat,
	#superclass : #PiFinder,
	#instVars : [
		'temp'
	],
	#category : #'Pi Finder'
}

{ #category : #initialization }
PiFinderFloat >> initialize [
super initialize.
	temp := Fraction new
]

{ #category : #stepping }
PiFinderFloat >> step [
	"Compute a new term and accumulate it into currSum."

	| frac |
	"temp setNumerator: 1 denominator: denominator.
	frac := temp asFloat."
	frac := 1.0 / denominator.
	currSum := adding
		           ifTrue: [ currSum + frac ]
		           ifFalse: [ currSum - frac ].
	denominator := denominator + 2.
	adding := adding not
]
