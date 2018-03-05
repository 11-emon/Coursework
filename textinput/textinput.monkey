Strict 
 
Import mojo

Function Main:int()
    New MyApp
    Return 0
End

Class MyApp Extends App

	Field result:String = "Input your name (Case sensitive):"
	Field font1:ftFont
	
	Field layerBackground:ftLayer
	Field layerGame:ftLayer
	Field layerGFX:ftLayer
	Field layerGameOver:ftLayer
	Field layerMenu:ftLayer
	Field layerScore:ftLayer
	Field layerTitle:ftLayer

Method ActivateLayer:Int(mode:Int)
		'Deactivate all layers
		layerBackground.SetActive(False)
		layerGame.SetActive(False)
		layerGFX.SetActive(False)
		layerGameOver.SetActive(False)
		layerMenu.SetActive(False)
		layerScore.SetActive(False)
		layerTitle.SetActive(False)
		'Activate layers depending on the gameMode
		Select mode
			Case gmPlay
				layerBackground.SetActive(True)
				layerGame.SetActive(True)
				layerGFX.SetActive(True)
			Case gmGameOver
				layerBackground.SetActive(True)
				layerGame.SetActive(True)
				layerGFX.SetActive(True)
				layerGameOver.SetActive(True)
			Case gmMenu
				layerMenu.SetActive(True)
			Case gmScore
				layerScore.SetActive(True)	 
			Case gmTitle
				layerTitle.SetActive(True)
		End
		Return 0
	End

Method CreateLayers:Int()
		layerBackground = eng.GetDefaultLayer()
		layerGame = eng.CreateLayer()
		layerGFX = eng.CreateLayer()
		layerGameOver = eng.CreateLayer()
		layerMenu = eng.CreateLayer()
		layerScore = eng.CreateLayer()
		layerTitle = eng.CreateLayer()
		ActivateLayer(0)
		Return 0
	End


    Method OnCreate:Int()
        SetUpdateRate 60
        'eng = New engine
		'eng.SetCanvasSize(640,480)
		'cw = eng.canvasWidth
		'ch = eng.canvasHeight
		'atlas = LoadImage("ts_Tiles.png")
		'font1 = eng.LoadFont("ts_font")
		'tileMap = Create2DArray(columns,rows)
		'And action...
		'LoadSounds()
		'CreateLayers()
		'CreateBackgroundScreen()
		'CreateGameOverScreen()
		'CreateMenuScreen()
		'CreateScoreScreen()
		'CreateTitleScreen()
		'gameMode = gmTitle
		'ActivateLayer(gameMode)
       Return 0
    End
    
    Method OnUpdate:Int()
        Repeat
            Local char:Int = GetChar()
            'Local str:string = GetChar()
            If Not char Then Exit
            Select char
            	Case KEY_C '"Chloe" 'name on list --> move to next, playing screen
            		result = "OK!"
            	Case KEY_E '"Eleanor" 'name not on list --> ask again, stay on start screen
		            result = "OK!"
		        'Case KEY_3
		            'result = "THREE!"
		        Default 
		        	result = "You are not in this class! Check your spelling!"
            End
        Forever
        'level_file = FileStream.Open("monkey://data/classlist.txt","r") 'Text file related code taken from question answer code
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
        
        
        
        Return 0
    End
    
    Method OnRender:Int()
        Cls(20, 100, 84)
		DrawText result, 270, 220
        Return 0
    End
End
