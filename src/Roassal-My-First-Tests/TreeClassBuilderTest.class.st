"
A TreeClassBuilderTest is a test class for testing the behavior of TreeClassBuilder
"
Class {
	#name : #TreeClassBuilderTest,
	#superclass : #TestCase,
	#category : #'Roassal-My-First-Tests'
}

{ #category : #tests }
TreeClassBuilderTest >> testClasses [
| builder classes |
builder := TreeClassBuilder new.
self assert: builder classes isEmpty.
classes := { TestCase. Collection. Array }.
builder classes: classes.
self assert: builder classes equals: classes.

]

{ #category : #tests }
TreeClassBuilderTest >> testOpen [
| builder window |
builder := TreeClassBuilder new.
window := builder open.
window delete.

]
