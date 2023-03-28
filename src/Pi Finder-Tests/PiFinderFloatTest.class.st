"
A PiFinderFloatTest is a test class for testing the behavior of PiFinderFloat
"
Class {
	#name : #PiFinderFloatTest,
	#superclass : #TestCase,
	#category : #'Pi Finder-Tests'
}

{ #category : #tests }
PiFinderFloatTest >> test [

| p |
p := PiFinderFloat runTo: 1000.
self assert: (3.1 < p and: p < 3.2).
]
