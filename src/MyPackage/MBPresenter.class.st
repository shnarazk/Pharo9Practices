"
Sample from somewhere

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	operations:		<Object>
	sizeInput:		<Object>
	sizeLabel:		<Object>
	startButton:		<Object>
	stopButton:		<Object>


    Implementation Points
"
Class {
	#name : #MBPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'sizeLabel',
		'sizeInput',
		'operations',
		'startButton',
		'stopButton'
	],
	#category : #MyPackage
}

{ #category : #specs }
MBPresenter class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
		  add: #sizeLabel;
		  add: 'Select the operation to run' expand: false;
		  add: #operations;
		  addLast: (SpBoxLayout newLeftToRight
				   add: #startButton;
				   add: #stopButton;
				   yourself) yourself
]

{ #category : #initialization }
MBPresenter >> connectPresenters [

	startButton action: [ 
		| class size |
		class := operations selection selectedItem.
		size := sizeInput number ]
]

{ #category : #initialization }
MBPresenter >> initializePresenters [

	sizeInput := self newNumberInput placeholder: '100'.
	sizeLabel := self instantiate: (SpLabeledPresenter
			              label: 'Size'
			              input: sizeInput
			              description: 'size of something').
	operations := self newList.
	operations items: MBApplication subclasses.

	startButton := self newButton
		               label: 'benchmark';
		               color: Color orange;
		               yourself.
	stopButton := self newButton
		              label: 'stop';
		              color: Color red;
		              yourself
]
