Extension { #name : #Boolean }

{ #category : #'*Advent-of-Code-2016' }
Boolean >> asTrapPairedWith: other [

^ self xor: other

]
