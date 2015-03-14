--Shaman Skull Quest 6


function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);

	if(qglobals["shmskullquest"] ~= nil) then
		if(e.message:findi("hail") and tonumber(qglobals["shmskullquest"]) >= 8) then
			e.self:Say("Ahh!! A conversationalist. How good to meet you, Cradossk. Yes. I have heard of you. Go ahead and ask for that which has brought you to my tower and emboldened you to slay my weaker minions.");
		elseif(e.message:findi("Give me the skull of the sisters of scale") and tonumber(qglobals["shmskullquest"]) >= 8) then
			e.self:Say("What a coincidence! I, too, seek a skull. Perhaps you might help me [obtain the skull]. Perhaps then you shall have the skull you desire.");
		elseif(e.message:findi("I will help you obtain the skull") and tonumber(qglobals["shmskullquest"]) >= 8) then
			e.self:Say("I am sure you would not mind removing the head of a scaled mystic. I hope not. There is an old Iksar who once called me slave. Now he shall adorn my wall, mounted on a fine plaque. His name is Digalis. Find him. Do not return until your task is complete.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);
	
	if(qglobals["shmskullquest"] ~= nil) then
		if(item_lib.check_turn_in(e.trade, {item1 = 12764}) and tonumber(qglobals["shmskullquest"]) >= 8) then
			e.other:SummonItem(12750);
			e.self:Shout("Excellent. You show signs of a true Iksar slayer. Too, bad I have already given the skull of the Sister of Scale to another. Perhaps you would like to meet him before he departs. Say hello, Doval.");
			eq.unique_spawn(87154,0,0,e.self:GetX() + 5,e.self:GetY(),e.self:GetZ());
			eq.set_timer("heal",20000);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_timer(e)
	if(e.timer == "heal") then
		e.self:CastSpell(12,87154);
	end
end

function event_signal(e)
	if(e.signal == 1) then
		eq.stop_timer("heal");
	end
end

function event_death_complete(e)
	eq.stop_timer("heal");
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
