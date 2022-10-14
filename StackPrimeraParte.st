!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'as yet unclassified' stamp: 'CG 10/14/2022 14:24:09'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := Stack new.
	
	self assert: stack isEmpty! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'CG 10/14/2022 14:39:38'!
test02StackShouldPushElement
	| stack |
	
	stack := Stack new.
	
	stack push: 'Winter is Coming'.
	
	self assert: stack size = 1! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'CG 10/14/2022 14:49:52'!
test03StackShouldPopElement
	| stack |
	
	stack := Stack new.
	
	stack push: 'Winter is Coming'.
	
	stack pop.
	
	self assert: stack isEmpty.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'CG 10/14/2022 14:51:53'!
test04PopShouldReturnLastElement
	| stack lastElement|
	
	stack := Stack new.
	
	stack push: 'Winter is Coming'.
	
	stack push: 'Winter is Here'.
		
	lastElement := stack pop.
	
	self assert: lastElement = 'Winter is Here'.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'CG 10/14/2022 14:53:19'!
test05TopShouldReturnLastElementWithoutChangingStack
	| stack|
	
	stack := Stack new.
	
	stack push: 'Winter is Coming'.
	
	stack push: 'Winter is Here'.
		
	stack top.
	
	self assert: stack size = 2.! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'aStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'as yet unclassified' stamp: 'CG 10/14/2022 14:03:33'!
initialize
	aStack := OrderedCollection new.! !

!Stack methodsFor: 'as yet unclassified' stamp: 'CG 10/14/2022 14:38:50'!
isEmpty
	^(aStack size = 0)! !

!Stack methodsFor: 'as yet unclassified' stamp: 'CG 10/14/2022 14:13:07'!
pop
	^aStack removeLast.! !

!Stack methodsFor: 'as yet unclassified' stamp: 'CG 10/14/2022 14:08:57'!
push: anElementToBePushed
	aStack add: anElementToBePushed! !

!Stack methodsFor: 'as yet unclassified' stamp: 'CG 10/14/2022 14:41:58'!
size
	^aStack size.! !

!Stack methodsFor: 'as yet unclassified' stamp: 'CG 10/14/2022 14:19:18'!
top
	|auxStack|
	
	auxStack := aStack copy.
	
	^auxStack removeLast.
	! !
