import mojo
' player coords and start position
Global px:Int = 320
Global py:Int = 220
' starting movement direction
Global currentdir:String="right"
Global movementspeed = 1
Global airballoon:Image
Class MyGame Extends App
    Method OnCreate()
        SetUpdateRate(60)
        airballoon = LoadImage ("hotairballoon.png")
    End
    Method OnUpdate()

        For Local i=0 Until movementspeed
            Select currentdir
                Case "down"
                    py+=1
                Case "up"
                  	py-=1
            End Select
         
            If py<0 Then currentdir="down"
            If py>480-16 Then currentdir="up"
        Next
    End
    Method OnRender()
        Cls 0,191,255
        'SetColor 0, 191, 255
        DrawImage, airballoon
    End
End
Function Main()
    New MyGame()
End
