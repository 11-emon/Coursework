#rem
	Title:        fantomEngine
	Description:  A 2D game framework for the Monkey programming language
	
	Author:       Michael Hartlef
	Contact:      michaelhartlef@gmail.com
	
	Repository:   http://code.google.com/p/fantomengine/
	
	License:      MIT
#End

Import fantomEngine


#Rem
'header:<blockquote><nav><b>fantomEngine documentation</b> | <a href="index.html">Home</a> | <a href="classes.html">Classes</a> | <a href="3rdpartytools.html">3rd party tools</a> | <a href="examples.html">Examples</a> | <a href="changes.html">Changes</a></nav></blockquote>
#End

'#DOCOFF#
'***************************************
Class ftChar
	Field id:Int
	Field page:Int
	Field x:Int
	Field y:Int
	Field width:Int
	Field height:Int
	Field xoff:Int
	Field yoff:Int
	Field xadv:Int
End
'#DOCON#
'***************************************
'summery:The class ftFont provides a few methods regarding the definition of a loaded font.
Class ftFont
'#DOCOFF#
	Field pages:Image[]
	Field pageCount:Int
	Field filename:String
	Field charMap:IntMap<ftChar> = New IntMap<ftChar> 
	Field lineHeight:Int
	'------------------------------------------
	Method Draw:Void(t:String, xpos:Float, ypos:Float)
		Local currx:Float
		Local curry:Float
		Local c:Int=0
		Local tmpChar:ftChar

		Local len:Int = t.Length()
		currx = xpos
		curry = ypos
		
		For Local i:Int = 1 To len
			c=t[i-1]
			tmpChar = Self.charMap.Get(c)
			If tmpChar <> Null Then
				DrawImageRect( Self.pages[tmpChar.page], currx + tmpChar.xoff, curry + tmpChar.yoff, tmpChar.x, tmpChar.y, tmpChar.width, tmpChar.height)
			Endif
			currx += tmpChar.xadv
		Next
	End
'#DOCON#
	'------------------------------------------
'summery:Returns the maximum height of the font.
	Method Height:Int()
		Return lineHeight
	End
	'------------------------------------------
'summery:Returns the length in pixel of the given text string.
	Method Length:Int(t:String)
		Local currx:Int=0
		Local c:Int=0
		Local len:Int = t.Length()
		Local tmpChar:ftChar
		For Local i:Int = 1 To len
			c=t[i-1]
			tmpChar = Self.charMap.Get(c)
			If tmpChar <> Null Then
				currx += tmpChar.xadv
			Endif
		Next
		Return currx
	End
'#DOCOFF#
	'------------------------------------------
	Method Load:Void(url:String)
		Local iniText:String
		Local pageNum:Int = 0
		Local idnum:Int = 0
		Local path:String =""
		Local tmpChar:ftChar = Null

		If url.Find("/") > -1 Then
			Local pl:= url.Split("/")
			For Local pi:= 0 To (pl.Length()-2)
				path = path + pl[pi]+"/"
			Next
		Endif
		Local ts:String = url.ToLower()
		If (ts.Find(".txt") > 0) Then
			iniText = app.LoadString(url)
		Else
			iniText = app.LoadString(url+".txt")
		Endif

		Local lines := iniText.Split(String.FromChar(10))

		For Local line := Eachin lines
		
			line = line.Trim()
			If line.StartsWith("info") Or line = "" Then Continue
			If line.StartsWith("padding") Then Continue
			If line.StartsWith("common") Then 
				Local commondata:= line.Split(String.FromChar(32)) 
				For Local common:= Eachin commondata
					' Maximum Line height
					If common.StartsWith("lineHeight=") Then
						Local lnh$[] = common.Split("=")
						lnh[1] = lnh[1].Trim()
						Self.lineHeight = Int(lnh[1])
					Endif
					' Number of bitmap font images
					If common.StartsWith("pages=") Then
						Local lnh$[] = common.Split("=")
						lnh[1] = lnh[1].Trim()
						Self.pageCount = Int(lnh[1])
						Self.pages = New Image[Self.pageCount]
					Endif
				Next
			Endif
			
			' Loading the bitmap font images
			If line.StartsWith("page") Then
				Local pagedata := line.Split(String.FromChar(32)) 
				For Local data := Eachin pagedata
					If data.StartsWith("file=") Then
						Local fn$[] = data.Split("=")
						fn[1] = fn[1].Trim()
						Self.filename = fn[1]
						Self.filename = filename[1..(filename.Length()-1)]
						Self.filename = path+filename.Trim()

						Self.pages[pageNum] = LoadImage(Self.filename)
						If Self.pages[pageNum] = Null Then Error("Error in method ftFont.Load~n~nCan not load page image: "+Self.filename)
						pageNum = pageNum + 1
					Endif
				Next
			Endif
			
			If line.StartsWith("chars") Then Continue

			If line.StartsWith("char") Then
			    tmpChar = New ftChar
				Local linedata:= line.Split(String.FromChar(32))
				For Local data:= Eachin linedata
					If data.StartsWith("id=") Then
						Local idc$[] = data.Split("=")
						idc[1] = idc[1].Trim()
						tmpChar.id = Int(idc[1])
					Endif
					If data.StartsWith("x=") Then
						Local xc$[] = data.Split("=")
						xc[1] = xc[1].Trim()
						tmpChar.x = Int(xc[1])
					Endif
					If data.StartsWith("y=") Then
						Local yc$[] = data.Split("=")
						yc[1] = yc[1].Trim()
						tmpChar.y = Int(yc[1])
					Endif
					If data.StartsWith("width=") Then
						Local wc$[] = data.Split("=")
						wc[1] = wc[1].Trim()
						tmpChar.width = Int(wc[1])
					Endif
					If data.StartsWith("height=") Then
						Local hc$[] = data.Split("=")
						hc[1] = hc[1].Trim()
						tmpChar.height = Int(hc[1])
					Endif
					If data.StartsWith("xoffset=") Then
						Local xoc$[] = data.Split("=")
						xoc[1] = xoc[1].Trim()
						tmpChar.xoff = Int(xoc[1])
					Endif
					If data.StartsWith("yoffset=") Then
						Local yoc$[] = data.Split("=")
						yoc[1] = yoc[1].Trim()
						tmpChar.yoff = Int(yoc[1])
					Endif
					If data.StartsWith("xadvance=") Then
						Local advc$[] = data.Split("=")
						advc[1] = advc[1].Trim()
						tmpChar.xadv = Int(advc[1])
					Endif
					If data.StartsWith("page=") Then
						Local advc$[] = data.Split("=")
						advc[1] = advc[1].Trim()
						tmpChar.page = Int(advc[1])
					Endif
				Next
				Self.charMap.Add(tmpChar.id, tmpChar)
			Endif
			Continue
		Next
	End
End
'#DOCON#

#rem
footer:This fantomEngine framework is released under the MIT license:
[quote]Copyright (c) 2011-2013 Michael Hartlef

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the software, and to permit persons to whom the software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
[/quote]
#end
