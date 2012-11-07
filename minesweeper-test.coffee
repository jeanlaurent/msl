should = require('chai').should()

describe 'MineSweeper Rules', ->

	it 'height and width should be zero at first', ->
		minesweeper = new MineSweeper
		minesweeper.height.should.equal 0
		minesweeper.width.should.equal 0

	it 'should read correcly the map', ->
		minesweeper = new MineSweeper """
		3 2
		*..
		...
		"""
		minesweeper.height.should.equal 2
		minesweeper.width.should.equal 3

	it 'should find a bomb when there is one', ->
		minesweeper = new MineSweeper """
		3 2
		.*.
		...
		"""
		minesweeper.isBombAt(1,0).should.equal true

	it 'shoud not go kaboomm when checking for wrong coordinates', ->
		minesweeper = new MineSweeper """
		3 2
		.*.
		...
		"""
		minesweeper.isBombAt(-1,-1).should.equal false

	it 'should find all adjacent coordinates', ->
		minesweeper = new MineSweeper """
		3 2
		.*.
		...
		"""
		minesweeper.adjacentBombsOf(1,1).should.equal 1

	it 'should resolve a simple minefield', ->
		minesweeper = new MineSweeper """
		3 2
		.*.
		...
		"""
		minesweeper.resolve().should.equal """
		1*1
		111
		"""

	it 'should solve a bigger minefield', ->
		minesweeper = new MineSweeper """
		5 5
		*....
		.....
		.....
		.....
		..***
		"""
		minesweeper.resolve().should.equal """
		*1000
		11000
		00000
		01232
		01***
		"""

