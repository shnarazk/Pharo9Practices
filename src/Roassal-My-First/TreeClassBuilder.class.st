"
I'm a class described at [a tutorial](https://thepharo.dev/2022/08/03/creating-a-new-visualization-in-roassal/).
Try `TreeClassBuilder new open openInWorld`.
"
Class {
	#name : #TreeClassBuilder,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'classes'
	],
	#category : #'Roassal-My-First'
}

{ #category : #accessing }
TreeClassBuilder >> classes [
	^classes
]

{ #category : #accessing }
TreeClassBuilder >> classes: aCollectionOfClasses [

	classes := aCollectionOfClasses 
]

{ #category : #hooks }
TreeClassBuilder >> createBoxFor: aClass [
^RSBox new
model: aClass;
popup;
draggable;
yourself  
]

{ #category : #hooks }
TreeClassBuilder >> createBoxes [
^self classes collect: [ :class | self createBoxFor: class  ]
]

{ #category : #hooks }
TreeClassBuilder >> createLinesFor: boxes [

| lineBuilder |
lineBuilder := RSLineBuilder orthoVertical .
lineBuilder withVerticalAttachPoint ;
color: Color black;
shapes: boxes.
^lineBuilder connectFrom: #superclass.

]

{ #category : #'accessing - defaults' }
TreeClassBuilder >> defaultContainer [ 
^RSCanvas new @ RSCanvasController 
]

{ #category : #initialization }
TreeClassBuilder >> initialize [ 
super initialize .
classes := #().
]

{ #category : #accessing }
TreeClassBuilder >> layout: aGroupOfBoxes [
RSTreeLayout on: aGroupOfBoxes 
]

{ #category : #hooks }
TreeClassBuilder >> normalize: aGroupOfBoxes [

	RSNormalizer size
		from: 10;
		to: 100;
		shapes: aGroupOfBoxes;
		normalize: #linesOfCode.
		
	RSNormalizer color 
	from: Color blue;
	to: Color red;
	shapes:  aGroupOfBoxes ;
	normalize: #linesOfCode.
]

{ #category : #hooks }
TreeClassBuilder >> renderIn: canvas [
"
builder := TreeClassBuilder new.
builder classes: ArrayedCollection withAllSubclasses, SliderMorph withAllSubclasses .
builder asPresenter open.
"

	| boxes lines |
	boxes := self createBoxes.
	self normalize: boxes.
	lines := self createLinesFor: boxes.
	self layout: boxes.
	canvas
		addAll: lines;
		addAll: boxes
]
