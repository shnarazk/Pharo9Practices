"
Compute the Pi with Leibniz formula.

```
200000 timesRepeat: [ pf step ].
```

returns
```
3.1415976535647934
```

Or simply run:

```language=Pharo
PiFinder runTo: 200000
```
"
Class {
	#name : #PiFinder,
	#superclass : #Object,
	#instVars : [
		'currSum',
		'denominator',
		'adding'
	],
	#category : #'Pi Finder'
}

{ #category : #'instance creation' }
PiFinder class >> runTo: limit [

	| pf |
	pf := self new.
	limit timesRepeat: [ pf step ].
	^ pf pi
]

{ #category : #initialization }
PiFinder >> initialize [ 
 currSum := 1.
 denominator := 3.
 adding := false.
]

{ #category : #accessing }
PiFinder >> pi [

	^ (currSum * 4) asFloat
]

{ #category : #stepping }
PiFinder >> step [

	"Compute a new term and accumulate it into currSum."

	| frac |
	frac := Fraction new.
	frac setNumerator: 1 denominator: denominator.
	currSum := adding
		           ifTrue: [ currSum + frac ]
		           ifFalse: [ currSum - frac ].
	denominator := denominator + 2.
	adding := adding not
]
