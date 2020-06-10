Class {
	#name : #PRMicrodownWriter,
	#superclass : #PRDocumentWriter,
	#instVars : [
		'nesting'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #accessing }
PRMicrodownWriter >> canvasClass [
	^ PRMicrodownCanvas
]

{ #category : #accessing }
PRMicrodownWriter >> start: anObject [
	nesting := OrderedCollection new.
	super start: anObject
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitAnnotatedParagraph: anAnnotatedParagraph [
	"
	Annotated paragraph in microdown is 
	
	!!label paragraph
	
	
	"

	canvas annotatedAnnotation: anAnnotatedParagraph annotation.
	self visitParagraph: anAnnotatedParagraph
	
]

{ #category : #'visit - formatting' }
PRMicrodownWriter >> visitBoldFormat: aFormat [

	canvas bold: aFormat text
]

{ #category : #visiting }
PRMicrodownWriter >> visitCommentedLine: aCommentedLine [
	canvas comment: aCommentedLine text
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitExternalLink: anExternalLink [
	canvas externalLink: anExternalLink reference path withDescription: anExternalLink text
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitFigure: aFigure [
	| figureName figureLink |
	figureName := aFigure text.
	figureLink := aFigure reference path.
	canvas figure: figureLink withDescription: figureName.
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitHeader: aHeader [
	| level |
	level := aHeader level min: 6 max: 1.
	canvas duringHeaderLevel: level do: [ super visitHeader: aHeader ]
]

{ #category : #'visit - formatting' }
PRMicrodownWriter >> visitItalicFormat: aFormat [
	canvas italic: aFormat text
]

{ #category : #'visit - formatting' }
PRMicrodownWriter >> visitMonospaceFormat: aFormat [
	canvas monospace: aFormat text
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitPreformatted: aPreformatted [
	canvas writeIndentedCodeBlockDuring: [
		aPreformatted children
			do: [ :child | self visit: child ]
			separatedBy: [canvas newLine ] ]
]

{ #category : #'visit - formatting' }
PRMicrodownWriter >> visitStrikethroughFormat: aFormat [
	canvas strike: aFormat text
]