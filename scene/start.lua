start = {}

function start:init()
	_update = self.update
	_draw = self.draw
end

function start.update()
	if btn() > 0 then
		game:init()
	end
end

function start.draw()
	cls()
	print("secrets")
end
