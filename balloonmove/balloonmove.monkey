import mojo
' player coords and start position
Global px:Int = 320
Global py:Int = 220
' starting movement direction
Global currentdir:String="right"
Global movementspeed = 1
Global updowndir:String

Class MyGame Extends App

Global airballoon:Image
'Field enemy_collection:List<balloon>
Field player:balloon

    Method OnCreate()
        SetUpdateRate(60)
        airballoon = LoadImage ("hotairballoon.png")
    End
    Method OnUpdate()

        'For Local i=0 Until movementspeed
            'Select currentdir
                'Case "down"
                    'py+=1
                'Case "up"
                  	'py-=1
            'End Select
         
            'If py<0 Then currentdir="down"
            'If py>480-16 Then currentdir="up"
        'Next
    End
    Method OnRender()
        Cls 0,191,255
        'SetColor 0, 191, 255
        DrawImage airballoon,320,220
        'DrawImage player.sprite, player.x, player.y
        'For Local enemy:=Eachin enemy_collection

If airballoon.y > 400 Then ' check if at bottom
updowndir = "up" 
End If
If airballoon.y < 0 Then ' check If at top
updowndir = "down"
End If

If updowndir = "down" Then ' respond to down flag
airballoon.y +=2
' change to speed up movement down
Else 
airballoon.y -=3 ' movement up
End If
Print airballoon.y ' for debug to see Y values
'DrawImage enemy.sprite, enemy.x, enemy.y
'Next

    End
End
Function Main()
    New MyGame()
End

Class balloon

Field sprite:Image = LoadImage ("hotairballoon.png")
Field x:Float
Field y:Float
	Method New(x_spawn:Int, y_spawn:Int)
		x = x_spawn
		y = y_spawn

	End
	Method Move(x_distance:Int)
		x+=x_distance
			If x<0 Then x=0
			If x>590 Then x=590
	End
End