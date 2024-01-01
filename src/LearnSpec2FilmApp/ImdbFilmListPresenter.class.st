Class {
	#name : 'ImdbFilmListPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'filmList'
	],
	#category : 'LearnSpec2FilmApp',
	#package : 'LearnSpec2FilmApp'
}

{ #category : 'adding' }
ImdbFilmListPresenter >> addFilm [
    "empty for now"

    
]

{ #category : 'layout' }
ImdbFilmListPresenter >> defaultLayout [

    ^ SpBoxLayout newTopToBottom add: filmList; yourself
]

{ #category : 'initialization' }
ImdbFilmListPresenter >> initializePresenters [

    filmList := self newTable addColumn: (SpStringTableColumn title: 'Name' evaluated: #name); addColumn:
                        (SpStringTableColumn title: 'Director' evaluated: #director); addColumn:
                        (SpStringTableColumn title: 'Year' evaluated: #year); yourself
]

{ #category : 'initialization' }
ImdbFilmListPresenter >> initializeWindow: aWindowPresenter [

    | button |
    aWindowPresenter title: 'Mini IMDB'; initialExtent: 600 @ 400.
    button := self newToolbarButton.
    button label: 'Add film'; icon: (self iconNamed: #smallAdd); action: [ self addFilm ].
    aWindowPresenter toolbar: (self newToolbar add: button; yourself)
]

{ #category : 'initialization' }
ImdbFilmListPresenter >> updatePresenter [

    filmList items: ImdbFilm films
]
