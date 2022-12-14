!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'six zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'FF 9/29/2022 23:43:56'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5)  equals: one + oneFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'FF 9/30/2022 00:26:44'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'FF 9/30/2022 00:30:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	
	six := Entero with: 6.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #NameOfSubclass category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #NameOfSubclass
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 22:57:37'!
dividirFraccion: aFraccion 
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 22:46:54'!
divirEntero: anEntero 
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations' stamp: 'jr 10/1/2022 22:07:27'!
multiplicarEntero: anEntero 
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations' stamp: 'jr 10/1/2022 23:52:57'!
multiplicarFraccion: aFraccion 
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !

!Numero methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 01:23:21'!
restarEntero: anEntero 
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 01:35:37'!
restarFraccion: aFraccion 
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations' stamp: 'jr 10/1/2022 12:00:47'!
sumarEntero: anEntero 
	self subclassResponsibility! !

!Numero methodsFor: 'arithmetic operations' stamp: 'jr 10/1/2022 12:31:57'!
sumarFraccion: aFraccion 
	self subclassResponsibility.! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de N?mero Inv?lido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value fraccion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 22:39:59'!
* aMultiplier 
	^ aMultiplier multiplicarEntero: self.
	
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'jr 10/1/2022 12:12:39'!
+ anAdder
	^ anAdder sumarEntero: self.
	
		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 02:59:21'!
- aSubtrahend 	
	
	^ aSubtrahend restarEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 22:56:15'!
/ aDivisor 
	^ aDivisor divirEntero: self.
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 23:03:17'!
dividirFraccion: aFraccion 
	^  Fraccion with: aFraccion numerator over: self * aFraccion denominator.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 22:50:51'!
divirEntero: anEntero 
	^ Fraccion with: anEntero over: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 23:47:49'!
fibonacci
	| one two |
	
	one := Entero with: 1.
	
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci! !

!Entero methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 12:24:03'!
multiplicarEntero: anEntero 
	^ Entero with: (value * anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 12:24:10'!
multiplicarFraccion: aFraction
	^ Fraccion with: (self * aFraction numerator) over: (aFraction denominator)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 01:31:23'!
restarEntero: anEntero 
	^  Entero with: (anEntero integerValue - value).! !

!Entero methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 12:15:35'!
restarFraccion: aFraction
	^ Fraccion with: aFraction numerator  - (self * aFraction denominator) over: aFraction denominator.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 12:07:38'!
sumarEntero: anEntero 
	^  Entero with: value + anEntero integerValue.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 12:15:08'!
sumarFraccion: aFraccion 

	^ Fraccion with: self * aFraccion denominator + aFraccion numerator over: aFraccion denominator.! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'jr 10/3/2022 23:07:20'!
greatestCommonDivisorWith: anEntero 
	^self class with: (value gcd: anEntero integerValue)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no est? definido aqu? para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'jr 10/4/2022 18:35:03'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	(aValue = 0) ifTrue: [ ^ Cero new initializeWith: aValue].
	(aValue = 1) ifTrue: [ ^ CasoBaseFibonacci new initializeWith: aValue].
	aValue < 0 ifTrue: [ ^ Negativo new initializeWith: aValue].
	
	^self new initializeWith: aValue! !


!classDefinition: #CasoBaseFibonacci category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #CasoBaseFibonacci
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!CasoBaseFibonacci methodsFor: 'as yet unclassified' stamp: 'jr 10/4/2022 18:31:45'!
fibonacci 
	^ Entero with: 1.! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
CasoBaseFibonacci subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'as yet unclassified' stamp: 'jr 10/4/2022 18:32:56'!
dividirFraccion: aFraccion 
	Numero error: Numero canNotDivideByZeroErrorDescription! !

!Cero methodsFor: 'as yet unclassified' stamp: 'jr 10/4/2022 18:32:33'!
divirEntero: anEntero
	Numero error: Numero canNotDivideByZeroErrorDescription! !


!classDefinition: #Negativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Negativo methodsFor: 'as yet unclassified' stamp: 'jr 10/2/2022 23:27:38'!
fibonacci
	self error: Entero negativeFibonacciErrorDescription! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'jr 10/1/2022 23:59:46'!
* aMultiplier 
	^ aMultiplier multiplicarFraccion: self.
	
		! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'jr 10/1/2022 12:33:17'!
+ anAdder 
	^ anAdder sumarFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 02:59:36'!
- aSubtrahend 
	
	^ aSubtrahend restarFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 23:03:33'!
/ aDivisor
	^ aDivisor dividirFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 23:00:26'!
dividirFraccion: aFraccion 
	^ Fraccion with: (denominator * aFraccion numerator) over: (numerator * aFraccion denominator).! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 22:55:24'!
divirEntero: anEntero 
	^ Fraccion with: (denominator * anEntero) over: numerator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 12:24:27'!
multiplicarEntero: anEntero 
	^ Fraccion with: numerator  * anEntero over: denominator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 12:24:20'!
multiplicarFraccion: aFraction 
	^ Fraccion with: numerator * aFraction numerator over: (denominator * aFraction denominator)! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 12:14:09'!
restarEntero: anEntero 
	^ Fraccion with: (anEntero  * denominator - numerator) over: denominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 12:17:03'!
restarFraccion: aFraccion
	
	^ Fraccion with: (denominator * aFraccion numerator) - (numerator * aFraccion denominator) over: (denominator * aFraccion denominator).! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'jr 10/2/2022 12:14:46'!
sumarEntero: anAdder
	^ Fraccion with: anAdder  * denominator + numerator over: denominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'jr 10/1/2022 12:34:05'!
sumarFraccion: aFraccion
	| newNumerator newDenominator |
	newNumerator := (numerator * aFraccion denominator) + (denominator * aFraccion numerator).
	newDenominator := denominator * aFraccion denominator.
	^newNumerator / newDenominator.! !


!Fraccion methodsFor: 'comparing' stamp: 'FF 9/30/2022 01:38:11'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'jr 10/2/2022 11:46:33'!
denominator
	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'jr 10/3/2022 23:09:07'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	"aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ]."
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'jr 10/3/2022 23:14:00'!
with: aDividend over: aDivisor
	| greatestCommonDivisor numerator denominator |
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
