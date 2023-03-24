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

	currSum := adding
		           ifTrue: [ currSum + (1.0 / denominator) ]
		           ifFalse: [ currSum - (1.0 / denominator) ].
	denominator := denominator + 2.
	adding := adding not
]
