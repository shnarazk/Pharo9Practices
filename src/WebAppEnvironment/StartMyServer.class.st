"
I'm a cliss to start some web server.
"
Class {
	#name : #StartMyServer,
	#superclass : #Object,
	#category : #WebAppEnvironment
}

{ #category : #samples }
StartMyServer class >> echo [
     self flag:  #TODO.
	Transcript show: 'OK'
]
