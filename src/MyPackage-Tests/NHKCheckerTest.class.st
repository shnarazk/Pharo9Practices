Class {
	#name : #NHKCheckerTest,
	#superclass : #TestCase,
	#category : #'MyPackage-Tests'
}

{ #category : #tests }
NHKCheckerTest >> testLoadJson [

| target |
target := NHKChecker new.
target loadJSON.
self assert: (target json isNil) not.

]
