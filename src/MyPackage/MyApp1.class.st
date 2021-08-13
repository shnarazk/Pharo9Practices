"
# An example to make a customized Spec application

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #MyApp1,
	#superclass : #SpApplication,
	#category : #MyPackage
}

{ #category : #accessing }
MyApp1 >> start [ 
	^ (self new: SpPresenter) openWithSpec .
]
