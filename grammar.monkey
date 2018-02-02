Import mojo
Import brl
Global Game:Game_app
Global Score: Int


Global px:Int = 17
Global py:Int = 270

Global currentdir:String="up"
Global movementspeed = 1

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
				 For Local i=0 Until movementspeed
            Select currentdir
                Case "down"
                    py+=1
                Case "up"
                  	py-=1
            End Select
         
            If py<0 Then currentdir="down"
            If py>480-16 Then currentdir="up"
        Next
		End
	End 


Method OnRender ()
	Select GameState
		Case "MENU"
			DrawImage menu, 0,0
		Case "PLAYING"
			Cls 0, 191, 255 '0-191-255
			DrawImage airballoon,17, 270
			'DrawImage player.sprite, player.x, player.y
			DrawRect px,py,16,16
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
	'Method Move(x_distance:Int)
		'x+=x_distance
			'If x<0 Then x=0
			'If x>590 Then x=590
	'End
'End