Class {
	#name : #PRPillarWriterDocumentItemTest,
	#superclass : #PRBasicObjectTest,
	#category : #'Pillar-Tests-Core-PillarWriter'
}

{ #category : #private }
PRPillarWriterDocumentItemTest >> actualClass [
	^ PRDocumentItem
]

{ #category : #utilities }
PRPillarWriterDocumentItemTest >> addText: aString to: aDocumentItem [
	^ aDocumentItem
		add: (PRText content: aString);
		yourself
]

{ #category : #private }
PRPillarWriterDocumentItemTest >> barInstance [
	^ PRText content: 'bar'
]

{ #category : #private }
PRPillarWriterDocumentItemTest >> fooInstance [
	^ PRText content: 'foo'
]

{ #category : #private }
PRPillarWriterDocumentItemTest >> foobarInstances [
	^ Array with: self fooInstance with: self barInstance
]

{ #category : #helper }
PRPillarWriterDocumentItemTest >> parser [
	^ PRDocument parser
]

{ #category : #utilities }
PRPillarWriterDocumentItemTest >> parserAssertWiki: aString equalsTree: aDocument [
	"Assert that parsing aString results in aDocument."

	self
		assert: (self parser parse: aString) = aDocument
		description: aString resumable: true
]

{ #category : #utilities }
PRPillarWriterDocumentItemTest >> pillarWriterAssertTree: aDocument equalsWiki: aString [
	"Assert that traversing aDocument using the wiki writer results in aString."

	self assert: (PRPillarWriter write: aDocument) = aString description: aString resumable: false
]

{ #category : #utilities }
PRPillarWriterDocumentItemTest >> textWriterAssertTree: aDocument equalsText: aString [
	self assert: (PRTextWriter write: aDocument) = aString description: aString resumable: true
]