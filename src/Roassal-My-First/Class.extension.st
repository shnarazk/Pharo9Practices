Extension { #name : #Class }

{ #category : #'*Roassal-My-First' }
Class >> inspectorTreeBuilder [
<inspectorPresentationOrder: 1 title: 'Subclass Hierarchy'>
^TreeClassBuilder new classes: self withAllSubclasses ; asPresenter 
]
