should = require('chai').should()
require("./minesweeper")

describe 'MineSweeper', ->
	it 'should works', ->
		polka = 2
		polka.should.equal 2

	it 'should read the width & height correclty', ->
		minesweeper = new MineSweeper()
		minesweeper.height.should.equal 0
		minesweeper.width.should.equal 0

	it 'should read the map size correctly', ->
		minesweeper = new MineSweeper """
		2 2
		*.
		..
		"""
		minesweeper.height.should.equal 2
		minesweeper.width.should.equal 2

	it 'should find a bomb when there is one', ->
		minesweeper = new MineSweeper """
		2 2
		.*
		..
		"""
		minesweeper.isBomb(1,0).should.equal true


	it 'should not find a bomb when there is no one', ->
		minesweeper = new MineSweeper """
		2 2
		.*
		..
		"""
		minesweeper.isBomb(0,1).should.equal false
	

	it 'should not find a bomb with invalid parameters', ->
		minesweeper = new MineSweeper """
		2 2
		.*
		..
		"""
		minesweeper.isBomb(-1,1).should.equal false

	it 'should one bomd around a point', ->
		minesweeper = new MineSweeper """
		2 2
		.*
		..
		"""
		minesweeper.numberOfAdjacentBombs(0,1).should.equal 1

	it 'should find no bomb in 1,1', ->
		minesweeper = new MineSweeper """
		2 2
		.*
		..
		"""
		minesweeper.numberOfAdjacentBombs(1,0).should.equal 0
