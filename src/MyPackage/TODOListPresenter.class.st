Class {
	#name : #TODOListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'todoListPresenter'
	],
	#category : #MyPackage
}

{ #category : #initialization }
TODOListPresenter >> initializePresenters [ 

	todoListPresenter := self newTable 
		addColumn: ((SpCheckBoxTableColumn evaluated: [:task | task isDone]) width: 20);
		addColumn: (SpStringTableColumn title: 'Title' evaluated: [:task | task title]);
		yourself.
		
	self layout: (SpBoxLayout newVertical add: todoListPresenter; yourself)
]

{ #category : #initialization }
TODOListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'TODO list';
		initialExtent: 500@500
]

{ #category : #initialization }
TODOListPresenter >> updatePresenter [ 
	todoListPresenter items: TODOTask selectAll asOrderedCollection 
]
