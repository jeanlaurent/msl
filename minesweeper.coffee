class MineSweeper
	constructor: (grid)-> 
		unless grid?
			@height=0
			@width=0
		else
			lines = grid.split '\n'
			firstLine = lines[0].split ' '
			@height = parseInt firstLine[1], 10
			@width = parseInt firstLine[0], 10
			@lines = lines[1..]

	isBomb: (x, y)->
		if (@height > y >= 0) && (@width > x >= 0)
			@lines[y][x] == "*"
		else
			false

	nbOfAdjacentBomb: (x,y)->
		nbBomb=0
		for xx in [x-1..x+1]
			for yy in [y-1..y+1]
				nbBomb++ if @isBomb xx, yy

		nbBomb

	renderCell: (x, y)->
		if @isBomb(x, y)
			'*'
		else
			@nbOfAdjacentBomb(x, y)

	render:()->
		linesArray = @lines.map (line, y) =>
			lineArray = (@renderCell(x, y) for cell, x in line)
			lineArray.join('')
		linesArray.join('\n')
				
			
root.MineSweeper = MineSweeper if MineSweeper?