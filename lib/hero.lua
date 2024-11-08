hero = {}

function hero:new(x, y)
	local tbl = {
		x = x or 0,
		y = y or 0,
		hit = { x1 = 1, y1 = 3, x2 = 6, y2 = 7 },
		sp = 64,
		wlk_w = cocreate(action.move_x(64, 65, 4, -1)),
		wlk_e = cocreate(action.move_x(66, 67, 4, 1)),
		wlk_n = cocreate(action.move_y(68, 69, 4, -1)),
		wlk_s = cocreate(action.move_y(70, 71, 4, 1))
	}
	return setmetatable(tbl, { __index = self })
end

function hero:update()
	if self.act and costatus(self.act) ~= "dead" then
		return coresume(self.act, self)
	else
		self.act = nil
	end
	if btn(0) and not collide.map(self, 0, -1) then
		coresume(self.wlk_w, self)
	elseif btn(1) and not collide.map(self, 0, 1) then
		coresume(self.wlk_e, self)
	elseif btn(2) and not collide.map(self, 0, 0, -1) then
		coresume(self.wlk_n, self)
	elseif btn(3) and not collide.map(self, 0, 0, 1) then
		coresume(self.wlk_s, self)
	end
	if btnp(4) then
		self.act = cocreate(action.stab(72))
	end
end

function hero:draw()
	spr(self.sp, self.x, self.y)
	if self.atk then
		spr(73, self.x + 8, self.y)
	end
	-- rect(self.x + self.hit.x1, self.y + self.hit.y1, self.x + self.hit.x2, self.y + self.hit.y2, 8)
	-- local sp = self.sp
	-- sx, sy = sp % 16 * 8, sp \ 16 * 8
	-- sspr(sx, sy, 8, 8, self.x, self.y + 24, 16, 16)
end