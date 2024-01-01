Class {
	#name : 'ImdbFilmPresenter',
	#superclass : 'SpPresenter',
	#classTraits : '{} + TraitedClass',
	#instVars : [
		'nameText',
		'directorText',
		'yearNumber'
	],
	#category : 'LearnSpec2FilmApp',
	#package : 'LearnSpec2FilmApp'
}

{ #category : 'layout' }
ImdbFilmPresenter >> defaultLayout [

    ^ SpGridLayout build: [ :builder |
          builder beColumnNotHomogeneous;
              column: 2 withConstraints: #beExpand;
              add: 'Name';
              add: nameText;
              nextRow;
              add: 'Director';
              add: directorText;
              nextRow;
              add: 'Year';
              add: yearNumber ]
]

{ #category : 'accessing' }
ImdbFilmPresenter >> director [

    ^ directorText text
]

{ #category : 'initialization' }
ImdbFilmPresenter >> initializeDialogWindow: aDialogPresenter [

    aDialogPresenter centered.
    aDialogPresenter addButton: 'Cancel' do: [ :presenter | presenter close ];
        addButton: 'Save Film' do: [ :preseter |
            preseter beOk;
                close ]
]

{ #category : 'initialization' }
ImdbFilmPresenter >> initializePresenters [

    nameText := self newTextInput.
    directorText := self newTextInput.
    yearNumber := self newNumberInput rangeMinimum: 1900 maximum: Year currentYear;
                      yourself
]

{ #category : 'initialization' }
ImdbFilmPresenter >> initializeWindow: aWindowPresenter [

    aWindowPresenter title: 'Film';
        initialExtent: 400 @ 200
]

{ #category : 'accessing' }
ImdbFilmPresenter >> name [

    ^ nameText text
]

{ #category : 'accessing' }
ImdbFilmPresenter >> yearNumber [

    ^ yearNumber text
]
