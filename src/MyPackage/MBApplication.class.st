Class {
	#name : #MBApplication,
	#superclass : #SpApplication,
	#category : #MyPackage
}

{ #category : #accessing }
MBApplication >> start [

	^ (self new: MBPresenter) openWithSpec
]
