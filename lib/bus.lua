bus = {
	listeners = {}
}

function bus:on(evt, fn)
	if not self.listeners[evt] then
		self.listeners[evt] = {}
	end
	add(self.listeners[evt], fn)
end

function bus:emit(evt, ...)
	if self.listeners[evt] then
		for fn in all(self.listeners[evt]) do
			fn(...)
		end
	end
end