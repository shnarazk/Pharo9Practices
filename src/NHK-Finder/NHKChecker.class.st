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
		'channels',
		'channel'
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
NHKChecker class >> run [

	^ self new
		  run;
		  yourself
]

{ #category : #running }
NHKChecker class >> run: aKey [
 self apiKey: aKey.
self new start.
]

{ #category : #accessing }
NHKChecker >> channel [

	^ channel
]

{ #category : #accessing }
NHKChecker >> channel: anObject [

	channel := anObject.
	self loadJSON .
]

{ #category : #accessing }
NHKChecker >> channelContent: aChannel [

	aChannel ifNil: [ ^ OrderedCollection new ].
	^ (channels at: aChannel) value asOrderedCollection 
]

{ #category : #accessing }
NHKChecker >> channels [

	^ channels
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

{ #category : #accessing }
NHKChecker >> selectedContent [

	channel ifNil: [ ^ OrderedCollection new ].
	^ (channels at: channel) value asOrderedCollection
]

{ #category : #running }
NHKChecker >> start [

	(NHKCheckerPresenter newApplication: self) open
]
