import mojo
' player coords and start position
Global px:Int = 320
Global py:Int = 220
' starting movement direction
Global currentdir:String="right"
Global movementspeed = 1
Global airballoon:Image
Global player:Int
Class MyGame Extends App
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
        DrawImage, airballoon, 320 ,220
        'DrawImage player.sprite, player.x, player.y
        For Local enemy:=Eachin enemy_collection

If enemy.y > 400 Then ' check if at bottom
updowndir = "up" 
End If
If enemy.y < 0 Then ' check If at top
updowndir = "down"
End If

If updowndir = "down" Then ' respond to down flag
enemy.y +=2
' change to speed up movement down
Else 
enemy.y -=3 ' movement up
End If
Print enemy.y ' for debug to see Y values
DrawImage enemy.sprite, enemy.x, enemy.y
Next

    End
End
Function Main()
    New MyGame()
End
