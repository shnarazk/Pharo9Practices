Extension { #name : #Heap }

{ #category : #'*Advent-of-Code-2016' }
Heap >> untilEmpty: aBlock [

[ self isEmpty  ] whileFalse: [ 
	aBlock value:  self removeFirst .
 ]
]
