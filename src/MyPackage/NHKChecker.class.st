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
<<<<<<< HEAD
		'e2'
	],
	#classVars : [
		'apiKey'
=======
		'e2',
		'key'
>>>>>>> 855c76d (Add NHKchecker transported from a Swift program)
	],
	#category : #MyPackage
}

<<<<<<< HEAD
{ #category : #accessing }
NHKChecker class >> apiKey [

	^ apiKey
]

{ #category : #accessing }
NHKChecker class >> apiKey: aKey [

	apiKey := aKey
]

=======
>>>>>>> 855c76d (Add NHKchecker transported from a Swift program)
{ #category : #specs }
NHKChecker class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
		  
]

<<<<<<< HEAD
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
=======
{ #category : #'instance creation' }
NHKChecker class >> newWithKey: aKey [
  ^ self new key: aKey
]

{ #category : #initialization }
NHKChecker >> initialize [

	g1 := Dictionary new.
	g2 := Dictionary new.
	e1 := Dictionary new.
	e2 := Dictionary new.
>>>>>>> 855c76d (Add NHKchecker transported from a Swift program)
]

{ #category : #initialization }
NHKChecker >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'NHK now';
		initialExtent: 700@300
]

<<<<<<< HEAD
{ #category : #updating }
=======
{ #category : #accessing }
NHKChecker >> key: aKey [
  key := aKey
]

{ #category : #initialization }
>>>>>>> 855c76d (Add NHKchecker transported from a Swift program)
NHKChecker >> loadJSON [

	| channels |
	json := ZnClient new get:
<<<<<<< HEAD
		        'https://api.nhk.or.jp/v2/pg/now/400/g1.json?key='
		        , self class apiKey.
=======
		        ('https://api.nhk.or.jp/v2/pg/now/400/g1.json?key=', key).
>>>>>>> 855c76d (Add NHKchecker transported from a Swift program)
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
