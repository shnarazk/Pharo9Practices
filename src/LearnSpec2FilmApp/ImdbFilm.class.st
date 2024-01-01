Class {
	#name : 'ImdbFilm',
	#superclass : 'Object',
	#instVars : [
		'name',
		'year',
		'director'
	],
	#classInstVars : [
		'films'
	],
	#category : 'LearnSpec2FilmApp',
	#package : 'LearnSpec2FilmApp'
}

{ #category : 'accessing' }
ImdbFilm class >> addFilm: aFilm [

    films add: aFilm
]

{ #category : 'accessing' }
ImdbFilm class >> films [

    ^ films ifNil: [ films := OrderedCollection new ]
]
