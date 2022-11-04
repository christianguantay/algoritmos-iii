!classDefinition: #MarsRoverTest category: 'MarsRover-Exercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverTest methodsFor: 'mars rover move test' stamp: 'jr 11/4/2022 16:30:56'!
test01MarsRoverRecibeComandoInvalidoNoCambiaPosicion

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: DirNorth new.
	
	marsRover move: 'Ñ'.
	
	self assert: (marsRover inPos: 0@0). 
	
	
	
	
	
	! !

!MarsRoverTest methodsFor: 'mars rover move test' stamp: 'jr 11/3/2022 19:16:07'!
test02MarsRoverRecibeComandoNoCambiaPosicion

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: DirNorth new.
	
	marsRover move: 'l'.
	
	self assert: (marsRover inPos: 0@0). 
	
	
	
	
	
	! !

!MarsRoverTest methodsFor: 'mars rover move test' stamp: 'jr 11/4/2022 16:32:23'!
test03MarsRoverRecibeComandoNoCambiaDireccion

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: DirNorth new.
	
	marsRover move: 'f'.
	
	self assert: (marsRover inDir: DirNorth). 
	
	
	
	
	! !

!MarsRoverTest methodsFor: 'mars rover move test' stamp: 'jr 11/3/2022 19:16:30'!
test04MarsRoverRecibeComandoCambiaPosicionEnDireccionCambiada

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: DirNorth new.
	
	marsRover move: 'lf'.
	
	self assert: (marsRover inPos: -1@0). 
	
	
	
	
	
	! !

!MarsRoverTest methodsFor: 'mars rover move test' stamp: 'jr 11/3/2022 19:16:34'!
test05MarsRoverRecibeComandoConCaracteresInvalidosCambiaDireccionYPosicion

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: DirNorth new.
	
	marsRover move: 'r3f'.
	
	self assert: (marsRover inPos: 1@0). 
	
	
	
	
	
	! !

!MarsRoverTest methodsFor: 'mars rover move test' stamp: 'jr 11/4/2022 16:32:43'!
test06MarsRoverRecibeComandoVuelvePosicionInicial

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: DirNorth new.
	
	marsRover move: 'llll'.
	marsRover move: 'rrrr'.
	
	self assert: (marsRover inDir: DirNorth). 
	
	
	
	
	
	! !

!MarsRoverTest methodsFor: 'mars rover move test' stamp: 'jr 11/3/2022 19:16:45'!
test07MarsRoverRecibeComandoSeMueveVariasPosiciones

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: DirNorth new.
	
	marsRover move: 'rfff'.
	
	self assert: (marsRover inPos: 3@0). 
	
	
	
	
	
	! !

!MarsRoverTest methodsFor: 'mars rover move test' stamp: 'jr 11/3/2022 19:16:51'!
test08MarsRoverRecibeComandoSeMueveVariasPosicionesHaciaAdelante

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: DirNorth new.
	
	marsRover move: 'rfff'.
	
	self assert: (marsRover inPos: 3@0). 
	
	
	
	
	
	! !

!MarsRoverTest methodsFor: 'mars rover move test' stamp: 'jr 11/3/2022 19:16:55'!
test09MarsRoverRecibeComandoSeMueveVariasPosicionesHaciaAtras

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: DirNorth new.
	
	marsRover move: 'rbbb'.
	
	self assert: (marsRover inPos: -3@0). 
	
	
	
	
	
	! !

!MarsRoverTest methodsFor: 'mars rover move test' stamp: 'jr 11/4/2022 16:32:55'!
test10MarsRoverRecibeComandoParaRotarAPosicionSur

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: DirNorth new.
	
	marsRover move: 'rr'.
	
	self assert: (marsRover inDir: DirSouth). 
	
	
	
	
	
	! !

!MarsRoverTest methodsFor: 'mars rover move test' stamp: 'jr 11/4/2022 16:33:05'!
test11MarsRoverRecibeComandoParaRotarAPosicionEste

	| marsRover |
	marsRover := MarsRover in: 0@0 withDir: DirWest new.
	
	marsRover move: 'rr'.
	
	self assert: (marsRover inDir: DirEast). 
	
	
	
	
	
	! !


!classDefinition: #Direction category: 'MarsRover-Exercise'!
Object subclass: #Direction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!Direction methodsFor: 'as yet unclassified' stamp: 'CG 11/2/2022 20:57:58'!
moveBackwards
	self subclassResponsibility.! !

!Direction methodsFor: 'as yet unclassified' stamp: 'CG 11/2/2022 21:00:09'!
moveForward
	self subclassResponsibility.! !

!Direction methodsFor: 'as yet unclassified' stamp: 'CG 11/2/2022 21:00:17'!
rotateToLeft
	self subclassResponsibility.! !

!Direction methodsFor: 'as yet unclassified' stamp: 'CG 11/2/2022 21:00:23'!
rotateToRight
	self subclassResponsibility.! !


!classDefinition: #DirEast category: 'MarsRover-Exercise'!
Direction subclass: #DirEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!DirEast methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 20:36:42'!
moveBackwards
	^ -1@0! !

!DirEast methodsFor: 'as yet unclassified' stamp: 'CG 11/2/2022 20:47:51'!
moveForward
	^ 1@0! !

!DirEast methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 19:37:30'!
rotateToLeft
	^ DirNorth new.! !

!DirEast methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 20:02:36'!
rotateToRight
	^ DirSouth new.! !

!DirEast methodsFor: 'as yet unclassified' stamp: 'CG 11/2/2022 21:53:21'!
value
	^ #E.! !


!classDefinition: #DirNorth category: 'MarsRover-Exercise'!
Direction subclass: #DirNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!DirNorth methodsFor: 'move' stamp: 'CG 11/2/2022 20:50:33'!
moveBackwards
	^ 0@-1! !

!DirNorth methodsFor: 'move' stamp: 'CG 11/2/2022 20:57:35'!
moveForward
	^ 0@1.! !

!DirNorth methodsFor: 'move' stamp: 'CG 11/2/2022 20:46:16'!
rotateToLeft
	^ DirWest new.! !


!DirNorth methodsFor: 'xxx' stamp: 'jr 11/2/2022 20:00:49'!
rotateToRight
	^ DirEast new.! !

!DirNorth methodsFor: 'xxx' stamp: 'jr 11/2/2022 20:10:13'!
value
	^ #N.! !


!classDefinition: #DirSouth category: 'MarsRover-Exercise'!
Direction subclass: #DirSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!DirSouth methodsFor: 'xxx' stamp: 'CG 11/2/2022 20:51:31'!
moveBackwards
	^ 0@1.! !

!DirSouth methodsFor: 'xxx' stamp: 'CG 11/2/2022 20:49:13'!
moveForward
	^ 0@-1.! !

!DirSouth methodsFor: 'xxx' stamp: 'jr 11/2/2022 20:23:16'!
rotateToLeft
	^ DirEast new.! !

!DirSouth methodsFor: 'xxx' stamp: 'CG 11/2/2022 20:46:07'!
rotateToRight
	^ DirWest new.! !

!DirSouth methodsFor: 'xxx' stamp: 'CG 11/2/2022 21:49:55'!
value
	^ #S.! !


!classDefinition: #DirWest category: 'MarsRover-Exercise'!
Direction subclass: #DirWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!DirWest methodsFor: 'as yet unclassified' stamp: 'CG 11/2/2022 20:52:32'!
moveBackwards
	^ 1@0! !

!DirWest methodsFor: 'as yet unclassified' stamp: 'CG 11/2/2022 20:48:42'!
moveForward
	^ -1@0! !

!DirWest methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 20:22:18'!
rotateToLeft
	^ DirSouth new.! !

!DirWest methodsFor: 'as yet unclassified' stamp: 'jr 11/2/2022 20:03:35'!
rotateToRight
	^ DirNorth new.! !

!DirWest methodsFor: 'as yet unclassified' stamp: 'CG 11/2/2022 21:53:08'!
value
	^ #W.! !


!classDefinition: #MarsRover category: 'MarsRover-Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'point symbol pos dir'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRover methodsFor: 'private' stamp: 'jr 11/3/2022 19:17:32'!
dir: aDirection
	dir := aDirection.
	! !

!MarsRover methodsFor: 'private' stamp: 'jr 11/2/2022 16:54:04'!
pos: aPoint 
	pos := aPoint! !


!MarsRover methodsFor: 'movement' stamp: 'jr 11/3/2022 19:12:37'!
move: aCommand
	|aux|
	aux := aCommand asArray.
	
	1 to: (aux size) do: [:i |
		((aux at: i) = $l) ifTrue: [dir := dir rotateToLeft].
		((aux at: i) = $r) ifTrue: [dir := dir rotateToRight].
		((aux at: i) = $f) ifTrue: [pos := pos + dir moveForward] .
		((aux at: i) = $b) ifTrue: [pos := pos + dir moveBackwards].
		].! !


!MarsRover methodsFor: 'testing' stamp: 'jr 11/4/2022 16:31:52'!
inDir: aDireccion
	^ dir isKindOf: aDireccion.! !

!MarsRover methodsFor: 'testing' stamp: 'jr 11/2/2022 16:59:46'!
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
