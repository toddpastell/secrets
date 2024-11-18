game = {}

function game.init()
	game.hero = hero:new()
	game.enemies = {}
	bus:on("camera_move", game.spawn)
	bus:on("flute", game.spell)
	_update = game.update
	_draw = game.draw
end

function game.update()
	for en in all(game.enemies) do
		en:update()
	end
	game.hero:update()
end

function game.draw()
	cls()
	game.cam()
	camera(game.cx, game.cy)
	map()
	for en in all(game.enemies) do
		en:draw()
	end
	game.hero:draw()
end

function game.cam()
	local cx = flr(game.hero.x / 128) * 128
	local cy = flr(game.hero.y / 128) * 128
	if cx ~= game.cx or cy ~= game.cy then
		game.cx = cx
		game.cy = cy
		bus:emit("camera_move")
	end
end

function game.spawn()
	game.enemies = {}
	local cx = game.cx / 8
	local cy = game.cy / 8
	for y = cy, cy + 15 do
		for x = cx, cx + 15 do
			if mget(x, y) == 32 then
				add(game.enemies, enemy:new(x * 8, y * 8, "slime"))
			end
		end
	end
end

function game.spell()
	game.hero.act = nil
	game.hero.inst.on = false
	game.hero.inst:reset()
end