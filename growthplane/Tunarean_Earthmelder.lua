-- items: 31424, 31425, 31426, 31423, 1208, 31419, 31420, 31421, 31422, 1207
function event_spawn(e)
	eq.set_timer("hum",90000);
end

function event_timer(e)
	e.self:Emote("seems to pulse as its roots dig into the ground around it.");
end

function event_say(e)
	if(e.other:GetLevel() >= 55) then
		if(e.message:findi("hail")) then
			e.self:Say("Hail, my friend. Unfortunately I cannot talk right now. The giants must be dealt with.");
		elseif(e.message:findi("giants")) then
			e.self:Say("The giants are continuing to put forth efforts to encroach the lands blessed by Tunare. We need an outrider or preserver to aid us in our continued fight.");
		elseif(e.message:findi("preserver")) then
			e.self:Say("Noble preserver, you will be needed to combat the priests of the warbringer. Scouts have reported three priests wandering the Wakening Lands in search of a site to build a shrine to their god. Seek them out, kill them, and bring their heads and those of anyone else involved.");
		elseif(e.message:findi("outrider")) then
			e.self:Say("We have need of you to disrupt the construction efforts of the giants in the Wakening Land. Find the frost giant overseer, kill him and any others that are responsible for the building and bring back their heads.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 31424,item2 = 31425,item3 = 31426,item4 = 31423}) and e.other:GetLevel() >= 55) then
		e.self:Say("You have done well, " .. e.other:GetCleanName() .. ".  Here, take this item and use it well! Your efforts will not be forgotten.");
		e.other:SummonItem(1208); -- Gloves of Earthcrafting
    e.other:AddEXP(2500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 31419,item2 = 31420,item3 = 31421,item4 = 31422}) and e.other:GetLevel() >= 55) then
		e.self:Say("You have done well, " .. e.other:GetCleanName() .. ".  Here, take this item and use it well! Your efforts will not be forgotten.");
		e.other:SummonItem(1207); -- Helm of the Tracker
    e.other:AddEXP(2500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	entity_list = eq.get_entity_list();

	if(e.signal == 1) then
		local mobtypeID =  entity_list:GetMobByNpcTypeID(127098);
		local follow_mob = mobtypeID:GetID();
		eq.follow(follow_mob);
	elseif(e.signal == 2) then
		eq.stop_follow();
	end
end
