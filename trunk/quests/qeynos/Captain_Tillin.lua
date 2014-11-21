function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. "! Spend your time wisely in the city of Qeynos. Do not let your mind wander to thoughts of bravado or crime. My guards can easily put to rest any outbreaks. Good day to you, citizen!");
	end
end

function event_signal(e)
	e.self:Say("Ah.  Good.  You have arrived.  Executioner, could you please visit McNeal Jocub at Fish's Tavern.  He has violated our laws and the sentence is death.");
	eq.signal(1202);
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13915, item2 = 13915, item3 = 13915, item4 = 13915})) then -- Gnoll Fang x 4
		e.self:Say("Very good! One less gnoll the people of Qeynos need to fear. Here is your bounty as promised.");
		e.other:SummonItem(10070); -- Moonstone
		e.other:SummonItem(10070); -- Moonstone
		e.other:SummonItem(10070); -- Moonstone
		e.other:SummonItem(10070); -- Moonstone
		e.other:Ding();
		e.other:Faction(9,4,0); -- Antonius Bayle
		e.other:Faction(33,-4,0); -- Circle of Unseen Hands
		e.other:Faction(53,-4,0); -- Corrupt Qeynos Guards
		e.other:Faction(135,4,0); -- Guards of Qeynos
		e.other:Faction(217,4,0); -- Merchants of Qeynos
		e.other:AddEXP(2000);
	if(item_lib.check_turn_in(e.trade, {item1 = 13915, item2 = 13915, item3 = 13915})) then -- Gnoll Fang x 3
		e.self:Say("Very good! One less gnoll the people of Qeynos need to fear. Here is your bounty as promised.");
		e.other:SummonItem(10070); -- Moonstone
		e.other:SummonItem(10070); -- Moonstone
		e.other:SummonItem(10070); -- Moonstone
		e.other:Ding();
		e.other:Faction(9,3,0); -- Antonius Bayle
		e.other:Faction(33,-3,0); -- Circle of Unseen Hands
		e.other:Faction(53,-3,0); -- Corrupt Qeynos Guards
		e.other:Faction(135,3,0); -- Guards of Qeynos
		e.other:Faction(217,3,0); -- Merchants of Qeynos
		e.other:AddEXP(1500);
	if(item_lib.check_turn_in(e.trade, {item1 = 13915, item2 = 13915})) then -- Gnoll Fang x 2
		e.self:Say("Very good! One less gnoll the people of Qeynos need to fear. Here is your bounty as promised.");
		e.other:SummonItem(10070); -- Moonstone
		e.other:SummonItem(10070); -- Moonstone
		e.other:Ding();
		e.other:Faction(9,2,0); -- Antonius Bayle
		e.other:Faction(33,-2,0); -- Circle of Unseen Hands
		e.other:Faction(53,-2,0); -- Corrupt Qeynos Guards
		e.other:Faction(135,2,0); -- Guards of Qeynos
		e.other:Faction(217,2,0); -- Merchants of Qeynos
		e.other:AddEXP(1000);
	if(item_lib.check_turn_in(e.trade, {item1 = 13915})) then -- Gnoll Fang
		e.self:Say("Very good! One less gnoll the people of Qeynos need to fear. Here is your bounty as promised.");
		e.other:SummonItem(10070); -- Moonstone
		e.other:Ding();
		e.other:Faction(9,1,0); -- Antonius Bayle
		e.other:Faction(33,-1,0); -- Circle of Unseen Hands
		e.other:Faction(53,-1,0); -- Corrupt Qeynos Guards
		e.other:Faction(135,1,0); -- Guards of Qeynos
		e.other:Faction(217,1,0); -- Merchants of Qeynos
		e.other:AddEXP(500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18811})) then
		e.self:Say("Very good! One less gnoll the people of Qeynos need to fear. Here is your bounty as promised.");
		e.other:SummonItem(13305);
		e.other:Ding();
		e.other:Faction(9,1,0); -- Antonius Bayle
		e.other:Faction(33,-1,0); -- Circle of Unseen Hands
		e.other:Faction(53,-1,0); -- Corrupt Qeynos Guards
		e.other:Faction(135,1,0); -- Guards of Qeynos
		e.other:Faction(217,1,0); -- Merchants of Qeynos
		e.other:AddEXP(500);
		e.other:GiveCash(math.random(10),math.random(10),math.random(10),math.random(10));
		eq.spawn2(1202,62,0,-412,75,-24,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18912})) then
		e.self:Say("So, an assassin has been sent to Qeynos! I shall have my guards keep an eye out for any suspicious looking visitors. As for you... you should speak with the Surefall Glade ambassador. Ambassador Gash is staying at the Lion's Mane Inn here in South Qeynos. Inform him that [an assassin has been sent to kill] him. Do not let the assassin near him!");
		e.other:Ding();
		e.other:Faction(9,1,0); -- Antonius Bayle
		e.other:Faction(33,-1,0); -- Circle of Unseen Hands
		e.other:Faction(53,-1,0); -- Corrupt Qeynos Guards
		e.other:Faction(135,1,0); -- Guards of Qeynos
		e.other:Faction(217,1,0); -- Merchants of Qeynos
		e.other:AddEXP(500);
		e.other:GiveCash(math.random(10),math.random(10),math.random(10),math.random(10));
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1077 -- Captain_Tillin