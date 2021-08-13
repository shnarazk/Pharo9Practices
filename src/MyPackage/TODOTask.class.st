Class {
	#name : #TODOTask,
	#superclass : #Object,
	#instVars : [
		'done',
		'title'
	],
	#category : #MyPackage
}

{ #category : #selection }
TODOTask class >> selectAll [ 
	^ self allInstances 

]

{ #category : #accessing }
TODOTask >> done: aBoolean [
  done := aBoolean
]

{ #category : #initialization }
TODOTask >> initialize [ 
	super initialize.
	self done: false
]

{ #category : #accessing }
TODOTask >> isDone [
	^ done
]

{ #category : #accessing }
TODOTask >> title [
	^ title
]

{ #category : #accessing }
TODOTask >> title: aString [
	title := aString
]
