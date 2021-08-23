"
Sample 1

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #MyClass,
	#superclass : #Object,
	#classVars : [
		'apiKey'
	],
	#category : #MyPackage
}

{ #category : #'as yet unclassified' }
MyClass class >> apiKey: aKey [

	apiKey := aKey
]
