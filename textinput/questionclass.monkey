'Class question
'see if questions can be called from a text file
'dont know if questions will even work as a class?!
Import mojo
Import brl

Global Game:Game_app
    
Function Main ()
	Game = New Game_app
End
	
Class Game_app Extends App
 
 Field question: Level

Method OnCreate ()
	SetUpdateRate (60)
	question = New Level
	question.load()
End

Method OnUpdate ()
	Return 0
End

Method OnRender ()
	Cls(255,255,255)
	question.draw
End
End
	
Class Level
	'Field qs:String[15][]
	Field qs:String

Method load()	
	Local level_file:FileStream
	Local level_data:String
	Local data_item:String[]
	
	level_file = FileStream.Open("monkey://data/question.txt","r")
	level_data = level_file.ReadString()
	level_file.Close
	
	data_item = level_data.Split("~n")
		For Local y:Int = 0 To 1
			For Local x:Int = 0 To 1
			'quest = qs [x][y]
			DrawText question, x*30, y*0 '*IDENTIFIER QUESTION NOT FOUND
		Next
	Next
End
End			
	
'End 