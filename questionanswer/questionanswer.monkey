
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
			won=False
				difference_collection.Clear
				
				youreballoon = LoadImage ("you'reballoon.png")
				yourballoon = LoadImage ("yourballoon.png")
				
				'Local level_file:FileStream
				'Local level_data:String
				'Local data_item:String[]
				'Local x:Int
				'Local y:Int
				'Local w:Int
				'Local h:Int
				
				'level_file = FileStream.Open("monkey://data/youranswer.txt","r")
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
				
				GameState="PLAYING"

		Case "PLAYING"
			If KeyHit (KEY_ESCAPE) Then GameState="MENU"
				If KeyHit (KEY_LMB) Then
					won = True
					difference_collection.Clear
					'youreballoon = LoadImage ("you'reballoon.png")
					'yourballoon = LoadImage ("yourballoon.png")
					For Local difference := Eachin difference_collection
						If intersects(MouseX-30,MouseY-30,60,60,difference.x, difference.y, difference.w, difference.h) Then difference.found = True
						If difference.found = False Then won = False
					Next
 				End
		'End
	'End	
	'End
		
		Case "QUESTION2"
			If KeyHit (KEY_ESCAPE) Then GameState="MENU"
				If KeyHit (KEY_LMB) Then
					won = True
					difference_collection.Clear
					'youreballoon = LoadImage ("you'reballoon.png")
					'yourballoon = LoadImage ("yourballoon.png")
					For Local difference := Eachin difference_collection
						If intersects(MouseX-30,MouseY-30,60,60,difference.x, difference.y, difference.w, difference.h) Then difference.found = True
						If difference.found = False Then won = False
					Next
 				End
		End
		
	End
		
Method OnRender()
	Select GameState
		Case "MENU"
			DrawImage menu, 0, 0
			balloon.Move()
		Case "PLAYING"
			Cls 0, 191, 255
			DrawText "Choose the answer to fill the gap: I love _____ dog!", 140, 100
			DrawImage youreballoon,200,230
			DrawImage yourballoon, 350,230
			'For Local difference := Eachin difference_collection
					'If difference.found Then
						'DrawImage circle, difference.middle_x, difference.middle_y
						'DrawImage circle, difference.middle_x+340, difference.middle_y
					'End
				'Next
			'If won Then DrawImage complete,0,0
			'End
			'End
	End

		'Case "QUESTION2"
			'Cls 0, 191, 255
			'DrawText "Choose the answer to fill the gap: Max is eating _____ ice cream!", 140, 100
			'DrawImage youreballoon,200,230
			'DrawImage yourballoon, 350,230
			
For Local difference := Eachin difference_collection
					If difference.found Then
						DrawImage circle, difference.middle_x, difference.middle_y
						DrawImage circle, difference.middle_x+340, difference.middle_y
					End
				Next
				If won Then DrawImage complete,0,0
			End
	End
'End

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

Function intersects:Bool (x1:Int, y1:Int, w1:Int, h1:Int, x2:Int, y2:Int, w2:Int, h2:Int)
	'Bounding box collision detection algorithm
	If x1 >= (x2 + w2) Or (x1 + w1) <= x2 Then Return False
	If y1 >= (y2 + h2) Or (y1 + h1) <= y2 Then Return False
    Return True
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