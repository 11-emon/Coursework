Strict 
 
Import mojo

Function Main:int()
    New MyApp
    Return 0
End

Class MyApp Extends App

	Field result:String = "Choice (1 to 3)?"

    Method OnCreate:Int()
        SetUpdateRate 60
        Return 0
    End
    
    Method OnUpdate:Int()
        Repeat
            Local char:Int = GetChar()
            If Not char Then Exit
            Select char
            	Case KEY_1
            		result = "ONE!"
            	Case KEY_2
		            result = "TWO!"
		        Case KEY_3
		            result = "THREE!"
		        Default 
		        	result = "NOT 1, 2 or 3!"
            End
        Forever
        Return 0
    End
    
    Method OnRender:Int()
        Cls(0, 0, 0)
		DrawText result, 10, 10
        Return 0
    End
End
