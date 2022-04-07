"
Start this application by `TODOApplication new run`.
"
Class {
	#name : #TODOApplication,
	#superclass : #SpApplication,
	#category : #MyPackage
}

{ #category : #running }
TODOApplication >> start [

	(TODOListPresenter newApplication: self) open
]
