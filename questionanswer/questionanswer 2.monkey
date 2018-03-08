Field won:Bool
	Field complete:Image
	Field difference_collection:List<Difference_area>

	
	
Method OnCreate()
        SetUpdateRate 60
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


    End
    

Method OnUpdate()
	Select GameState
@ -38,6 +42,17 @@ Method OnUpdate()
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
@ -54,10 +69,12 @@ Method OnRender()
	Select GameState
		Case "MENU"
			DrawImage menu, 0, 0
			balloon.Move()
		Case "PLAYING"
			Cls 0, 191, 255
			DrawImage youreballoon, 20,20
			DrawImage yourballoon, 40,20
			

End
End
@ -83,3 +100,33 @@ middle_y = (y+h/2)-15
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