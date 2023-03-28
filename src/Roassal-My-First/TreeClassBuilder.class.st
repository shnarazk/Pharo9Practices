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

{ #category : #initialization }
TreeClassBuilder >> initialize [ 
super initialize .
classes := #().
]

{ #category : #hooks }
TreeClassBuilder >> renderIn: canvas [

	| data boxes |
	data := Collection withAllSubclasses.
	boxes := data collect: [ :class |
		         RSBox new
			         model: class;
			         popup;
			         draggable;
			         yourself ].
		canvas addAll: boxes.
		RSNormalizer size  from: 10; to: 100; shapes: boxes; normalize: #linesOfCode .
		RSNormalizer color from: Color blue ; to: Color red; shapes: boxes ; normalize: #linesOfCode .
		RSLineBuilder orthoVertical withVerticalAttachPoint ; color: Color black; shapes: boxes ; connectFrom: #superclass.
		
	RSTreeLayout on: boxes.
	
       canvas @ RSCanvasController .
canvas 
]
