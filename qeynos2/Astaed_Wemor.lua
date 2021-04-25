-- items: 18862, 26022, 26023, 26024, 26025, 13952, 13954, 13970, 6356
function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I am Astaed Wemor of the Paladins of the Temple of Life. We are the defenders of the all-giving Prime Healer.  Are you [here to pray] or are you [here to assist the temple]?");
	elseif(e.message:findi("here to pray")) then
		e.self:Say("Then pray long and silently, " .. e.other:GetName() .. ".  Fill your soul with the breath of life.");
	elseif(e.message:findi("assist the temple")) then
		e.self:Say("Good.  There are a few in the congregation who require assistance.  Will you be [traveling afar] or are you [staying close to Qeynos]?");
	elseif(e.message:findi("traveling afar")) then
		if (fac <= 4) then
			e.self:Say("Then outfit yourself well. We will require you to visit Rivervale, the village of the halflings. There you shall find an herb merchant named Kizzie Mintopp. She has an ingredient we require. Tell her you are from the Temple of Life");
		else
			e.self:Say("I do not dislike you, but I cannot fully trust one who has yet to prove his service to the Prime Healer.  Perhaps you can assist us in ridding the land of diseased animals.  Priestess Caulria will accept all pelts from rabid beasts."); 
		end
	elseif(e.message:findi("staying close to qeynos")) then
		if (fac <= 4) then
			e.self:Say("Then you can help with one of our distraught members. The priests have noticed that Nerissa Clothspinner has been a little down lately. Go console her and ask her how she is doing. She is a sweet girl and the temple is worried about her.");
		else
			e.self:Say("I do not dislike you, but I cannot fully trust one who has yet to prove his service to the Prime Healer.  Perhaps you can assist us in ridding the land of diseased animals.  Priestess Caulria will accept all pelts from rabid beasts."); 
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local fac = e.other:GetFaction(e.self);

	if(item_lib.check_turn_in(e.trade, {item1 = 18862})) then
		if (fac <= 4) then
			e.self:Say("So you have helped Nerissa. That is good. Here, then, is a small reward. May you find it useful. Keep fighting the good fight!");
			e.other:SummonItem(ChooseRandom(6022,6023,6024,6025)); -- Item(s): Bronze Warhammer (6022), Bronze Flail (6023), Bronze Morning Star (6024), Bronze Warclub (6025)
			e.other:Ding();
			e.other:Faction(341,1,0); -- Faction: Priests of Life
			e.other:Faction(280,1,0); -- Faction: Knights of Thunder
			e.other:Faction(262,1,0); -- Faction: Guards of Qeynos
			e.other:Faction(221,-1,0); -- Faction: Bloodsabers
			e.other:Faction(219,1,0); -- Faction: Antonius Bayle
			e.other:AddEXP(4000);
			e.other:GiveCash(0,7,12,0);
		end
	 elseif(item_lib.check_turn_in(e.trade, {item1 = 13952})) then
		e.self:Say("I pray to Rodcet Nife that you have made it back in time. Let's add a small amount of this honey jum to this and.. here is the potion. This potion must be taken to a sick member of the congregation. The man is Lempeck Hargrin. He lives in the west plains of Karana between the river and the crop fields. He is in dire need of this potion. He has an odd disease. We have tried everything to cure him and this is his last chance. Run to him.");
		e.other:SummonItem(13954); -- Item: Prime Healer Potion
		e.other:Ding();
		e.other:Faction(341,30,0); -- Faction: Priests of Life
		e.other:Faction(280,30,0); -- Faction: Knights of Thunder
		e.other:Faction(262,10,0); -- Faction: Guards of Qeynos
		e.other:Faction(221,-10,0); -- Faction: Bloodsabers
		e.other:Faction(219,10,0); -- Faction: Antonius Bayle
		e.other:AddEXP(1000);
		e.other:GiveCash(0,5,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13970})) then
		e.self:Say("It is good to know that we saved Lempeck. He has given us his scythe as a donation to the temple. We shall find a use for it. As for your fine work at preserving the life of another, I reward you with the Shining Star of Life. Should you ever desire more strength in battle, call upon it to give you strength, but let it be known that at battle's end, you shall feel weaker than before you called upon the power. Just for a short time. When the power is drained, go to our temple storehouse and ask Whysia to [recharge the Shining Star of Life]. Go and serve life.");
		e.other:SummonItem(6356); -- Item: Shining Star of Light
		e.other:Ding();
		e.other:Faction(341,30,0); -- Faction: Priests of Life
		e.other:Faction(280,30,0); -- Faction: Knights of Thunder
		e.other:Faction(262,10,0); -- Faction: Guards of Qeynos
		e.other:Faction(221,-10,0); -- Faction: Bloodsabers
		e.other:Faction(219,10,0); -- Faction: Antonius Bayle
		e.other:AddEXP(1000);
		e.other:GiveCash(0,11,8,0);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:qeynos2  ID:2094 -- Astaed_Wemor 
