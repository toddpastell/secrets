collide = {}

function collide.map(tbl, flag, dx, dy)
	dx = dx or 0
	dy = dy or 0
	local x1 = (tbl.x + tbl.hit.x1 + dx) / 8
	local y1 = (tbl.y + tbl.hit.y1 + dy) / 8
	local x2 = (tbl.x + tbl.hit.x2 + dx) / 8
	local y2 = (tbl.y + tbl.hit.y2 + dy) / 8
	return fget(mget(x1, y1), flag) or fget(mget(x2, y1), flag) or fget(mget(x1, y2), flag) or fget(mget(x2, y2), flag)
end

function collide.entity(tbl1, tbl2)
	return 1 + tbl1.y + tbl1.hit.y2 > tbl2.y + tbl2.hit.y1 and tbl1.y + tbl1.hit.y1 < tbl2.y + tbl2.hit.y2 and 1 + tbl1.x + tbl1.hit.x2 > tbl2.x + tbl2.hit.x1 and tbl1.x + tbl1.hit.x1 < tbl2.x + tbl2.hit.x2
end