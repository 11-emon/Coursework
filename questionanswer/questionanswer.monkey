'MAIN GAME FRAME 
Strict

Import mojo
Import brl
Import fantomEngine

Global Game:Game_app
    
Function Main:Int()
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
   
    Field eng:engine'CODE FROM TEXT INPUT
    Field txtScore:ftObject
	Field font1:ftFont
	Field layerBackGround:ftLayer 
 	Field layerUI:ftLayer 
 	Field layerTitle:ftLayer
 	Field layerScore:ftLayer  
 	Field result:String 'CODE FROM TEXT INPUT
   
    Method OnCreate:Int()
     	balloon = New Balloon
     	SetUpdateRate 60
        menu = LoadImage ("background.png")
        difference_collection = New List<Difference_area>
		'circle = LoadImage ("circle.png")
		complete = LoadImage ("background.png")
		
		eng = New engine'CODE FROM TEXT INPUT
        CreateLayers
		font1 = eng.LoadFont("cc_font")
		CreateInfoText()
		Return 0'CODE FROM TEXT INPUT

    End
    

Method OnUpdate:Int()
	Select GameState
		Case "MENU"
			If KeyHit (KEY_ENTER) Then GameState="LOADGAME"
		Case "LOADGAME"
			won=False
				difference_collection.Clear
				
				youreballoon = LoadImage ("you'reballoon.png")
				yourballoon = LoadImage ("yourballoon.png")
				
				Repeat'CODE FROM TEXT INPUT
            Local char:Int = GetChar()
            If Not char Then Exit
            Select char
            	Case KEY_1 'name on list --> move to next, playing screen
            		result = "OK! Eleanor!"
            	Case KEY_2 'name not on list --> ask again, stay on start screen
		            result = "OK! Chloe"
		        Case KEY_3
		        	result = "OK! Becky!"
		        Default 
		        	result = "You are not in this class! Check your spelling!"
            Return 0
            End
        Forever'CODE FROM TEXT INPUT
				
				
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
		
Method OnRender:Int()
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

Method Move()
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