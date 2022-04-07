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
		'e2',
		'channels'
	],
	#classVars : [
		'ApiKey'
	],
	#category : #MyPackage
}

{ #category : #accessing }
NHKChecker class >> apiKey [

	^ ApiKey
]

{ #category : #accessing }
NHKChecker class >> apiKey: aKey [

	ApiKey := aKey
]

{ #category : #specs }
NHKChecker class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
		  
]

{ #category : #accessing }
NHKChecker >> channels [

	^ channels
]

{ #category : #initialization }
NHKChecker >> initialize [

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

{ #category : #accessing }
NHKChecker >> json [

	^ json
]

{ #category : #updating }
NHKChecker >> loadJSON [

	| loaded |
	loaded := ZnClient new get:
		        'https://api.nhk.or.jp/v2/pg/now/400/g1.json?key='
		        , self class apiKey.
	json := STON reader on: loaded readStream.
	channels := json next at: 'nowonair_list'.
	g1 := channels at: 'g1'.
	"g2 := channels at: 'g2'."
	"e1 := channels at: 'e1'."
	"e2 := channels at: 'e2'"
]

{ #category : #running }
NHKChecker >> start [

	(NHKCheckerPresenter newApplication: self) open
]
