local rogue_info = { "Innoruuk's Realm", 6, 36 } -- name from log pasted on safehouse
local rogue_dz = { "hateplaneb", 1, eq.seconds("1h") }
rogue_dz.compass = { "oasis", 411.22, -378.93, 130.52 }
rogue_dz.safereturn = { "oasis", 411.22, -378.93, 130.52, 0 } -- unknown
rogue_dz.zonein = { -389.93, -853.94, 2.19, 258 }

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I will scour this desert until the one with the orb arrives. Leave me to my wandering, weakling!");
	end
	--local raid = e.other:GetRaid();
	--local instance_id = eq.get_instance_id("hateplaneb", 1);
	--eq.remove_all_from_instance(instance_id);
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);
	
	if(qglobals["Fatestealer"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 9599 })) then
		e.other:Message(13,"The sky crackles with electricity as ominous russet clouds gather overhead, forming a churning funnel above the tower. A feeling of pure hatred washes over you.")
		local dz = e.other:CreateExpedition(rogue_dz, rogue_info)
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
