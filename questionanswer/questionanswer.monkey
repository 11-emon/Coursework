
Import mojo
Import brl

Global Game:Game_app
    
Function Main ()
	Game = New Game_app
End
	
Class Game_app Extends App
	Field menu:Image
	Global GameState:String = "MENU"
	'Field answer:Difference_area
	Field youreballoon:Image
	Field yourballoon:Image
	Field circle:Image
	Field won:Bool
	Field complete:Image
	Field difference_collection:List<Difference_area>

	
	
Method OnCreate()
        SetUpdateRate 60
        menu = LoadImage ("background.png")
        difference_collection = New List<Difference_area>
		circle = LoadImage ("circle.png")
		complete = LoadImage ("background.png")

End



Method OnUpdate()
	Select GameState
		Case "MENU"
			If KeyHit (KEY_ENTER) Then GameState="LOADGAME"
		Case "LOADGAME"
			GameState="PLAYING"
		Case "PLAYING"
			If KeyHit (KEY_ESCAPE) Then GameState="MENU"
				won=False
					difference_collection.Clear
					youreballoon = LoadImage ("you'reballoon.png")
					yourballoon = LoadImage ("yourballoon.png")

End
End

			
			
Method OnRender()
	Select GameState
		Case "MENU"
			DrawImage menu, 0, 0
		Case "PLAYING"
			Cls 0, 191, 255
			DrawImage youreballoon, 0,0
			DrawImage yourballoon, 340,0

End
End
End


Class Difference_area
Field x:Int
Field y:Int
Field w:Int
Field h:Int
Field middle_x:Int
Field middle_y:Int
Field found:Bool
	
Method New(diff_x:Int, diff_y:Int, diff_w:Int, diff_h:Int)
x = diff_x
y = diff_y
w = diff_w
h = diff_h
middle_x = (x+w/2)-15
middle_y = (y+h/2)-15
found = False
End
End
