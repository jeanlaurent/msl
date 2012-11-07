should = require('chai').should()
require("./minesweeper")

describe 'MineSweeper', ->
	it 'should works', ->
		polka = 2
		polka.should.equal 2

	it 'should has height & width', ->
		minesweeper = new MineSweeper
		minesweeper.height.should.equal  0
		minesweeper.width.should.equal 0

	it 'should has height & width equal to given values', ->
		minesweeper = new MineSweeper """
		4 2
		..*.
		...*
		"""
		minesweeper.height.should.equal  2
		minesweeper.width.should.equal 4

	it 'shoud detect a bomb when there is no one', ->
		minesweeper = new MineSweeper """
		4 2
		..*.
		...*
		"""
		minesweeper.isBomb(2,0).should.equal true

	it 'shoud not detect a bomb  when there is no one', ->
		minesweeper = new MineSweeper """
		4 2
		..*.
		...*
		"""
		minesweeper.isBomb(0,0).should.equal false

	it 'shoud not detect a bad parameters are out of grid', ->
		minesweeper = new MineSweeper """
		4 2
		..*.
		...*
		"""
		minesweeper.isBomb(0,-1).should.equal false

	it 'shoud find 2 bombs around me', ->
		minesweeper = new MineSweeper """
		4 2
		..*.
		...*
		"""
		minesweeper.nbOfAdjacentBomb(3,1).should.equal 2

	it "should render bomb when it's a bomb", ->
		minesweeper = new MineSweeper """
		4 2
		..*.
		...*
		"""
		minesweeper.renderCell(2,0).should.equal '*'

	it "should render number of bomb when it's not a bomb", ->
		minesweeper = new MineSweeper """
		4 2
		..*.
		...*
		"""
		minesweeper.renderCell(2,0).should.equal '*'

	it "should render the correct solution", ->
		minesweeper = new MineSweeper """
		4 2
		..*.
		...*
		"""
		minesweeper.render().should.equal """
		01*2
		012*
		"""
