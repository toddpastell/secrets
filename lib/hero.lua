hero = {}

function hero:new(x, y)
	local tbl = {
		x = x or 0,
		y = y or 0,
		hit = { x1 = 1, y1 = 3, x2 = 6, y2 = 7 },
		dir = 0,
		sp = 64,
		act = nil,
		wlk_w = cocreate(action.move_x(64, 65, 4, -1, 0)),
		wlk_e = cocreate(action.move_x(66, 67, 4, 1, 1)),
		wlk_n = cocreate(action.move_y(68, 69, 4, -1, 2)),
		wlk_s = cocreate(action.move_y(70, 71, 4, 1, 3))
	}
	tbl.wep = weapon:new(tbl)
	tbl.inst = flute:new({
		["⬇️⬇️⬇️"] = "flute"
	})
	return setmetatable(tbl, { __index = self })
end

function hero:update()
	self.wep:update()
	self.inst:update()
	if self.act and costatus(self.act) ~= "dead" then
		return coresume(self.act, self)
	else
		self.act = nil
	end

	if btn(0) then
		coresume(self.wlk_w, self)
	elseif btn(1) then
		coresume(self.wlk_e, self)
	elseif btn(2) then
		coresume(self.wlk_n, self)
	elseif btn(3) then
		coresume(self.wlk_s, self)
	else
		self.sp = 64 + self.dir * 2
	end

	if btnp(4) then
		self.act = cocreate(action.stab(72 + self.dir * 2, 73 + self.dir * 2, 4))
	elseif btnp(5) then
		self.act = cocreate(action.play(81, 82, 15))
	end
end

function hero:draw()
	spr(self.sp, self.x, self.y)
	self.wep:draw()
	self.inst:draw(self.x + 4 - #self.inst.seq * 4, self.y + 12)
end