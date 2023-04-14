"
Spec for NHKChecker
"
Class {
	#name : #NHKCheckerPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'listPresenter',
		'buttonLayout',
		'fetchG1',
		'fetchE1',
		'fetchR1',
		'fetchR2',
		'fetchR3'
	],
	#category : #'NHK-Finder'
}

{ #category : #initialization }
NHKCheckerPresenter >> connectPresenters [

	fetchG1 action: [
		application channel: 'g1'.
		self updatePresenter ].
	fetchE1 action: [ application channel: 'e1'.
		self updatePresenter ].
	fetchR1 action: [ application channel: 'r1'.
		self updatePresenter ].
	fetchR2 action: [ application channel: 'r2'.
		self updatePresenter ].
	fetchR3 action: [ application channel: 'r3'.
		self updatePresenter ]
]

{ #category : #initialization }
NHKCheckerPresenter >> initializePresenters [


	listPresenter := self newTable
		                 items: application selectedContent;
		                 addColumn: ((SpStringTableColumn
				                   title: '開始時刻'
				                   evaluated: [ :program |
					                   ((program at: 'start_time') allButFirst: 11) first: 5 ]) width: 80);
		                 addColumn:
			                 ((SpStringTableColumn
				                   title: '番組タイトル'
				                   evaluated: [ :program | program at: 'title' ]) width: 200);
		                 addColumn:
			                 (SpStringTableColumn
				                  title: '内容'
				                  evaluated: [ :program | program at: 'subtitle' ]);
		                 yourself.
	fetchG1 := self newButton
		           label: 'G1';
		           yourself.
	fetchE1 := self newButton
		           label: 'E1';
		           yourself.
	fetchR1 := self newButton
		           label: 'R1';
		           yourself.
	fetchR2 := self newButton
		           label: 'R2';
		           yourself.
	fetchR3 := self newButton
		           label: 'NHK FM';
		           yourself.
	buttonLayout := SpBoxLayout newLeftToRight
		                add: fetchG1;
		                add: fetchE1;
		                add: fetchR1;
		                add: fetchR2;
		                add: fetchR3;
		                yourself.
	self layout: (SpBoxLayout newTopToBottom
			 spacing: 5;
			 add: listPresenter expand: true;
			 add: buttonLayout expand: false;
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

	listPresenter items: application selectedContent
]
