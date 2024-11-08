action = {}

function action.move_x(sp1, sp2, frms, dx)
	return function(tbl)
		while true do
			for sp = sp1, sp2 do
				for f = 1, frms do
					tbl.sp = sp
					tbl.x += dx
					yield()
				end
			end
		end
	end
end

function action.move_y(sp1, sp2, frms, dy)
	return function(tbl)
		while true do
			for sp = sp1, sp2 do
				for f = 1, frms do
					tbl.sp = sp
					tbl.y += dy
					yield()
				end
			end
		end
	end
end

function action.stab(sp1, sp2)
	return function(tbl)
		for f = 1, 4 do
			tbl.sp = sp1
			tbl.atk = true
			yield()
		end
		tbl.atk = false
	end
end