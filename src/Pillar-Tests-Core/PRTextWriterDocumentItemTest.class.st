Class {
	#name : #PRTextWriterDocumentItemTest,
	#superclass : #PRBasicObjectTest,
	#category : #'Pillar-Tests-Core-TextWriter'
}

{ #category : #private }
PRTextWriterDocumentItemTest >> actualClass [
	^ PRDocumentItem
]

{ #category : #utilities }
PRTextWriterDocumentItemTest >> addText: aString to: aDocumentItem [
	^ aDocumentItem
		add: (PRText content: aString);
		yourself
]

{ #category : #private }
PRTextWriterDocumentItemTest >> barInstance [
	^ PRText content: 'bar'
]

{ #category : #private }
PRTextWriterDocumentItemTest >> fooInstance [
	^ PRText content: 'foo'
]

{ #category : #private }
PRTextWriterDocumentItemTest >> foobarInstances [
	^ Array with: self fooInstance with: self barInstance
]

{ #category : #helper }
PRTextWriterDocumentItemTest >> parser [
	^ PRDocument parser
]

{ #category : #utilities }
PRTextWriterDocumentItemTest >> parserAssertWiki: aString equalsTree: aDocument [
	"Assert that parsing aString results in aDocument."

	self
		assert: (self parser parse: aString) = aDocument
		description: aString resumable: true
]

{ #category : #utilities }
PRTextWriterDocumentItemTest >> pillarWriterAssertTree: aDocument equalsWiki: aString [
	"Assert that traversing aDocument using the wiki writer results in aString."

	self assert: (PRPillarWriter write: aDocument) = aString description: aString resumable: false
]

{ #category : #utilities }
PRTextWriterDocumentItemTest >> textWriterAssertTree: aDocument equalsText: aString [
	self assert: (PRTextWriter write: aDocument) = aString description: aString resumable: true
]