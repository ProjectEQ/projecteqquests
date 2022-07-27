-- items: 9599
local rogue_dz = {
	expedition = { name="Innoruuk's Realm", min_players=6, max_players=36 }, -- name from log pasted on safehouse
	instance   = { zone="hateplaneb", version=1, duration=eq.seconds("1h") },
	compass    = { zone="oasis", x=411.22, y=-378.93, z=130.52 },
	safereturn = { zone="oasis", x=411.22, y=-378.93, z=130.52, h=0 }, -- unknown
	zonein     = { x=-389.93, y=-853.94, z=2.19, h=258 }
}

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I will scour this desert until the one with the orb arrives. Leave me to my wandering, weakling!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);

	if(qglobals["Fatestealer"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 9599 })) then
		e.other:Message(13,"The sky crackles with electricity as ominous russet clouds gather overhead, forming a churning funnel above the tower. A feeling of pure hatred washes over you.")
		local dz = e.other:CreateExpedition(rogue_dz)
		if not dz.valid then
			e.other:SummonItem(9599); -- Item: Pulsating Blue Metal Sphere
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
