action = {}

function action.move_x(sp1, sp2, frms, dx, dir)
	return function(tbl)
		while true do
			for sp = sp1, sp2 do
				for f = 1, frms do
					tbl.sp = sp
					tbl.dir = dir
					if not collide.map(tbl, 0, dx) then
						tbl.x += dx
					end
					yield()
				end
			end
		end
	end
end

function action.move_y(sp1, sp2, frms, dy, dir)
	return function(tbl)
		while true do
			for sp = sp1, sp2 do
				for f = 1, frms do
					tbl.sp = sp
					tbl.dir = dir
					if not collide.map(tbl, 0, 0, dy) then
						tbl.y += dy
					end
					yield()
				end
			end
		end
	end
end

function action.stab(sp1, sp2, frms)
	return function(tbl)
		for f = 1, frms do
			tbl.sp = sp1
			yield()
		end
		tbl.wep.on = true
		for f = 1, frms do
			tbl.sp = sp2
			yield()
		end
		tbl.wep.on = false
	end
end

function action.play(sp1, sp2, frms)
	return function(tbl)
		tbl.inst.on = true
		while true do
			for sp = sp1, sp2 do
				for f = 1, frms do
					if btnp(5) then
						tbl.inst.on = false
						tbl.inst:reset()
						return
					end
					tbl.sp = sp
					yield()
				end
			end
		end
	end
end