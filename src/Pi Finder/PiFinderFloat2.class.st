"
I'm a more efficient pi calcurator.
As shown below, a positive term and the successive, negative term make a computaion unit.


$$
\frac{\pi}{4.0} = (\frac{1.0}{1.0} - \frac{1.0}{3.0}) +  (\frac{1.0}{5.0} - \frac{1.0}{7.0}) +  (\frac{1.0}{9.0} - \frac{1.0}{11.0}) + \cdots
$$


"
Class {
	#name : 'PiFinderFloat2',
	#superclass : 'PiFinderFloat',
	#category : 'Pi Finder',
	#package : 'Pi Finder'
}

{ #category : 'instance creation' }
PiFinderFloat2 class >> runTo: pairs [

	| pf |
	pf := self new.
	pairs timesRepeat: [ pf step ].
	^ pf pi
]

{ #category : 'stepping' }
PiFinderFloat2 >> step [
	"Compute a new term and accumulate it into currSum."

	currSum := currSum - (1.0 / denominator).
	denominator := denominator + 2.
	currSum := currSum + (1.0 / denominator).
	denominator := denominator + 2
]
