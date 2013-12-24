-- BeginFile: qey2hh1\#Shady_Bandit.pl
-- Quest file for West Karana - Shady Bandit: Necromancer Epic 1.5 (pre)

function event_spawn(e)
	eq.set_timer("ShadyDepop", 1800000); -- Depop after 30 minutes
end

function event_say(e)
	if(e.message:findi("hail")) then
		eq.attack(e.other:GetName());
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer == "ShadyDepop") then
		eq.depop();
	end
end

-- EndFile: qey2hh1\#Shady_Bandit.lua (12185)
-- converted to lua by: robregen