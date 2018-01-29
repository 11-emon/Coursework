Import mojo
Import brl
Global Game:Game_app
Global Score: int

Function Main ()
	Game = New Game_app
End

Class Game_app Extends App

	Global GameState:String = "MENU"
	Field menu:Image
	Field airballoon:Image
	'Field enemy_collection:List<balloon>
	
Method OnCreate ()
		SetUpdateRate 60
		menu = LoadImage ("login.png")
		airballoon = LoadImage ("hotairballoon.png")
		
		'enemy_collection = New List<balloon>
		'enemy_collection.AddLast(New balloon(100,050)) 
End

		
Method OnUpdate ()
		Select GameState
			Case "MENU"
				If KeyHit (KEY_ENTER) Then GameState="INITIALISE"
			Case "INITIALISE"
				GameState="PLAYING"
			Case "PLAYING"		
	
		End
	End 


Method OnRender ()
	Select GameState
		Case "MENU"
			DrawImage menu, 0,0
		Case "PLAYING"
			Cls 0, 191, 255 '0-191-255
			DrawImage airballoon,20, 20
			'airballoon.draw
			'DrawText(Score, 60, 50, 2, 2)
	'For Local enemy:=Eachin enemy_collection
		'DrawImage enemy.sprite, enemy.x, enemy.y
			End
		End
End

'Class balloon

'Field sprite:Image = LoadImage ("hotairballoon.png")
'Field x:Float
'Field y:Float
	'Method New(x_spawn:Int, y_spawn:Int)
		'x = x_spawn
		'y = y_spawn

	'End
'End