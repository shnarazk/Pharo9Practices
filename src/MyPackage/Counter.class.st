"
# A simple integer counter

## Public API and Key Messages

- `increment`  
- `decrument`
- `get`
- `Count new` returns a new instance initialized zero.

```
c = Counter new
c increment.
c get.
```
 
## Internal Representation and Key Implementation Points.

    Instance Variables
	count:		<Object>


"
Class {
	#name : #Counter,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #MyPackage
}

{ #category : #accessing }
Counter class >> startingAt: anInteger [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	^ self new count: anInteger.
]

{ #category : #accessing }
Counter >> count [
	"Return count"
	"scope: class-variables  &  instance-variables"	
			
	^count
]

{ #category : #accessing }
Counter >> count: aNumber [
	"set the counter's value to aNumber"
	"scope: class-variables  &  instance-variables"	
			
	count := aNumber
]

{ #category : #accessing }
Counter >> increment [
	"Increment the internal counter and return the current value"
	"scope: class-variables  &  instance-variables"	
			
	count := count + 1.
	^count 
]

{ #category : #initialization }
Counter >> initialize [ 
	"Set the initial value of the value to 0"
	"scope: class-variables  &  instance-variables"	
	count := 0
]

{ #category : #printing }
Counter >> printOn: aStream [
	super printOn: aStream .
	aStream nextPutAll: ' with value: '.
	count printOn: aStream.
]
