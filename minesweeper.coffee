class MineSweeper
	constructor: (minefield) ->
		unless minefield?
			@height=0
			@width=0
		else
			lines = minefield.split '\n'
			firstLine = lines[0].split ' '
			@width = +firstLine[0]
			@height = +firstLine[1]
			@minefield = lines[1..]

	isBombAt: (x,y) ->
		if (@width > x >= 0) && (@height > y >= 0)
			@minefield[y][x] == '*'
		else 
			false

	adjacentBombsOf: (x,y) ->
		numberOfBombs = 0
		for xx in [x-1..x+1]
			for yy in [y-1..y+1]
				numberOfBombs++ if @isBombAt xx,yy
		numberOfBombs

	representationOf: (x,y) ->
		if @isBombAt x,y
			'*'
		else
			@adjacentBombsOf x,y

	resolve: () ->
		solution=""
		for y in [0...@height]
			unless y ==0
				solution += "\n"
			for x in [0...@width]
				solution += "#{@representationOf x,y}"
		solution

root.MineSweeper=MineSweeper