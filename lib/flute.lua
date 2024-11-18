flute = {}

flute.notes = {
	["⬅️"] = 3,
	["➡️"] = 4,
	["⬆️"] = 6,
	["⬇️"] = 2,
	["🅾️"] = 0,
	["❎"] = 1
}

function flute:new(patterns)
	local tbl = {
		patterns = patterns,
		on = false,
		seq = "",
		t = 0,
		result = nil
	}
	return setmetatable(tbl, { __index = self })
end

function flute:update()
	if not self.on then return end

	if self.match then
		self.t += 1
		if self.t > 15 then
			bus:emit(self.match)
			self.match = nil
			self:reset()
		end
		return
	end

	if btnp(0) then
		self:track("⬅️")
	elseif btnp(1) then
		self:track("➡️")
	elseif btnp(2) then
		self:track("⬆️")
	elseif btnp(3) then
		self:track("⬇️")
	elseif btnp(4) then
		self:track("🅾️")
	elseif btnp(5) then
		self:track("❎")
	else
		self.t += 1
		if self.t > 15 then
			self:reset()
		end
	end

	self.match = self.patterns[self.seq]
	if self.match then
		self.t = 0
	end
end

function flute:draw(x, y)
	if not self.on then return end
	print(self.seq, x + 1, y + 1, 0)
	print(self.seq, x, y, self.match and 11 or 7)
end

function flute:track(n)
	sfx(0, 3, self.notes[n], 1)
	self.t = 0
	self.seq ..= n
end

function flute:reset()
	self.t = 0
	self.seq = ""
end