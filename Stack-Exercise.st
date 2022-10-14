!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'anOOStack aSentenceFinder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'CG 10/13/2022 22:43:04'!
setUp
	anOOStack := OOStack new.
	aSentenceFinder := SentenceFinderByPrefix new.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'CG 10/13/2022 23:28:07'!
test01sentenceFinderRaiseEmptyPrefixException
	self  should: [ aSentenceFinder find: '' withAnOOStack: anOOStack ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix emptyPrefixErrorDescription equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'CG 10/13/2022 23:27:22'!
test02sentenceFinderRaiseMultipleWordsException
	self  should: [ aSentenceFinder find: 'The Winter' withAnOOStack: anOOStack ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix prefixWithMoreThanOneWordErrorDescription equals: anError messageText ]
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'CG 10/13/2022 23:26:29'!
test03sentenceFinderFindsAMatch
	|sentencesFound|
	anOOStack push: 'The Winter'.
	
	sentencesFound := aSentenceFinder find: 'The' withAnOOStack: anOOStack.
	
	self assert: (sentencesFound size == 1).! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'CG 10/13/2022 23:26:04'!
test04sentenceFinderFindsMultipleMatches
	|sentencesFound|
	anOOStack push: 'The Winter'.
	anOOStack push: 'The Winter Is Coming'.
	
	sentencesFound := aSentenceFinder find: 'The' withAnOOStack: anOOStack.
	
	self assert: (sentencesFound size == 2).! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'CG 10/13/2022 23:25:24'!
test05sentenceFinderIsCaseSensitive
	|sentencesFound|
	anOOStack push: 'The Winter'.
	
	sentencesFound := aSentenceFinder find: 'the' withAnOOStack: anOOStack.
	
	self assert: (sentencesFound size == 0).! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'CG 10/13/2022 23:30:56'!
test06sentenceFinderCanNotFindMatches
	|sentencesFound|
	anOOStack push: 'The Winter'.
	anOOStack push: 'The Winter is Coming'.
	anOOStack push: 'The Winter is cold'.
	
	sentencesFound := aSentenceFinder find: 'Messi' withAnOOStack: anOOStack.
	
	self assert: (sentencesFound isEmpty).! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'CG 10/13/2022 23:33:27'!
test07sentenceFinderLeavesStackUntouched
	anOOStack push: 'The Winter'.
	anOOStack push: 'The Winter is Coming'.
	anOOStack push: 'The Winter is cold'.
	
	aSentenceFinder find: 'Messi' withAnOOStack: anOOStack.
	
	self assert: (anOOStack size == 3).! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'CG 10/13/2022 23:36:11'!
test08sentenceFinderFindsSentenceFromPartialPrefix
	|sentencesFound|
	anOOStack push: 'The Winter'.
	anOOStack push: 'Winter is Coming'.
	anOOStack push: 'Cold'.
	
	sentencesFound := aSentenceFinder find: 'Col' withAnOOStack: anOOStack.
	
	self assert: ((sentencesFound at:1) = 'Cold').! !


!classDefinition: #Base category: 'Stack-Exercise'!
Object subclass: #Base
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Base methodsFor: 'as yet unclassified' stamp: 'jr 10/13/2022 13:01:54'!
anterior
	^ OOStack error: OOStack stackEmptyErrorDescription! !

!Base methodsFor: 'as yet unclassified' stamp: 'jr 10/13/2022 13:00:33'!
value
	^ OOStack error: OOStack stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Base class' category: 'Stack-Exercise'!
Base class
	instanceVariableNames: ''!

!Base class methodsFor: 'as yet unclassified' stamp: 'CG 10/11/2022 21:21:34'!
with: aString
	| result |
	result := self new.
	result value: aString.
	
	^result! !


!classDefinition: #Elemento category: 'Stack-Exercise'!
Object subclass: #Elemento
	instanceVariableNames: 'value anterior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Elemento methodsFor: 'as yet unclassified' stamp: 'jr 10/13/2022 12:43:28'!
anterior: anAnterior
	anterior := anAnterior! !

!Elemento methodsFor: 'as yet unclassified' stamp: 'CG 10/11/2022 21:30:56'!
value
	^value! !

!Elemento methodsFor: 'as yet unclassified' stamp: 'CG 10/11/2022 21:02:44'!
value: aValue
	value := aValue! !


!Elemento methodsFor: 'xxx' stamp: 'jr 10/13/2022 13:03:09'!
anterior
	^ anterior! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Elemento class' category: 'Stack-Exercise'!
Elemento class
	instanceVariableNames: ''!

!Elemento class methodsFor: 'class initialization' stamp: 'jr 10/13/2022 12:42:32'!
with: aString over: anAnterior

	| result |
	
	result := self new.
	
	result value: aString.
	
	result anterior: anAnterior.
	
	^result! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'jr 10/13/2022 12:56:20'!
initialize
	size := 0.
	top := Base new. ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'jr 10/13/2022 12:40:31'!
isEmpty	
	^ (top isKindOf:Base)
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'jr 10/13/2022 13:02:18'!
pop
	| result |
	result := top.
	top := result anterior.
	^ result value.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'jr 10/13/2022 12:41:01'!
push: unaCadena
	size := size + 1.
	top := Elemento with: unaCadena over: top	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'jr 10/13/2022 12:40:48'!
size 
	^ size.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'jr 10/13/2022 13:12:36'!
top
	^top value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'CG 10/13/2022 23:02:06'!
assertPrefix: aPrefixToAssert

	(aPrefixToAssert = ''	) ifTrue: [ self error: SentenceFinderByPrefix emptyPrefixErrorDescription].

	(aPrefixToAssert findString: ' '	)  > 0 ifTrue: [ self error: SentenceFinderByPrefix prefixWithMoreThanOneWordErrorDescription]! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'CG 10/13/2022 22:37:32'!
find: aPrefixToBeFound withAnOOStack: anOOStack
	|auxStack sentencesFound|
	
	self assertPrefix: aPrefixToBeFound.
	
	auxStack := anOOStack copy.
	sentencesFound := OrderedCollection new.
	
	anOOStack size timesRepeat: [ 
		| stringPoped |
		stringPoped := auxStack pop.
		(stringPoped beginsWith: aPrefixToBeFound) ifTrue: [ sentencesFound add: stringPoped ].
				 ].
	
	^sentencesFound.
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'CG 10/13/2022 22:38:12'!
emptyPrefixErrorDescription
	^'Prefix can not be empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'CG 10/13/2022 22:38:31'!
prefixWithMoreThanOneWordErrorDescription
	^'Prefix can only be one word'! !
