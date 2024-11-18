start = {}

function start.init()
	poke(0x5f5c, 255)
	bus:on("game_start", game.init)
	start.inst = flute:new({
		["⬅️⬅️➡️➡️"] = "game_start",
		["⬆️⬆️⬇️⬇️⬅️➡️⬅️➡️🅾️❎"] = "game_start"
	})
	start.inst.on = true
	_update = start.update
	_draw = start.draw
end

function start.update()
	start.inst:update()
end

function start.draw()
	cls(1)
	print("secrets", 50, 6)
	start.inst:draw(64 - #start.inst.seq * 4, 56)
end