Strict 
 
Import mojo
'Import fantomEngine

Function Main:int()
    New MyApp
    Return 0
End

Class MyApp Extends App

	'Field result:String = "Choice (1 to 3)?"
	Field result:String = "Input your name:"

    Method OnCreate:Int()
        SetUpdateRate 60
        Return 0
    End
        
    Method OnUpdate:Int()
    	Repeat
        'Class MyApp Extends App
            Local char:Int = GetChar()
            If Not char Then Exit
            Select char
            	Case KEY_1
            		result = "ONE!"
            	Case KEY_2
		            result = "TWO!"
		        Case KEY_3
		            result = "THREE!"
            	Case KEY_C 'name on list --> move to next, playing screen
            		result = "OK!"
            	Case KEY_E 'name not on list --> ask again, stay on start screen
		            result = "OK!"
		        'Case KEY_3
		            'result = "THREE!"
		        Default 
		        	'result = "NOT 1, 2 or 3!"
		        	result = "You are not in this class! Check your spelling!"
            End
        Forever
        'level_file = FileStream.Open("monkey://data/classlist.txt","r")
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
    	Cls(500, 0, 500)
    	DrawText result, 10, 10
    	Return 0
    End
   End