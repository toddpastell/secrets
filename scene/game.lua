game = {}

function game:init()
	self.hero = hero:new()
	_update = self.update
	_draw = self.draw
end

function game.update()
	game.hero:update()
end

function game.draw()
	game.cx = flr(game.hero.x / 128) * 128
	game.cy = flr(game.hero.y / 128) * 128
	cls()
	camera(game.cx, game.cy)
	map()
	game.hero:draw()
end
