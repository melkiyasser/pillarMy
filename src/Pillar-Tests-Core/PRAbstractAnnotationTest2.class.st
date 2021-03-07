Class {
	#name : #PRAbstractAnnotationTest2,
	#superclass : #PRParseDocumentItemTest2,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRAbstractAnnotationTest2 class >> isAbstract [
	^ self = PRAbstractAnnotationTest2
]

{ #category : #helpers }
PRAbstractAnnotationTest2 >> actualClass [
	^ self subclassResponsibility
]

{ #category : #helpers }
PRAbstractAnnotationTest2 >> annoteName [
	^ self actualClass tag
]

{ #category : #helpers }
PRAbstractAnnotationTest2 >> referenceParameters [
	self subclassResponsibility
]

{ #category : #helpers }
PRAbstractAnnotationTest2 >> referenceString [
	"Pay attention to order the parameters according to sorted"
	self
		subclassResponsibility
]

{ #category : #tests }
PRAbstractAnnotationTest2 >> testAsPillar [
	| wiki tree |
	wiki := '${' , self referenceString , '}$'.
	tree := self actualClass withParameters: self referenceParameters.
	self assert: tree asPillar equals: wiki
]

{ #category : #tests }
PRAbstractAnnotationTest2 >> testParse [
	| wiki tree |
	wiki := '${' , self referenceString , '}$'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (self actualClass withParameters: self referenceParameters);
				yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #tests }
PRAbstractAnnotationTest2 >> testParsedHadAllKeys [

	self assert: (self parser parse:  '${' , self referenceString , '}$') children first children first hadAllKeys
]

{ #category : #tests }
PRAbstractAnnotationTest2 >> testWithParameters [

	self assert: (self actualClass withParameters: self referenceParameters) hadAllKeys
]