Strict '
'layers simple template

Import fantomEngine 'imports the fantomEngine modules from the library
Global g:game   
 
Class game Extends App
	Field eng:engine
    Field txtScore:ftObject
	Field font1:ftFont
	Field layerBackGround:ftLayer
 	Field layerUI:ftLayer
 	Field layerTitle:ftLayer
 	Field layerScore:ftLayer  
      
Method OnCreate:Int()
	SetUpdateRate(60)
    eng = New engine
CreateLayers
	font1 = eng.LoadFont("cc_font") 'loads the cc_font from the fantom engine, 
	'and saves it in font1
	'run code for info and title screen layers
CreateInfoText()'Calls CreateInfoText function
CreateTitleScreen()'Calls CreateTitleScreen function

Return 0 
End


Method OnUpdate:Int()
Return 0
End
      
Method OnRender:Int()
	Cls
    eng.Render()
Return 0 
End


Method CreateLayers:Int()
layerBackGround = eng.CreateLayer()
	layerUI = eng.CreateLayer()
    layerTitle = eng.CreateLayer()
    layerScore = eng.CreateLayer()
Return 0
End


Method CreateInfoText:Int ()
txtScore = eng.CreateText(font1,"This is an example of text ",100,0)'This method sets the variable 
'txtScore' and assigns its font, text and co-ordinates
txtScore.SetLayer(layerUI)
 
Return 0
End


Method CreateTitleScreen:Int ()'Method to create the title screen
Local txtTitle:ftObject = eng.CreateText(font1,"Comet Crusher",eng.canvasWidth/2,eng.canvasHeight/2-40,1)
	txtTitle.SetLayer(layerTitle)
       'Again, defines the font and text for the title, as well as setting it on a canvas and specifying its size and co-ordinates
Local txtTitle2:ftObject = eng.CreateText(font1,"*** Press 'P' to play ***",eng.canvasWidth/2,eng.canvasHeight/2+10,1)
	txtTitle2.SetLayer(layerTitle)
       'Defines the second bit of text, its font,text and again its canvas and coordinates     
Local txtTitle3:ftObject = eng.CreateText(font1,"*** Press 'H' to see the high-score list ***",eng.canvasWidth/2,eng.  canvasHeight/2+40,1)
     txtTitle3.SetLayer(layerTitle)
       'Defines the third item of text, the font, message, canvas and coordinates
Return 0
End

End

Function Main:Int() 'This is the main game function
	g = New game
Return 0 
End

Class engine Extends ftEngine
	Field eng:engine
    Field txtScore:ftObject
	Field txtLifes:ftObject
	Field txtLevel:ftObject
	Field txtComets:ftObject
	Field txtHighScore:ftObject[10]   'Score list(array) with 10 entries
	Field font1:ftFont

	Field layerBackGround:ftLayer
	Field layerGame:ftLayer
	Field layerUI:ftLayer
	Field layerFX:ftLayer
	Field layerTitle:ftLayer
	Field layerScore:ftLayer
 End