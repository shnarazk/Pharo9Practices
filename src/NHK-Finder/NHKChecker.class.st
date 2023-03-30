"
NHK checker

**After setting your API key** with `NHKChecker apiKey: 'xxxx'`, just run in Playground:

```language=Pharo
   NHKChecker new start.
```

Or the most easy way is:
```
NHKCheker run: apikey
```
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
	#category : #'NHK-Finder'
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

{ #category : #running }
NHKChecker class >> run: aKey [
 self apiKey: aKey.
self new start.
]

{ #category : #accessing }
NHKChecker >> channels [

	^ channels
]

{ #category : #accessing }
NHKChecker >> currentProgram [
^ currentProgram 
]

{ #category : #initialization }
NHKChecker >> initialize [

	self loadJSON.
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

	| apiKey loaded |
	apiKey := self class apiKey.
	apiKey ifNil: [ ^ self ].
	loaded := ZnClient new get:
		          'https://api.nhk.or.jp/v2/pg/now/400/g1.json?key='
		          , apiKey.
	json := STON reader on: loaded readStream.
	channels := json next at: 'nowonair_list'.
	g1 := channels at: 'g1' ifAbsent: [ nil ].
	g2 := channels at: 'g2' ifAbsent: [ nil ].
	e1 := channels at: 'e1' ifAbsent: [ nil ].
	e2 := channels at: 'e2' ifAbsent: [ nil ]
]

{ #category : #running }
NHKChecker >> start [

	(NHKCheckerPresenter newApplication: self) open
]
