Field font1:ftFont
'__________________________________________________________________________
Field layerBackground:ftLayer
	Field layerGame:ftLayer
	Field layerGFX:ftLayer
	Field layerGameOver:ftLayer
	Field layerMenu:ftLayer
	Field layerScore:ftLayer
	Field layerTitle:ftLayer
'__________________________________________________________________________
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
'__________________________________________________________________________
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
'__________________________________________________________________________
Method OnCreate:Int()
		SetUpdateRate(60)
		eng = New engine
		eng.SetCanvasSize(640,480)
		cw = eng.canvasWidth
		ch = eng.canvasHeight
		atlas = LoadImage("ts_Tiles.png")
		font1 = eng.LoadFont("ts_font")
		tileMap = Create2DArray(columns,rows)
		'And action...
		LoadSounds()
		CreateLayers()
		CreateBackgroundScreen()
		CreateGameOverScreen()
		CreateMenuScreen()
		CreateScoreScreen()
		CreateTitleScreen()
		gameMode = gmTitle
		ActivateLayer(gameMode)
		Return 0
	End
'__________________________________________________________________________
??Method OnUpdate:Int()

'__________________________________________________________________________
Method OnLayerUpdate:Int(layer:ftLayer)
		If g.gameMode = g.gmPlay Then
			If g.endTime <= Millisecs() Then
				g.ShowGameOver()
				g.eng.scoreList.AddScore(g.score,"---")
				g.SaveHighScore()
			Endif
		Endif
		Return 0
	End	
