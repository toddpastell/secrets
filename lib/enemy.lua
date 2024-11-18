enemy = {}

function enemy:new(x, y)
	local tbl = {
		x = x or 0,
		y = y or 0,
		sp = 96,
		hit = { x1 = 0, y1 = 0, x2 = 7, y2 = 7 }
	}
	return setmetatable(tbl, { __index = self })
end

function enemy:update()
	self.col = collide.entity(self, game.hero)
	self.col2 = game.hero.wep.on and collide.entity(self, game.hero.wep)
end

function enemy:draw()
	if self.col then
		pal(13, 14)
	elseif self.col2 then
		pal(13, 8)
	end
	spr(self.sp, self.x, self.y)
	-- rect(self.x + self.hit.x1, self.y + self.hit.y1, self.x + self.hit.x2, self.y + self.hit.y2, 8)
	pal()
end