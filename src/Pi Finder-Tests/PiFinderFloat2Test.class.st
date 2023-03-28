"
A PiFinderFloat2Test is a test class for testing the behavior of PiFinderFloat2
"
Class {
	#name : #PiFinderFloat2Test,
	#superclass : #TestCase,
	#category : #'Pi Finder-Tests'
}

{ #category : #tests }
PiFinderFloat2Test >> test [

| p |
p := PiFinderFloat2  runTo: 1000.
self assert: (3.1 < p and: p < 3.2).
]
