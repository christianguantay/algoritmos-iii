!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CG 11/11/2022 17:17:22'!
test01EmptyPortfolioShouldHaveZeroBalance
	| portfolio |
	
	portfolio := Portfolio with: {}.
	
	self assert: 0*peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CG 11/11/2022 17:14:36'!
test02PortfolioWithAnAccountShouldHaveTheSameBalanceAsTheAccount
	| portfolio anAccount |
	
	anAccount := ReceptiveAccount new.
	
	Deposit register: 50*peso on: anAccount.
	portfolio := Portfolio with: {anAccount}.
	
	self assert: anAccount balance equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CG 11/11/2022 17:23:46'!
test03PortfolioWithMultipleAccountsShouldHaveTheSameBalanceAsTheSumOfTheBalanceOfTheAccounts
	| portfolio anAccount aSecondAccount|
	
	anAccount := ReceptiveAccount new.
	aSecondAccount := ReceptiveAccount new.
		
	Deposit register: 50*peso on: anAccount.
	Deposit register: 50*peso on: aSecondAccount.
	
	portfolio := Portfolio with: {anAccount. aSecondAccount.}.
	
	self assert: 100*peso equals: portfolio balance.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jr 11/11/2022 01:21:39'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 
	| account |
	
	account := ReceptiveAccount new.
	self assert: 0 equals: account balance! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jr 11/11/2022 00:12:45'!
test02DepositIncreasesBalanceOnTransactionValue
	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
	
	self assert: 100 * peso equals: account balance.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jr 11/10/2022 14:33:39'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	
	Withdraw register: 50 * peso on: account.
	
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jr 11/10/2022 15:08:02'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jr 11/11/2022 01:35:01'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
	
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'jr 11/11/2022 02:04:05'!
test01CantTransferBetweenTwoAccountsWithZeroBalance
	
	| account1 account2|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Transfer register: 60 * peso from: account1 to: account2.
	
	self assert: 60 * peso equals: account2 balance
	
	
	! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'jr 11/11/2022 02:03:50'!
test01transferBetweenTwoAccountsIncreasesTheBalance
	
	| account1 account2|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account1.
	
	Transfer register: 60 * peso from: account1 to: account2.
	
	self assert: 60 * peso equals: account2 balance
	
	
	! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'jr 11/11/2022 02:04:00'!
test02transferBetweenTwoAccountsDecreasesTheBalance
	
	| account1 account2|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.

	Deposit register: 100 * peso on: account1.
	
	Transfer register: 60 * peso from: account1 to: account2.
	
	self assert: 40 * peso equals: account1 balance
	
	
	! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'jr 11/11/2022 03:54:35'!
test03TransferKnowsHisDepositLeg

	| account1 account2 transfer |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transfer := Transfer register: 60 * peso from: account1 to: account2.
	
	self assert: transfer depositLeg value equals: account2! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'jr 11/11/2022 03:58:11'!
test04TransferKnowsHisWithdrawLeg

	| account1 account2 transfer |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transfer := Transfer register: 60 * peso from: account1 to: account2.
	
	self assert: transfer withdrawLeg value equals: account1! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'jr 11/11/2022 03:40:19'!
test05TransferDepositLegKnowsHisCounterpart

	| account1 account2 transfer |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transfer := Transfer register: 60 * peso from: account1 to: account2.
	
	self assert: transfer withdrawLeg counterpart equals: account2! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'jr 11/11/2022 03:58:47'!
test06TransferWithdrawLegKnowsHisCounterpart

	| account1 account2 transfer |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transfer := Transfer register: 60 * peso from: account1 to: account2.
	
	self assert: transfer depositLeg counterpart equals: account1! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'jr 11/11/2022 01:46:07'!
value 
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'jr 11/10/2022 14:54:29'!
register: aValue on: account

	| transaction |.
	transaction := self for: aValue.
	
	account register: transaction.
	
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'jr 11/11/2022 01:45:36'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Transfer
	instanceVariableNames: 'value depositLeg withdrawLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initializatiopn' stamp: 'jr 11/11/2022 03:51:22'!
register: aValue from: withdrawAccount to: depositAccount 
	
	value := aValue.
	depositLeg := DepositLeg of: depositAccount withCounterpart: withdrawAccount.
	withdrawLeg := WithdrawLeg of: withdrawAccount withCounterpart: depositAccount.

	Withdraw register: aValue on: withdrawAccount.
	Deposit register: aValue on: depositAccount! !


!Transfer methodsFor: 'value' stamp: 'jr 11/11/2022 03:57:23'!
depositLeg

	^depositLeg ! !

!Transfer methodsFor: 'value' stamp: 'jr 11/11/2022 03:57:19'!
withdrawLeg
	^withdrawLeg ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: 'depositLeg'!

!Transfer class methodsFor: 'instance creation' stamp: 'jr 11/11/2022 03:26:02'!
register: aValue from: withdrawAccount to: depositAccount
	
	| result |
	
	result := self new.
	
	result register: aValue from: withdrawAccount to: depositAccount.
	
	^ result! !


!Transfer class methodsFor: 'accessing' stamp: 'jr 11/11/2022 03:22:25'!
depositLeg
	^ depositLeg! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'jr 11/10/2022 15:09:05'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'jr 11/10/2022 15:05:45'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #DepositLeg category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #DepositLeg
	instanceVariableNames: 'reference counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'jr 11/11/2022 03:59:06'!
counterpart
	^counterpart! !

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'jr 11/11/2022 03:48:40'!
of: anAccount withCounterpart: counterpartAccount.

	reference := anAccount.
	counterpart := counterpartAccount.! !

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'jr 11/11/2022 03:53:01'!
value
	^ reference! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositLeg class' category: 'ServiciosFinancieros-Ejercicio'!
DepositLeg class
	instanceVariableNames: ''!

!DepositLeg class methodsFor: 'as yet unclassified' stamp: 'jr 11/11/2022 03:50:04'!
of: anAccount withCounterpart: counterpartAccount
	
	| result |.
	
	result := self new.
	result of: anAccount withCounterpart: counterpartAccount.
	
	^ result
	
	! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'CG 11/11/2022 17:21:28'!
balance
	^accounts sum:[
		:anAccount | anAccount balance
		]
	ifEmpty: [0*peso].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'CG 11/11/2022 17:34:35'!
hasRegistered: aTransaction
	^(accounts anySatisfy: [
		:anAccount | anAccount hasRegistered: aTransaction 
		]).! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'CG 11/11/2022 16:54:54'!
initializeWith: aNumberOfAccounts
	accounts := aNumberOfAccounts asOrderedCollection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'CG 11/11/2022 17:06:38'!
with: aNumberOfAccounts 

	^self new initializeWith: aNumberOfAccounts. ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'jr 11/10/2022 15:13:51'!
balance

	^transactions sum: [ :aTransaction | 
		(aTransaction isKindOf: Withdraw) ifTrue: [0 - aTransaction value]
		ifFalse: aTransaction value] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'jr 11/11/2022 01:39:28'!
hasRegistered: aTransaction
	^ transactions includes: aTransaction ! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'jr 11/11/2022 01:39:17'!
register: aTransaction
	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'jr 11/11/2022 01:39:37'!
transactions 

	^ transactions copy! !


!classDefinition: #WithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #WithdrawLeg
	instanceVariableNames: 'reference counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'jr 11/11/2022 03:58:02'!
counterpart
	^counterpart! !

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'jr 11/11/2022 03:44:34'!
of: aAccount withCounterpart: counterpartAccount.

	reference := aAccount.
	counterpart := counterpartAccount.! !

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'jr 11/11/2022 03:52:38'!
value 
	^ reference! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawLeg class' category: 'ServiciosFinancieros-Ejercicio'!
WithdrawLeg class
	instanceVariableNames: ''!

!WithdrawLeg class methodsFor: 'as yet unclassified' stamp: 'jr 11/11/2022 03:50:15'!
of: anAccount withCounterpart: counterpartAccount
	
	| result |.
	
	result := self new.
	result of: anAccount withCounterpart: counterpartAccount.
	
	^ result! !
