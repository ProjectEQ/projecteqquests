-- items: 13954, 13955
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Gree.. .. tings. How are you? Don't get too close to me. I've [come down] with something bad.");
	elseif(e.message:findi("come down")) then
		e.self:Say("Ever since that wolf bit me on the way to Qeynos I have been feeling ill. My strength is all gone and I...  I... I need the [potion].");
	elseif(e.message:findi("potion")) then
		e.self:Say("I have been informed that the potions of the Temple of Life will help me.  The [potion is my last chance] - that is what Astaed Wemor of the temple told me.");
		
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13954})) then -- Prime Healer Potion (Good)
		e.self:Say("Thank you!! I felt the madness nearing my brain, but now I feel much better. Please take this as thanks - it is all I have to donate to Astaed Wemor. Be sure he gets it. I shall thank Rodcet Nife every day for sending help.");
		-- confirmed live factions
		e.other:Faction(341,1,0); -- Faction: Priests of Life
		e.other:Faction(280,1,0); -- Faction: Knights of Thunder
		e.other:Faction(262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(221,-1,0); -- Faction: Bloodsabers
		e.other:Faction(219,1,0); -- Faction: Antonius Bayle
		e.other:QuestReward(e.self,0,0,0,0,13970,50000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13955})) then	-- Prime Healer Potion (Bad)
		e.self:Say("Please let this help...  nnnnghhh!...  I fear it is too late...  Aaaarrrgh!...  I...   I will...   KILL YOU!");
		eq.attack(e.other:GetName());
		-- confirmed live factions
		e.other:Faction(341,10,0); -- Faction: Priests of Life
		e.other:Faction(280,3,0); -- Faction: Knights of Thunder
		e.other:Faction(262,5,0); -- Faction: Guards of Qeynos
		e.other:Faction(221,-2,0); -- Faction: Bloodsabers
		e.other:Faction(219,1,0); -- Faction: Antonius Bayle
		e.other:QuestReward(e.self,0,0,0,0,0,50000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
