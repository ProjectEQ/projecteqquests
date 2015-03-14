function event_waypoint_arrive(e)
	if(e.wp == 1 or e.wp == 12) then
		eq.set_anim(4052,1);
	elseif(e.wp == 5) then
		e.self:SetRunning(true);
	elseif(e.wp == 9) then
		e.self:SetRunning(false);
	end
end

function event_signal(e)
	e.self:Say("I am f.. fff.. fff.. fine, brother. You um.. don't need to worry about me so much. I am a big girl now.");
	eq.signal(4055,5);
end

function event_say(e)
	local fac = e.other:GetFaction(e.self);
	
	if(fac < 6) then
		if(e.message:findi("hail")) then
			e.self:Say("Um.. I do not know you. Please um.. leave me be.");
		elseif(e.message:findi("baobob sent me")) then
			e.self:Say(string.format("Oh.. Hello. My name is Chanda. %s is your name? That's a nice name. My [brother] sent you to talk to me? You must want some bear.. um.. [clothes].",e.other:GetName()));
		elseif(e.message:findi("brother")) then
			e.self:Say("umm.. My brother.. Um.. I mean my BROTHER.. He is the finest tanner there is. His name is Baobob and I love him very much.");
		elseif(e.message:findi("clothes")) then
			e.self:Say("I um.. know how to make.. umm.. [cloaks] and [boots]. Oh yes! and belts! I love to make bear skin belts! Um.. I really like [belts]. My [brother] says I have to start charging more gold for my stuff though..");
		elseif(e.message:findi("cloak")) then
			e.self:Say("I.. um.. can make.. um.. a good cloak for you. You have to get me a bear skin of high quality and my brother says I should not make them unless you also give me 21 gold pieces. I used to give them away but [Baobob] got mad at me so I don't do that anymore.");
		elseif(e.message:findi("belt")) then
			e.self:Say("Oh, yes, I like making belts! They are easy! All I need is a bear skin and 5 gold pieces. The bear skin doesn't have to be that great but don't bring me a ruined one. The gold was my brother's idea.. sorry.");
		elseif(e.message:findi("boot")) then
			e.self:Say("I know how to make boots. Um.. I don't like them as much as belts. They are harder to make. You have to get me a medium quality bear skin and give me 15 gold pieces if you want some bear boots. They are really good, though. At least that is what Baobob tells me.");
		end	
	else
		e.self:Say("Hmm.. I really would not feel comfortable helping you in that way. You need to prove yourself to me by aiding my friends and family in the Plains of Karana before I will help you.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13752, gold == 21})) then
		e.self:Say("Oh.. I see.. But um.. I still need the other thing before I can make anything for you.. sorry.");
		e.self:Say("Oh, good! I can make you a nice new cloak now. Here. Here. Oh, this.. it is a good one. Nice bear fur. Here you go!");
		e.other:SummonItem(2902);
		e.other:Ding();
		e.other:Faction(167,1,0); -- Karana Residents
		e.other:Faction(135,1,0); -- Guards of Qeynos
		e.other:Faction(257,1,0); -- Priests of Life
		e.other:Faction(183,1,0); -- Priests of Life
		e.other:AddEXP(500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13751, gold == 15})) then
		e.self:Say("Oh.. I see.. But um.. I still need the other thing before I can make anything for you.. sorry.");
		e.self:Say("Ohh good.. good! I.. um.. can make.. Oh great. Here you go. I hope you like it. I always um.. try my best. Tell your um.. friends where you got your bear things!");
		e.other:SummonItem(2903);
		e.other:Ding();
		e.other:Faction(167,1,0); -- Karana Residents
		e.other:Faction(135,1,0); -- Guards of Qeynos
		e.other:Faction(257,1,0); -- Priests of Life
		e.other:Faction(183,1,0); -- Priests of Life
		e.other:AddEXP(500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13750, gold == 5})) then
		e.self:Say("Oh.. I see.. But um.. I still need the other thing before I can make anything for you.. sorry.");
		e.self:Say("Great. Oh, here, now I can make the.. um.. ok.. here. Yes.. good. I love making bear skin belts. Here you go. I hope you like it.");
		e.other:SummonItem(2904);
		e.other:Ding();
		e.other:Faction(167,1,0); -- Karana Residents
		e.other:Faction(135,1,0); -- Guards of Qeynos
		e.other:Faction(257,1,0); -- Priests of Life
		e.other:Faction(183,1,0); -- Priests of Life
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
