#rem
	'Title:        fantomEngine
	'Description:  A 2D game framework for the Monkey programming language
	
	'Author:       Michael Hartlef
	'Contact:      michaelhartlef@gmail.com
	
	'Repository:   http://code.google.com/p/fantomengine/
	
	'Version:      1.50
	'License:      MIT
#End


Import mojo
Import reflection
'#REFLECTION_FILTER+="|fantomEngine.cftObject*"
#REFLECTION_FILTER+="|fantomEngine*"

Import cftMisc
Import cftFunctions
Import cftImage
Import cftObject
Import cftLayer
Import cftEngine
Import cftSound
Import cftTimer
Import cftFont
Import cftTrans
Import cftHighscore
Import cftSwipe
Import cftWaypoints
Import cftAStar
'Import cftBox2D


Import json

'#OUTPUTNAME#index.html
'#INCLFILE#docInclude/introduction.txt
'-INCLFILE#docInclude/classes.txt
'-INCLFILE#docInclude/3rdpartytools.txt
'-INCLFILE#docInclude/examples.txt
'-INCLFILE#docInclude/changes.txt
#rem
footer:This fantomEngine framework is released under the MIT license:
[quote]Copyright (c) 2011-2013 Michael Hartlef

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the software, and to permit persons to whom the software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
[/quote]
#end