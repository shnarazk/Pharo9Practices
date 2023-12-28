"
I'm a more efficient pi calcurator.
As shown below,  a pair of a positive term and the successive, negative term requires only a single division.

$$
\frac{\pi}{4} = \frac{2.0}{1.0 \times 3.0} +  \frac{2.0}{5.0 \times 7.0} +  \frac{2.0}{9.0 \times11.0} + \cdots
$$

"
Class {
	#name : 'PiFinderFloat3',
	#superclass : 'PiFinderFloat2',
	#category : 'Pi Finder',
	#package : 'Pi Finder'
}

{ #category : 'instance creation' }
PiFinderFloat3 class >> runTo: pairs [

	| denominator currSum |
	denominator := -1.
	currSum := 0.
	pairs timesRepeat: [
		| tmp |
		denominator := denominator + 4.
		tmp := denominator asFloat.
		currSum := currSum + (2.0 / (tmp * (tmp - 2.0))) ].
	^ 4.0 * currSum
]

{ #category : 'initialization' }
PiFinderFloat3 >> initialize [
super initialize .
	currSum := 0.
	denominator := -1
]

{ #category : 'stepping' }
PiFinderFloat3 >> step [
	"Compute a new term and accumulate it into currSum."

	| tmp |
	denominator := denominator + 4.
	tmp := denominator asFloat.
	currSum := currSum + (2.0 / (tmp * (tmp - 2.0)))
]
