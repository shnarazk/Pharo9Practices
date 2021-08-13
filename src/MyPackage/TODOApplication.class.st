"
Start this application by `TODOApplication new run`.
"
Class {
	#name : #TODOApplication,
	#superclass : #SpApplication,
	#category : #MyPackage
}

{ #category : #accessing }
TODOApplication >> start [ 
	(TODOListPresenter newApplication: self) openWithSpec 
	
]
