Strict 
 
'Import mojo
Import fantomEngine

Global g:game

'Function Main:int()
    'g = New game
    'Return 0
'End

Class game Extends App

	'Field result:String = "Choice (1 to 3)?"
	'Field result:String = "Input your name:"
	
	Field eng:engine
    Field txtScore:ftObject
	Field font1:ftFont
	Field layerBackGround:ftLayer 'THIS SEEMS TO BE THE BIT WHICH MEANS IT WONT RUN
 	Field layerUI:ftLayer 'THERE IS AN ERROR WITH FTLAYER
 	Field layerTitle:ftLayer
 	Field layerScore:ftLayer  
 	
    Method OnCreate:Int()
        SetUpdateRate (60)
        eng = New engine
        CreateLayers
		font1 = eng.LoadFont("cc_font")
		CreateInfoText()'Calls CreateInfoText function
		CreateTitleScreen()'Calls CreateTitleScreen function
        Return 0
    End
        
    Method OnUpdate:Int()
    	'Repeat
        'Class MyApp Extends App
            'Local char:Int = GetChar()
            'If Not char Then Exit
            'Select char
            	'Case KEY_1
            		'result = "ONE!"
            	'Case KEY_2
		            'result = "TWO!"
		        'Case KEY_3
		            'result = "THREE!"
            	'Case KEY_C 'name on list --> move to next, playing screen
            		'result = "OK!"
            	'Case KEY_E 'name not on list --> ask again, stay on start screen
		            'result = "OK!"
		        'Case KEY_3
		            'result = "THREE!"
		        'Default 
		        	'result = "NOT 1, 2 or 3!"
		        	'result = "You are not in this class! Check your spelling!"
            Return 0
            End
        'Forever
        'level_file = FileStream.Open("monkey://data/classlist.txt","r")
				'If level_file Then
					'level_data = level_file.ReadString()
					'level_file.Close 
				'Endif
				'data_item = level_data.Split("~n")
				'For Local counter:Int = 0 To data_item.Length-1 Step 4
					'x = Int(data_item[counter])
					'y = Int(data_item[counter+1])
					'w = Int(data_item[counter+2])
					'h = Int(data_item[counter+3])
					'difference_collection.AddLast(New Difference_area(x,y,w,h))
				'Next
        
        
        
    
    
    Method OnRender:Int()
    	Cls'(500, 0, 500)
    	'DrawText result, 10, 10
    	eng.Render()
    	Return 0
    End
   'End
   
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
