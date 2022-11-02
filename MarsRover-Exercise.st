!classDefinition: #MarsRoverTest category: 'MarsRover-Exercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 19:49:35'!
test01MarsRoverRecibeComandoInvalidoNoHaceNada

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: #N.
	
	marsRover move: 'Ñ'.
	
	self assert: (marsRover inPos: 0@0). 
	
	
	
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 17:43:00'!
test02MarsRoverRecibeComandoCambiaDireccionPeroNoPosicion

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: #N.
	
	marsRover move: 'l'.
	
	self assert: (marsRover inPos: 0@0). 
	
	
	
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 19:53:37'!
test03MarsRoverRecibeComandoCambiaDireccionYPosicion

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: #N.
	
	marsRover move: 'lf'.
	
	self assert: (marsRover inPos: -1@0). 
	
	
	
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 19:57:13'!
test04MarsRoverRecibeComandoConCaracteresInvalidosCambiaDireccionYPosicion

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: #N.
	
	marsRover move: 'r3f'.
	
	self assert: (marsRover inPos: 1@0). 
	
	
	
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 20:21:20'!
test05MarsRoverRecibeComandoVuelvePosicionInicial

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: #N.
	
	marsRover move: 'llll'.
	
	self assert: (marsRover inDir: #N). 
	
	
	
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 20:21:30'!
test06MarsRoverRecibeComandoVuelvePosicionInicial

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: #N.
	
	marsRover move: 'rrrr'.
	
	self assert: (marsRover inDir: #N). 
	
	
	
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 20:33:51'!
test07MarsRoverRecibeComandoSeMueveVariasPosiciones

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: #N.
	
	marsRover move: 'rfff'.
	
	self assert: (marsRover inPos: 3@0). 
	
	
	
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 20:35:35'!
test08MarsRoverRecibeComandoSeMueveVariasPosicionesHaciaAtras

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: #N.
	
	marsRover move: 'rbbb'.
	
	self assert: (marsRover inPos: -3@0). 
	
	
	
	
	
	! !


!classDefinition: #DirEast category: 'MarsRover-Exercise'!
Object subclass: #DirEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!DirEast methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 20:36:42'!
moveBackwards
	^ -1@0! !

!DirEast methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 20:11:16'!
moveFoward
	^ 1@0! !

!DirEast methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 19:37:30'!
rotateToLeft
	^ DirNorth new.! !

!DirEast methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 20:02:36'!
rotateToRight
	^ DirSouth new.! !


!classDefinition: #DirNorth category: 'MarsRover-Exercise'!
Object subclass: #DirNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!DirNorth methodsFor: 'move' stamp: 'jr 11/2/2022 20:32:27'!
moveFoward
	^ 0@1.! !

!DirNorth methodsFor: 'move' stamp: 'jr 11/2/2022 19:44:18'!
rotateToLeft
	^ DirWeast new.! !


!DirNorth methodsFor: 'xxx' stamp: 'jr 11/2/2022 20:00:49'!
rotateToRight
	^ DirEast new.! !

!DirNorth methodsFor: 'xxx' stamp: 'jr 11/2/2022 20:10:13'!
value
	^ #N.! !


!classDefinition: #DirSouth category: 'MarsRover-Exercise'!
Object subclass: #DirSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!DirSouth methodsFor: 'xxx' stamp: 'jr 11/2/2022 20:23:16'!
rotateToLeft
	^ DirEast new.! !

!DirSouth methodsFor: 'xxx' stamp: 'jr 11/2/2022 20:03:03'!
rotateToRight
	^ DirWeast new.! !


!classDefinition: #DirWeast category: 'MarsRover-Exercise'!
Object subclass: #DirWeast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!DirWeast methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 19:53:47'!
moveFoward
	^ -1@0! !

!DirWeast methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 20:22:18'!
rotateToLeft
	^ DirSouth new.! !

!DirWeast methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 20:03:35'!
rotateToRight
	^ DirNorth new.! !


!classDefinition: #MarsRover category: 'MarsRover-Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'point symbol pos dir'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRover methodsFor: 'initialization' stamp: 'jr 11/2/2022 16:51:37'!
initializeIn: aPoint withDir: aSymbol 
	self shouldBeImplemented.
	point := aPoint.
	symbol := aSymbol.! !


!MarsRover methodsFor: 'private' stamp: 'jr 11/2/2022 19:47:43'!
dir: aSymbol 
	aSymbol = #N ifTrue: [ dir := DirNorth new].
	aSymbol = #S ifTrue: [ dir := DirSouth new].
	aSymbol = #W ifTrue: [ dir := DirWeast new].
	aSymbol = #E ifTrue: [ dir := DirEast new].
	! !

!MarsRover methodsFor: 'private' stamp: 'jr 11/2/2022 16:54:04'!
pos: aPoint 
	pos := aPoint! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 20:36:03'!
move: aCommand
	|aux|
	
	aux := aCommand asArray.
	
	1 to: (aux size) do: [:i |
		((aux at: i) = $l) ifTrue: [dir := dir rotateToLeft].
		((aux at: i) = $r) ifTrue: [dir := dir rotateToRight].
		((aux at: i) = $f) ifTrue: [pos := pos + dir moveFoward] .
		((aux at: i) = $b) ifTrue: [pos := pos + dir moveBackwards].
		].! !


!MarsRover methodsFor: 'xxx' stamp: 'jr 11/2/2022 20:06:31'!
inDir: aSymbol 
	^ dir value = aSymbol.! !

!MarsRover methodsFor: 'xxx' stamp: 'jr 11/2/2022 16:59:46'!
inPos: aPoint 
	^ pos = aPoint! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Exercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'jr 11/2/2022 16:54:32'!
in: aPoint withDir: aSymbol 
	| result |
	
	result := MarsRover new.
	
	result pos: aPoint.
	result dir: aSymbol.
	
	^ result. ! !
