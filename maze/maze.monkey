'MINE
'Libraries and globals
Import mojo
Import brl
Global Game:Game_app
Global Score: int

Const Wall = 1 'The wall is represented using a 1 to make the code easier
Const Grass = 2 'And the Grass is represented using a 2

'Main program starts here:
Function Main ()
	Game = New Game_app
End

'All game code goes here:
Class Game_app Extends App

	Global GameState:String = "MENU"
	Field menu:Image
	Global sound: Sound
	
	Field maze:Level
	
	Field characters:Image 'The image of all the characters from the sprite map
	Field p1:Character 'p1 is the player object
	Field ghost:Character
	Field psherman:Character

	Method OnCreate ()
	'All the initialisation for the game goes here:
		SetUpdateRate 60
		menu = LoadImage ("menu.png")
		sound = LoadSound ("mine.ogg")
		
	
		'PlayMusic(".ogg")
		maze = New Level
		maze.load()
		
		characters = LoadImage("characters.png")'The characters are loaded
		p1 = New Character 'The player is created, and its image is set to the first in the sprite map
		p1.sprite = characters.GrabImage(0,0,32,32)
		
		ghost = New Character
		ghost.sprite = characters.GrabImage(32,0,32,32)'The ghost is defined
		
		psherman = New Character
		psherman.sprite = characters.GrabImage(64,0,32,32)'The goggles are defined
	
		
	End

	Method OnUpdate ()
	'All the game logic goes here:
		Select GameState
			Case "MENU"
				If KeyHit (KEY_SPACE) Then GameState="INITIALISE"
			Case "INITIALISE"
				p1.x = 288
				p1.y = 256
				p1.speed = 4 'The character speed is set to 4 
				p1.speed_x = p1.speed 'So speed.x is 4. The character will move right when we tell it how to move.
				p1.speed_y = 0
				
				ghost.x = 0 'The attributes are set for the ghost sprite
				ghost.y = 0
				ghost.speed = 2
				
				psherman.x=400
				psherman.y=125
				'PlaySound (sound)
				
				GameState="PLAYING"
				
			Case "PLAYING"
				If KeyHit (KEY_ESCAPE) Then GameState="MENU"
				If KeyDown (KEY_LEFT) Then
					p1.speed_x = -p1.speed
				End
				
				If KeyDown (KEY_RIGHT) Then
					p1.speed_x = p1.speed
				End
			
				If KeyDown (KEY_UP) Then
					p1.speed_y = -p1.speed
				End

				If KeyDown (KEY_DOWN) Then
					p1.speed_y = p1.speed
				End

				p1.x += p1.speed_x
				If maze.tile_hit(p1.x, p1.y) = Wall Then
					p1.x -=p1.speed_x 
					p1.speed_x = 0
				End
				
				p1.y += p1.speed_y
				If maze.tile_hit(p1.x, p1.y) = Wall Then
					p1.y -=p1.speed_y
					p1.speed_y = 0
				End	
				
				If ghost.x < p1.x Then ghost.x += ghost.speed'The ghost is moved closer to the player on each update
				If ghost.x > p1.x Then ghost.x -= ghost.speed
				If ghost.y < p1.y Then ghost.y += ghost.speed
				If ghost.y > p1.y Then ghost.y -= ghost.speed
				
				'PlaySound (sound)
				If intersects(p1.x,p1.y,32,32,ghost.x,ghost.y,32,32) Then GameState="MENU"
				PlaySound (sound)
				If intersects(p1.x,p1.y,32,32,psherman.x,psherman.y,32,32) Then Score = Score+1 'FIX THIS
				'GameState="MENU"
		End
	End 



Method OnRender ()
'All the graphics drawing goes here:
	Select GameState
		Case "MENU"
			DrawImage menu, 0,0
		Case "PLAYING"
			Cls 0, 0, 0
			maze.draw
			p1.draw
			ghost.draw 'The new ghost is drawn to the screen
			psherman.draw 'Draws the goggles to the screen
			DrawText(Score, 60, 50, 2, 2)
			End
			
	End
End

Class Level
	Field tiles:String[21][] 'The world is 20 tiles wide
	Field tileset:Image 'Each tile is 32x32

	Method New()
		tileset = LoadImage ("tiles.png",32,32,3)
		For Local i:Int = 0 To 20
			tiles[i] = New String[16]
		Next
	End
	

	Method load() 'Reads the data into the array
		Local level_file:FileStream
		Local level_data:String
		Local data_item:String[]
	
		level_file = FileStream.Open("monkey://data/maze.txt","r")
		level_data = level_file.ReadString()
		level_file.Close

		data_item = level_data.Split("~n")
			For Local y:Int = 0 To 14
				For Local x:Int = 0 To 19
				tiles[x][y]=Int(data_item[y][x..x+1])
			Next
		Next
	End	
	
	Method draw() 'This uses a nested loop to iterate through the files in the array
		Local tile:String
		For Local y:Int = 0 To 14
			For Local x:Int = 0 To 19
				tile = tiles[x][y]
				If tile = Wall Then DrawImage tileset, x*32, y*32, Wall 'We can easily multiply the counting variables by 32 to calculate the position
				If tile = Grass Then DrawImage tileset, x*32, y*32, Grass
			Next
		Next
	End

	Method tile_hit:Int (x:Int,y:Int)
			Local left_tile:Int = x / 32'Calculates the four possible collison tiles
			Local right_tile:Int = (x+31) / 32
			Local top_tile:Int = y / 32
			Local bottom_tile:Int = (y+31) / 32

			If left_tile < 0 Then left_tile = 0'Clips the tile to the array bounds preventing logic errors
			If right_tile > 19 Then right_tile = 19
			if top_tile < 0 Then top_tile = 0
			If bottom_tile > 14 Then bottom_tile = 14

			Local collision_result:Int = 0'Checks each of the four possible tiles, and returns the value of the tile hit.
			For Local i:Int = left_tile To right_tile'A constant for wall makes this easier to read
				For Local j:Int = top_tile To bottom_tile'We cant use x or y variables in this part of the routine because they are passed perameters
					If tiles[i][j] = Wall Then collision_result = Wall'By creating a method it can be easily modified
			Next
		Next
	Return collision_result 
End
End

Class Character
		Field sprite:Image
		Field x:Int 'Attributes to the position of the character on the screen
		Field y:Int
		Field speed:Int 'How fast the characters can move in pixels
		Field speed_x:Int 'The distance to move
		Field speed_y:Int 'These are used to correct collisions with walls later

	Method draw() 'Draws the sprite to the screen when called from OnRender later
		DrawImage sprite, x, y
	End
End

Function intersects:Bool (x1:Int, y1:Int, w1:Int, h1:Int, x2:Int, y2:Int, w2:Int, h2:Int)
If x1 >= (x2 + w2) Or (x1 + w1) <= x2 Then Return False
If y1 >= (y2 + h2) Or (y1 + h1) <= y2 Then Return False
Return True
End

