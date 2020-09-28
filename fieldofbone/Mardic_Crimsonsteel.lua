--[[
Mardic Crimsonsteel rewrite
Drogerin
--]]

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
		if(e.message:findi("hail")) then
			if(qglobals["bersolo"] == "1" and e.other:GetLevel() >= 45) then
				e.self:QuestSay(e.other, "Hail, " .. e.other:GetName() .. ", Run along and give McArik the items he requested.");
				e.other:SummonItem(60196); --Item: Image Essence
				eq.delete_global("bersolo");
			else		
				e.self:QuestSay(e.other, "Hail to you, feared one. I see the glint of rage in them eyes of yours there. One day you'll be able to recognize the same in others. I suppose now is the time to talk to you about the mirage around here. Tell you the truth, I wasn't able to beat it myself... that's why I'm out here and not establishing myself as a berserker.");
				e.self:QuestSay(e.other, "I wasn't meant for that path. I'm here to guide folk like yourself and help you gain control of the insane beast that lurks inside you. You must be prepared to fight one like yourself. All ye need are your wits, brawn, and skill, nought else. When you are ready give me the note McArik gave you and I'll send you to the training grounds.");
			end
		end
	
end	

function event_timer(e)
	if (e.timer == "spawn") then
		eq.spawn2(78212,0,0,920,518,175,130);  --Berserker’s Image
		eq.stop_timer("spawn");
	end
end

function event_signal(e)
	if (e.signal == 15) then
		eq.spawn2(78213,0,0,985,520,175,130); --NPC: Berserker`s_Image
	end
end
		

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 60195})) then -- Sealed Note for Mardic
		e.other:MovePC(78,1065,525,176,388); -- Field of Bone test area.
		eq.set_timer("spawn",15000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
