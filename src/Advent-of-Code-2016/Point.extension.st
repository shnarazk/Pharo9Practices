Extension { #name : #Point }

{ #category : #'*Advent-of-Code-2016' }
Point >> between: leftTop and: rightBottom [

	^ leftTop <= self and: [ self <= rightBottom ]
]
