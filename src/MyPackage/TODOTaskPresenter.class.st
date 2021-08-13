Class {
	#name : #TODOTaskPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'task',
		'titlePresenter'
	],
	#category : #MyPackage
}

{ #category : #visiting }
TODOTaskPresenter >> accept [

	self task
		title: titlePresenter text
		";save"
]

{ #category : #initialization }
TODOTaskPresenter >> initializeDialogWindow: aDialogWindowPresenter [

	aDialogWindowPresenter
		title: 'New task';
		initialExtent: 350 @ 120;
		addButton: 'Accept' do: [ :dialog | 
			self accept.
			dialog close ];
		addButton: 'Cancel' do: [ :dialog | dialog close ]
]

{ #category : #initialization }
TODOTaskPresenter >> initializePresenters [

	titlePresenter := self newTextInput.
	self layout: (SpBoxLayout newVertical
			 add: titlePresenter expand: false;
			 yourself)
]

{ #category : #accessing }
TODOTaskPresenter >> task [
	^ task
]

{ #category : #accessing }
TODOTaskPresenter >> task: aTask [

	task := aTask.
	self updatePresenter
]

{ #category : #initialization }
TODOTaskPresenter >> updatePresenter [

	"During the initialization phase, task may be nil. So I need to modify"

	titlePresenter text: (task
			 ifNil: [ '' ]
			 ifNotNil: [ task title ifNil: [ '' ] ifNotNil: task title ])
]
