pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- secrets
-- by todd

#include lib/action.lua
#include lib/bus.lua
#include lib/collide.lua
#include lib/direction.lua
#include lib/enemy.lua
#include lib/flute.lua
#include lib/hero.lua
#include lib/weapon.lua
#include scene/game.lua
#include scene/start.lua

function _init()
	start.init()
end

__gfx__
00000000333333333333333333333333000000003333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
000000003333333333333333333b33b3000000003333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070033333333333333333b3b33b3000000003336633300000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000333333333333333335353353000000003336663300000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000333333333333333333333333000000003335553300000000000000000000000000000000000000000000000000000000000000000000000000000000
007007003333333333b3333333333333000000003333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
000000003333333333b3b33333333333000000003333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000333333333353533333333333000000003333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
ddddddd5ddd5ddd500000000ddd5dddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d5555551d551d551000000005555dd55000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d5555551d551d55100000000ddd5dd5d000000000000000000000000003333000000000000000000000000000000000000000000000000000000000000000000
51111111d551d55100000000dd5555dd00000000000000000000000003d332330000000000000000000000000000000000000000000000000000000000000000
ddddddd5d551d55100000000ddddd5d5000000000000000000000000036d33230000000000000000000000000000000000000000000000000000000000000000
d5555551d551d55100000000555dd5dd00000000000000000000000003d334330000000000000000000000000000000000000000000000000000000000000000
d5555551d551d55100000000dd55d555000000000000000000000000000434300000000000000000000000000000000000000000000000000000000000000000
511111115111511100000000dd5dd5dd000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000
33333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
35555533000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
35555553000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
35555553000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
35555553000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
35555553000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
35555553000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00dddd050000000050dddd000000000000dddd050000000050dddd000000000000dddd0000dddd0000dddd0000dddd000000000000dddd0000dddd0000000000
0ddffd5000dddd0505dffdd050dddd000ddddd5000dddd0505dffdd050dddd000ddffd000ddffd0000dffdd000dffdd000dddd000dddddd00ddffdd000dddd00
0d7f7ddd0ddffd50ddd7f7d005dffdd00dddd6d00ddddd500d7ff7d005dffdd00d7f7dd00d7f7dd00dd7f7d00dd7f7d00dddddd00ddddddd0d7ff7d00ddffdd0
ddfffddd0d7f7ddddddfffddddd7f7d0dddd66dd0dddd6d0ddffffdd0d7ff7d0ddfffdddddfffddddddfffdddddfffdd0dddddd0ddddddddddffffdd0d7ff7d0
ddffddddddfffdddddddffdddddfffddddd66ddddddd66ddddffffddddffffddddffddddfdffddddddddffddddddffdfdddddddddddddddddddfffddddffffdd
ddddddddddffddddddddddddddddffdddd66ddddddd66ddddddddddfddffffdddfddddddddddddddddddddfddddddddddddddddddddddddddfdddddddddfffdd
0dddddd0dddddddf0dddddd0fddddddd066dddd0dd66dddd0dddddd0fdddddd00dddddd00dddddd00dddddd00dddddd0dddddddd0fddddd00dddddd00dddddd0
000ff0000ffdddf0000ff0000fdddff000ffdd00066dff0000ff00000dddffd00ff0ff00ff000ff000ff0ff00ff000ff00ddff0000fddff000ff0ff00ddfddd0
00dddd0000dddd0000dddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ddffdd00ddffd0000dffdd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d7ff7d00d7f7dd00dd7f7d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ddffffddddfffddddddfffdd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddfffddddffddfddfddffdd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dfddddddd44444444444444d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dddddd00ddfddd00dddfdd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00ff0ff00ff0ff0000ff0ff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00999900000000000099990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09999990009999000999999000999900000000000000000000044000000440000000000000000000000000000000000000000000000000000000000000000000
9299929909999990992999290999999000000000000000009994499977744777000000000040000000000000000e0800000e0800000e0e00ff4444ff00000000
992929999299929999929299992999290000000000000000929999927277777200000000044400000000000000e0e08000eee880000ee800ff4ff4ff00000000
999999999929299999999999999292990000000000000000988999887887778800000000444440000000000000e0008000eee88000008000004ff40000000000
99999999999999999999999999999999000000000000000098a999a878a777a8000000003333300000000000000e0800000e88000000000000f44f0000000000
99999999999999999999999999999999000000000000000099922299777222770000000033a33000000000000000800000008000000000000004400000000000
09999990999999990999999099999999000000000000000009999990077777700000000033a330000000000000000000000000000000000000f00f0000000000
0000000000000000000060000005000000000000000000007a7c7b7d000000000000000000000000000000000000000000444400000000000000000000000000
000000000000000000006000000500000000000000000000aaccbbdd0000000000000000000000000000000000d0d00004000440000440000000000000000000
000000000000000000006000000600000000000000000000111111110000000000000000880440880000000007d7d00004a0a440887447880000000000000000
0000000000000000000060000006000000000000000000007879727e0000000000000000999449990000000000ddd00004000440807887080000000000000000
666666555566666600006000000600000000000000000000889922ee000000000000000007aaaa70000000000000000000444400000880000000000000000000
00000000000000000000600000060000000000000000000011111111000000000000000000bbbb00000000000000000004444400887887880000000000000000
0000000000000000000050000006000000000000000000007d787b730000000000000000ccc0c0cc000000000000000004444400880000880000000000000000
000000000000000000005000000600000000000000000000dd88bb3300000000000000000ddd0dd0000000000000000004444440087887800000000000000000
__label__
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333b33b33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333333333333333333333333333333b3b33b33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333353533533333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33b33333333333333333333333333333333333333333333333333333333333333333333333b33333333333333333333333333333333333333333333333333333
33b3b333333333333333333333333333333333333333333333333333333333333333333333b3b333333333333333333333333333333333333333333333333333
33535333333333333333333333333333333333333333333333333333333333333333333333535333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333663333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333666333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333555333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333ddddddd533333333ddddddd53333333333333333333333333333333333333333ddddddd5ddd5ddd53333333333333333
33333333333333333333333333333333d555555133333333d55555513333333333333333333333333333333333333333d5555551d551d5513333333333333333
33333333333333333333333333333333d555555133333333d55555513333333333333333333333333333333333333333d5555551d551d5513333333333333333
33333333333333333333333333333333511111113333333351111111333333333333333333333333333333333333333351111111d551d5513333333333333333
33333333333333333333333333333333ddddddd533333333ddddddd53333333333333333333333333333333333333333ddddddd5d551d5513333333333333333
33333333333333333333333333333333d555555133333333d55555513333333333333333333333333333333333333333d5555551d551d5513333333333333333
33333333333333333333333333333333d555555133333333d55555513333333333333333333333333333333333333333d5555551d551d5513333333333333333
33333333333333333333333333333333511111113333333351111111333333333333333333333333333333333333333351111111511151113333333333333333
33333333333333333333333333333333ddd5ddd533333333ddd5ddd53333333333333333333333333333333333333333ddd5ddd5ddddddd53333333333333333
33333333333333333333333333333333d551d55133333333d551d5513333333333333333333333333333333333333333d551d551d55555513333333333333333
33333333333333333333333333333333d551d55133333333d551d5513333333333333333333333333333333333333333d551d551d55555513333333333333333
33333333333333333333333333333333d551d55133333333d551d5513333333333333333333333333333333333333333d551d551511111113333333333333333
33333333333333333333333333333333d551d55133333333d551d5513333333333333333333333333333333333333333d551d551ddddddd53333333333333333
33333333333333333333333333333333d551d55133333333d551d5513333333333333333333333333333333333333333d551d551d55555513333333333333333
33333333333333333333333333333333d551d55133333333d551d5513333333333333333333333333333333333333333d551d551d55555513333333333333333
33333333333333333333333333333333511151113333333351115111333333333333333333333333333333333333333351115111511111113333333333333333
33333333333333333333333333333333ddddddd5ddd5ddd5ddddddd5333333333333333333333333333333333333333333333333333333333333333333333333
33333333333b33b33333333333333333d5555551d551d551d55555513333333333333333333b33b3333333333333333333333333333333333333333333333333
333333333b3b33b33333333333333333d5555551d551d551d555555133366333333333333b3b33b3333333333333333333333333333333333333333333333333
3333333335353353333333333333333351111111d551d55151111111333666333333333335353353333333333333333333333333333333333333333333333333
33333333333333333333333333333333ddddddd5d551d551ddddddd5333555333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333d5555551d551d551d5555551333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333d5555551d551d551d5555551333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333511111115111511151111111333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
3333333333333333333333333333333333b333333333333333333333333333333333333333333333333333333333333333b33333333333333333333333333333
3333333333333333333333333333333333b3b3333333333333333333333333333333333333333333333333333333333333b3b333333333333333333333333333
33333333333333333333333333333333335353333333333333333333333333333333333333333333333333333333333333535333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333dddd33333333333333333333333333333333333333333333
333333333333333333333333333333333333333333333333333333333333333333dddd353333333ddffd33333333333333333333333333333333333333333333
3333333333333333333333333333333333333333333b33b333333333333333333ddffd533333333d7f7dd3333333333333333333333333333333333333333333
33333333333333333333333333333333333333333b3b33b333333333333333333d7f7ddd333333ddfffddd333333333333333333333333333333333333333333
3333333333333333333333333333333333333333353533533333333333333333ddfffddd333333fdffdddd333333333333333333333333333333333333333333
3333333333333333333333333333333333333333333333333333333333333333ddffdddd333333dddddddd333333333333333333333333333333333333333333
3333333333333333333333333333333333333333333333333333333333333333dddddddd3333333dddddd3333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333dddddd3333333ff333ff3333333333333333333333333333333333333333333
3333333333333333333333333333333333333333333333333333333333333333333ff33333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333b33b333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333b3b33b333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333535335333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333333333333333b3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333333333333333b3b33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333353533333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
3333333333333333333333333333333333333333333333333333333333333333ddd5ddddddd5ddddddd5ddddddd5dddd33333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333335555dd555555dd555555dd555555dd5533333333333333333333333333333333
3333333333333333333333333333333333333333333333333333333333333333ddd5dd5dddd5dd5dddd5dd5dddd5dd5d33333333333333333333333333333333
3333333333333333333333333333333333333333333333333333333333333333dd5555dddd5555dddd5555dddd5555dd33333333333333333333333333333333
3333333333333333333333333333333333333333333333333333333333333333ddddd5d5ddddd5d5ddddd5d5ddddd5d533333333333333333333333333333333
3333333333333333333333333333333333333333333333333333333333333333555dd5dd555dd5dd555dd5dd555dd5dd33333333333333333333333333333333
3333333333333333333333333333333333333333333333333333333333333333dd55d555dd55d555dd55d555dd55d55533333333333333333333333333333333
3333333333333333333333333333333333333333333333333333333333333333dd5dd5dddd5dd5dddd5dd5dddd5dd5dd33333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333ddd5ddddddd5ddddddd5ddddddd5ddddddd5ddddddd5dddd333333333333333333333333
333333333333333333333333333333333333333333333333333333335555dd555555dd555555dd555555dd555555dd555555dd55333333333333333333333333
33333333333333333333333333333333333333333333333333333333ddd5dd5dddd5dd5dddd5dd5dddd5dd5dddd5dd5dddd5dd5d333333333333333333333333
33333333333333333333333333333333333333333333333333333333dd5555dddd5555dddd5555dddd5555dddd5555dddd5555dd333333333333333333333333
33333333333333333333333333333333333333333333333333333333ddddd5d5ddddd5d5ddddd5d5ddddd5d5ddddd5d5ddddd5d5333333333333333333333333
33333333333333333333333333333333333333333333333333333333555dd5dd555dd5dd555dd5dd555dd5dd555dd5dd555dd5dd333333333333333333333333
33333333333333333333333333333333333333333333333333333333dd55d555dd55d555dd55d555dd55d555dd55d555dd55d555333333333333333333333333
33333333333333333333333333333333333333333333333333333333dd5dd5dddd5dd5dddd5dd5dddd5dd5dddd5dd5dddd5dd5dd333333333333333333333333
33333333333333333333333333333333333333333333333333333333ddd5ddddddd5ddddddd5ddddddd5ddddddd5ddddddd5dddd333333333333333333333333
333333333333333333333333333333333333333333333333333333335555dd555555dd555555dd555555dd555555dd555555dd55333333333333333333333333
33333333333333333333333333333333333333333333333333333333ddd5dd5dddd5dd5dddd5dd5dddd5dd5dddd5dd5dddd5dd5d333333333333333333333333
33333333333333333333333333333333333333333333333333333333dd5555dddd5555dddd5555dddd5555dddd5555dddd5555dd333333333333333333333333
33333333333333333333333333333333333333333333333333333333ddddd5d5ddddd5d5ddddd5d5ddddd5d5ddddd5d5ddddd5d5333333333333333333333333
33333333333333333333333333333333333333333333333333333333555dd5dd555dd5dd555dd5dd555dd5dd555dd5dd555dd5dd333333333333333333333333
33333333333333333333333333333333333333333333333333333333dd55d555dd55d555dd55d555dd55d555dd55d555dd55d555333333333333333333333333
33333333333333333333333333333333333333333333333333333333dd5dd5dddd5dd5dddd5dd5dddd5dd5dddd5dd5dddd5dd5dd333333333333333333333333
33333333333333333333333333333333333333333333333333333333ddd5ddddddd5ddddddd5ddddddd5dddd3333333333333333333333333333333333333333
333333333333333333333333333333333333333333333333333333335555dd555555dd555555dd555555dd553333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333ddd5dd5dddd5dd5dddd5dd5dddd5dd5d3333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333dd5555dddd5555dddd5555dddd5555dd3333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333ddddd5d5ddddd5d5ddddd5d5ddddd5d53333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333555dd5dd555dd5dd555dd5dd555dd5dd3333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333dd55d555dd55d555dd55d555dd55d5553333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333dd5dd5dddd5dd5dddd5dd5dddd5dd5dd3333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333ddd5ddddddd5ddddddd5dddd333333333333333333333333333333333333333333333333
333333333333333333333333333333333333333333333333333333335555dd555555dd555555dd55333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333ddd5dd5dddd5dd5dddd5dd5d333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333dd5555dddd5555dddd5555dd333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333ddddd5d5ddddd5d5ddddd5d5333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333555dd5dd555dd5dd555dd5dd333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333dd55d555dd55d555dd55d555333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333dd5dd5dddd5dd5dddd5dd5dd333333333333333333333333333333333333333333333333

__gff__
0000000000000000000000000000000001010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0101010101010101010101012001010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0201010103012001010201010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010105010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010110011001010101011011010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010111011101010120011110010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103010110111005010301010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0120010102010101010120010201010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101012001010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101030101010101010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101030101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101020101010101010101010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101131313130101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010113131313131301010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010113131313131301010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010113131313010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010120010113131301010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000002001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
013c00002605428054290542b0542d0542e0543005432054260042800424004260040000400004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400004
011000002605026050260502605026000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000002805028050280502805000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000002905029050290502905000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000002b0502b0502b0502b05000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000002d0502d0502d0502d05000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000002e0502e0502e0502e05000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000003005030050300503005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000003205032050320503205000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
04 01030544

