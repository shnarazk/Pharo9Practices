"
Spec for NHKChecker
"
Class {
	#name : #NHKCheckerPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'listPresenter'
	],
	#category : #MyPackage
}

{ #category : #initialization }
NHKCheckerPresenter >> initializePresenters [

	listPresenter := self newTable
		                 addColumn: (SpStringTableColumn
				                  title: 'clock'
				                  evaluated: [ :program | program at: 'time' ]);
		                 addColumn: (SpStringTableColumn
				                  title: 'タイトル'
				                  evaluated: [ :program | program at: 'title' ]);
		                 yourself.

	self layout: (SpBoxLayout newVertical
			 spacing: 5;
			 add: listPresenter;
			 yourself)
]

{ #category : #initialization }
NHKCheckerPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'NHK now';
		initialExtent: 700@300
]

{ #category : #initialization }
NHKCheckerPresenter >> updatePresenter [ 
<<<<<<< HEAD
	listPresenter items: Dictionary new asOrderedCollection.
=======
	listPresenter items: Dictionary new.
>>>>>>> 855c76d (Add NHKchecker transported from a Swift program)
]
