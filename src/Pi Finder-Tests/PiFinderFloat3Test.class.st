"
A PiFinderFloat3Test is a test class for testing the behavior of PiFinderFloat3
"
Class {
	#name : #PiFinderFloat3Test,
	#superclass : #TestCase,
	#category : #'Pi Finder-Tests'
}

{ #category : #tests }
PiFinderFloat3Test >> test [

	| p |
	p := PiFinderFloat3 runTo: 1000.
	self assert: (3.1 < p and: p < 3.2)
]
