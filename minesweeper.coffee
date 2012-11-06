
class MineSweeper
	constructor: (grid) ->
		unless grid?
			@height=0
			@width=0
		else
			lines = grid.split '\n'
			firstline = lines[0].split(' ')
			@width = parseInt firstline[0], 10
			@height = parseInt firstline[1], 10
			@lines = lines[1..]

	isBomb: (x, y) ->
		if (@height > y >= 0) && (@width > x >= 0)
			@lines[y][x] == '*'
		else 
			false

	numberOfAdjacentBombs: (x,y) ->
		numberOfBombs = 0
		for xx in [x-1..x+1]
			for yy in [y-1..y+1]
				numberOfBombs++ if @isBomb(xx,yy)
		numberOfBombs




root.MineSweeper = MineSweeper