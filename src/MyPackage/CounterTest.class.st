Class {
	#name : #CounterTest,
	#superclass : #TestCase,
	#category : #MyPackage
}

{ #category : #tests }
CounterTest >> testCountIsSetAndRead [
	"CountTest testCountIsSetAndRead."
	"scope: class-variables  &  instance-variables"	
			
	| c |
	c := Counter new.
	c count: 7.
	self assert: c count equals: 7.
]
