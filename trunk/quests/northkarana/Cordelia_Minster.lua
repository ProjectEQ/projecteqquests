-- Winds of Karana
-- Broken Lute

function event_waypoint_arrive(e)
	if(e.wp == 1 or e.wp == 3 or e.wp == 8) then
		e.self:SetRunning(true);
	elseif(e.wp == 2 or e.wp == 6 or e.wp == 10) then
		e.self:SetRunning(false);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I can not find my flute, my favorite possesion. Is there anyone who cam [help] me?");
	elseif(e.message:findi("help")) then
		e.self:Say("My flute is missing, I think that old dirty hermit took off with it. He is always taking off with my things.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13310})) then -- A cracked Flute
		e.self:Say("Ohh!! I see you got my flute back. For that I can not be thankful enough but while sitting here I spotted what looks to be a sheet of music but it looks incomplete. Maybe you can find out who it belongs to.");
		e.other:SummonItem(13119); -- Winds of Karana sheet 2
		e.other:Ding();
		e.other:Faction(135,2,0);
		e.other:Faction(184,2,0);
		e.other:Faction(192,2,0);
		e.other:Faction(207,-5,0);
		e.other:Faction(273,-5,0);
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE zone:northkarana ID:13037 -- Cordelia_Minster.pl