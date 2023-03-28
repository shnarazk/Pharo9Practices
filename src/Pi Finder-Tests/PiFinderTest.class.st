"
A PiFinderTest is a test class for testing the behavior of PiFinder
"
Class {
	#name : #PiFinderTest,
	#superclass : #TestCase,
	#category : #'Pi Finder-Tests'
}

{ #category : #tests }
PiFinderTest >> test [

| p |
p := PiFinder runTo: 1000.
self assert: (3.1 < p and: p < 3.2).
]
