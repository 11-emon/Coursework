'THIS DOES NOT WORK YET 
Strict

Import brl
Import mojo

'Global Game:Game_app

Function Main ():Int
	Game = New Game_app
End

Class Game_app Extends App	

Method OnCreate:Int()

Local level_file:FileStream
Local level_data:String
Local data_item:String[]
Local player_name:String
Local score:Int





level_file = FileStream.Open("monkey://data/questions.txt","r")'This would open the text file
'and save it in the variable level_file
level_data = level_file.ReadString()'here the contents of the data from the text file
'(which is now stored in the variable level_file) would be saved in the new variable level_data
level_file.Close 'Here the initial file is closed, for the data is now stored elsewhere

data_item = level_data.Split("~n")'This line splits the data from the text file (now held in a variable)
'at the end of each line of the text file

Return 0
End

Method OnUpdate:Int()

For Local counter:Int = 0 To data_item.Length-1 Step 2 'This line means that each item now held in
'the data_item variable will be iterated over. Indexes always start from position 0, which means
'the last item in the list is the index value one less than that of the length of the whole list
'(hence length-1), step 2 is used in order to skip over every other item of data in the list as 
'the first data item will be the name (in this example) and the next the score relating to that name
'etc.
question = data_item[counter]'this means that every other item of data in the data_item list 
'will be the question, and so will be saved in this variable
answer = data_item[counter+1]'Subsequently, every OTHER item of data is stored
Next

Return 0
End