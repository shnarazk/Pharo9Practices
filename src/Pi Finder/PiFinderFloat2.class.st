"
I'm a more efficient pi calcurator.
A positive term and the successive, negative term make a computaion unit.
"
Class {
	#name : #PiFinderFloat2,
	#superclass : #PiFinderFloat,
	#category : #'Pi Finder'
}

{ #category : #'instance creation' }
PiFinderFloat2 class >> runTo: limit [

	| pf |
	pf := self new.
	limit / 2 timesRepeat: [ pf step ].
	^ pf pi
]

{ #category : #stepping }
PiFinderFloat2 >> step [
	"Compute a new term and accumulate it into currSum."

	currSum := currSum - (1.0 / denominator).
	denominator := denominator + 2.
	currSum := currSum + (1.0 / denominator).
	denominator := denominator + 2
]
