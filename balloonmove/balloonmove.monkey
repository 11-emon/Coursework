Import mojo
    
Class Game Extends App

    Field image:Image
    Global balloony: Int = 0
    
   Field balloon : Balloon
   
   
    Method OnCreate()
        SetUpdateRate 30
     	 balloon = New Balloon
    End
    

    Method OnRender()
        Cls
	balloon.Move()
		
	
    End

End

Function Main()
    New Game()
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
        If balloony >=   400 Then ' check if at bottom
	updowndir = "up" 
	End If
	If balloony < 0 Then ' check If at top
	updowndir = "down"
	End If
	
	If updowndir = "down" Then ' respond to down flag
	balloony +=2
	' change to speed up movement down
	Else 
	balloony -=3 ' movement up
	End If    
	'end of movement code
End
End