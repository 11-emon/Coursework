
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
	    Field image:Image
    Global balloony: Int = 0
    
   Field balloon : Balloon
   
   
    Method OnCreate()
        SetUpdateRate 30
     	balloon = New Balloon
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
				Local level_file:FileStream
				Local level_data:String
				Local data_item:String[]
				Local x:Int
				Local y:Int
				Local w:Int
				Local h:Int




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
			balloon.Move()
		Case "PLAYING"
			Cls 0, 191, 255
			DrawText "Choose the answer fill the gap: I love _____ dog!", 20, 40
			DrawImage youreballoon, 20,20
			DrawImage yourballoon, 40,20
			

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

Class Balloon
' code for drawing balloon and moving it 
Field  image: Image =LoadImage("hotairballoon.png")
Field balloony :Int =0
Field updowndir : String = "down"

Method New(balloony :Int =0)
	
End

Method Move( )
        DrawImage image,20, balloony
        balloony+=1 
        If balloony >=   278 Then ' check if at bottom
	updowndir = "up" 
	End If
	If balloony < 0 Then ' check If at top
	updowndir = "down"
	End If
	
	If updowndir = "down" Then ' respond to down flag
	balloony +=1
	' change to speed up movement down
	Else 
	balloony -=2 ' movement up
	End If    
	'end of movement code
End
End