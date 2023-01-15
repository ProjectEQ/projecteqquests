-- items: 17986, 12376, 12378

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is about time I met up with someone who I can tolerate.  Most of the residents within these plains shun gnomes.  I will happy to leave if I could just find those [pesky skeletons].");
	elseif(e.message:findi("pesky skeletons")) then
		e.self:Say("I was sent here by the Gemchoppers to seek out a pocketful of skeletons.  They are a creation of a one of Ak'Anon's exiled citizens.  He practiced the dark circle of magic and came to find the necromancers of Antonica.  He created and imported undead brownies to this realm.  We must find them to study them.  I can't seem to find them!!  If only I could find a [brave fighter] to assist me.");
	elseif(e.message:findi("brave fighter")) then
		e.self:Say("Very good. Take this tin box.  Fill each slot with the remains of the tiny undead, should you find them here.  I know not how many there exists, but I am sure that if I return this full tin box shall suffice.  Be quick, I have other matters to to tend to.  I shall depart when next my sun dial points to eight.");
		e.other:SummonItem(17986); -- Item: Empty Tin Box
		eq.set_timer("spawns",10000);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12376})) then
		e.self:Say("Good Work. Unfortunately, I must investigate other matters in the name of Ak'anon.  Here.  You deliver the tin box to Lord Jenork of the Gem Choppers.  He shall reward you. Be safe my friend.  I must go now. Farewell.");
		e.other:SummonItem(12378); -- Give Undead Brownie Bones for turnin to Narron Jenork (Ak'Anon)
		e.other:Ding();
		e.other:Faction(255,15,0); -- Gem Choppers
		e.other:Faction(288,15,0); -- Merchants of Ak'Anon
		e.other:Faction(333,15,0); -- King Ak'Anon
		e.other:Faction(238,-15,0); -- Dark Reflection
		e.other:AddEXP(10000);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer == "spawns") then
		eq.spawn2(13120,106,0,-1839,829,18,0); -- NPC: a_tiny_skeleton
		eq.spawn2(13120,106,0,-2149,10351,18,0); -- NPC: a_tiny_skeleton
		eq.spawn2(13120,106,0,-1713,1075,17,0); -- NPC: a_tiny_skeleton
		eq.spawn2(13120,106,0,-1690,363,-7,0); -- NPC: a_tiny_skeleton
		eq.spawn2(13120,106,0,-2604,222,-44,0); -- NPC: a_tiny_skeleton
	end
end
