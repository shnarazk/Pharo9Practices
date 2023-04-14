Class {
	#name : #LesMiserableVisualization,
	#superclass : #Object,
	#instVars : [
		'model',
		'canvas',
		'characters'
	],
	#category : #'LesMiserableVisualization-roassal'
}

{ #category : #'as yet unclassified' }
LesMiserableVisualization >> addLines [

	self addLinesColored: Color gray
]

{ #category : #'as yet unclassified' }
LesMiserableVisualization >> addLinesColored: aColor [
	"Add coappearances using colored lines "
	| eb |
	eb := RSEdgeBuilder line.
	eb canvas: canvas.
	eb color: aColor translucent.
	eb moveBehind.
	eb shapes: characters.
	eb connectToAll: #characters.

	"Make each element have a popup text and is draggable"
	characters @ RSPopup @ RSDraggable
]

{ #category : #'as yet unclassified' }
LesMiserableVisualization >> adjustColor [
	self adjustColorShapeFrom: Color gray to: Color red
]

{ #category : #'as yet unclassified' }
LesMiserableVisualization >> adjustColorShapeFrom: color1 to: color2 [
	"Normalizing the characters"
	RSNormalizer color
		shapes: characters;
		from: color1 translucent;
		to: color2 translucent;
		normalize: #numberOfCoappearances.
]

{ #category : #'as yet unclassified' }
LesMiserableVisualization >> adjustFontShape [
	self adjustFontShapeFrom: 5 to: 50
]

{ #category : #'as yet unclassified' }
LesMiserableVisualization >> adjustFontShapeFrom: smallFontSize to: bigFontSize [
	"We normalize the font size of the characters using their coappearances"
	RSNormalizer fontSize
		shapes: characters;
		from: smallFontSize;
		to: bigFontSize;
		normalize: #numberOfCoappearances.
]

{ #category : #'as yet unclassified' }
LesMiserableVisualization >> createCharacters [
	"Create a visual element for each character of Les Miserables"
	"Each character is represented as a label"
	characters := model characters
		collect: [ :c |
			RSLabel new size: 5; text: c; model: c ]
		as: RSGroup.

	"Add the characters to the canvas"
	canvas addAll: characters.

	"Make each element have a popup text and is draggable"
	characters @ RSPopup @ RSDraggable.
]

{ #category : #'as yet unclassified' }
LesMiserableVisualization >> createModel [
	"Create the model and create visual characters"
	model := LMModel new create.
	self createCharacters.
]

{ #category : #'as yet unclassified' }
LesMiserableVisualization >> doLayout [
	self doLayout: (RSForceBasedLayout new charge: -1500)
]

{ #category : #'as yet unclassified' }
LesMiserableVisualization >> doLayout: aLayout [
	"Perform the layout on the characters"
	aLayout on: characters
]

{ #category : #initialization }
LesMiserableVisualization >> initialize [
	super initialize.
	canvas := RSCanvas new.

	"The canvas can be zoomed in / out using keys I and O"
	"It can also be navigated using scrollbars"
	canvas @ RSCanvasController.

	self createModel.
]

{ #category : #'as yet unclassified' }
LesMiserableVisualization >> open [
	"Open the Roassal canvas"
	canvas open
]
