Class {
	#name : 'BaselineOfLearnSpec2FilmApp',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfLearnSpec2FilmApp',
	#package : 'BaselineOfLearnSpec2FilmApp'
}

{ #category : 'baselines' }
BaselineOfLearnSpec2FilmApp >> baseline: spec [

    <baseline>
    spec for: #common do: [ spec package: 'LearnSpec2FilmApp' ]
]
