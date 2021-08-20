"
NHK checker

"
Class {
	#name : #NHKChecker,
	#superclass : #SpApplication,
	#instVars : [
		'json',
		'currentProgram',
		'g1',
		'g2',
		'e1',
		'e2'
	],
	#classVars : [
		'apiKey'
	],
	#category : #MyPackage
}

{ #category : #accessing }
NHKChecker class >> apiKey [

	^ apiKey
]

{ #category : #accessing }
NHKChecker class >> apiKey: aKey [

	apiKey := aKey
]

{ #category : #specs }
NHKChecker class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
		  
]

{ #category : #initialization }
NHKChecker >> initialize [

	| channels |
	json := ZnClient new get:
		        'https://api.nhk.or.jp/v2/pg/now/400/g1.json?key='
		        , self class apiKey.
	json := STON reader on: json readStream.
	channels := json next at: 'nowonair_list'.
	(channels includes: 'g1') ifTrue: [ g1 := channels at: 'g1' ].
	(channels includes: 'g2') ifTrue: [ g2 := channels at: 'g2' ].
	(channels includes: 'e1') ifTrue: [ e1 := channels at: 'e1' ].
	(channels includes: 'e2') ifTrue: [ e2 := channels at: 'e2' ].
]

{ #category : #initialization }
NHKChecker >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'NHK now';
		initialExtent: 700@300
]

{ #category : #updating }
NHKChecker >> loadJSON [

	| channels |
	json := ZnClient new get:
		        'https://api.nhk.or.jp/v2/pg/now/400/g1.json?key='
		        , self class apiKey.
	json := STON reader on: json readStream.
	channels := json next at: 'nowonair_list'.
	g1 := channels at: 'g1'.
	g2 := channels at: 'g2'.
	e1 := channels at: 'e1'.
	e2 := channels at: 'e2'
]

{ #category : #accessing }
NHKChecker >> start [ 
	(NHKCheckerPresenter newApplication: self) openWithSpec 
	
]
