"
I am a pi calculator using only float ind int as following. So I'm supposed to be fast.

$$
\frac{\pi}{4.0} = \frac{1.0}{1.0} - \frac{1.0}{3.0} +  \frac{1.0}{5.0} - \frac{1.0}{7.0} +  \frac{1.0}{9.0} - \frac{1.0}{11.0} + \cdots
$$

"
Class {
	#name : 'PiFinderFloat',
	#superclass : 'PiFinder',
	#category : 'Pi Finder',
	#package : 'Pi Finder'
}

{ #category : 'stepping' }
PiFinderFloat >> step [
	"Compute a new term and accumulate it into currSum."

	currSum := adding
		           ifTrue: [ currSum + (1.0 / denominator) ]
		           ifFalse: [ currSum - (1.0 / denominator) ].
	denominator := denominator + 2.
	adding := adding not
]
