weapon = {}

function weapon:new(par)
	local tbl = {
		par = par,
		x = 0,
		y = 0,
		hit_x = { x1 = 0, y1 = 2, x2 = 8, y2 = 5 },
		hit_y = { x1 = 2, y1 = 0, x2 = 5, y2 = 8 },
		on = false
	}
	tbl.hit = tbl.hit_x
	return setmetatable(tbl, { __index = self })
end

function weapon:update()
	self.x = self.par.x + direction.adj_x[self.par.dir]
	self.y = self.par.y + direction.adj_y[self.par.dir]
	self.hit = self.par.dir < 2 and self.hit_x or self.hit_y
	self.sp = 112 + self.par.dir
end

function weapon:draw()
	if not self.on then return end
	spr(self.sp, self.x, self.y)
	-- rect(self.x + self.hit.x1, self.y + self.hit.y1, self.x + self.hit.x2, self.y + self.hit.y2, 8)
end