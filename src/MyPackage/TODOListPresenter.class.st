"
UI spec for tasks represented by a collection of `TODOTask`
- 追加
- 削除
- 新規登録
"
Class {
	#name : #TODOListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'todoListPresenter'
	],
	#category : #MyPackage
}

{ #category : #adding }
TODOListPresenter >> addTask [

	(TODOTaskPresenter newApplication: self application)
		task: TODOTask new;
		openModalWithSpec.
	self updatePresenter
]

{ #category : #adding }
TODOListPresenter >> editSelectedTask [

	(TODOTaskPresenter newApplication: self application)
		task: todoListPresenter selection selectedItem;
		openModalWithSpec.
	self updatePresenter
]

{ #category : #initialization }
TODOListPresenter >> initializePresenters [

	| addButton |
	todoListPresenter := self newTable
		                     addColumn:
			                     ((SpCheckBoxTableColumn evaluated: [ :task | 
					                       task isDone ])
				                      width: 20;
				                      onActivation: [ :task | task done: true ];
				                      onDeactivation: [ :task | task done: false ];
				                      yourself);
		                     addColumn:
		                     (SpStringTableColumn
			                      title: 'タイトル'
			                      evaluated: [ :task | task title ]);
		                     contextMenu: self todoListContextMenu;
		                     yourself.

	addButton := self newButton
		             label: 'タスクを追加';
		             action: [ self addTask ];
		             yourself.
	self layout: (SpBoxLayout newVertical
			 spacing: 5;
			 add: todoListPresenter;
			 add: (SpBoxLayout newHorizontal
					  addLast: addButton expand: false;
					  yourself)
			 expand: false;
			 yourself)
]

{ #category : #initialization }
TODOListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'TODO list';
		initialExtent: 500@500
]

{ #category : #adding }
TODOListPresenter >> removeSelectedTask [

	todoListPresenter selection selectedItem remove.
	self updatePresenter
]

{ #category : #initialization }
TODOListPresenter >> todoListContextMenu [

	^ self newMenu
		  addItem: [ :item | 
			  item
				  name: '編集する...';
				  action: [ self editSelectedTask ] ];
		  addItem: [ :item | 
			  item
				  name: '削除する...';
				  action: [ self removeSelectedTask ] ]
]

{ #category : #initialization }
TODOListPresenter >> updatePresenter [ 
	todoListPresenter items: TODOTask selectAll asOrderedCollection 
]
