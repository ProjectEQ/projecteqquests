-- items: 18801, 13302, 18934, 3040, 5231, 1037, 17005, 13003, 10008, 1005, 8791, 1336, 2910
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, fellow adventurer. Are you from Qeynos?");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18801})) then
		e.self:Say("My sister is in danger. She is all the family I have left. I shall be on my way soon. Please take her my handkerchief, so she knows you have contacted me. Thank you. I am thankful Nerissa ran into you. I just wonder why she did not tell Kane about her suspicions.");
		e.other:SummonItem(13302); -- Item: Monogrammed Cloth
		e.other:Ding();
		e.other:Faction(311,10,0); -- Faction: Steel Warriors
		e.other:Faction(262,10,0); -- Faction: Guards of Qeynos
		e.other:Faction(230,-10,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(330,-10,0); -- Faction: The Freeport Militia
		e.other:Faction(281,10,0); -- Faction: Knights of Truth
		e.other:AddEXP(2000);
		eq.unique_spawn(15193,135,0,-5521,-1870,3,452); -- NPC: #Guard_Elias
		e.other:GiveCash(0,0,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18934})) then -- sealed letter', filename='LoveToMilea'
		e.self:Say("Oh great!! I thought I'd saw that last of Plagus, or as all the women in the Steel Warriors called him, the Plague. Please do not tell him where I am. It must have been a long journey for you. Here. A little something for your wasted trip. I found it on the ground. Have fun going back to Freeport.");
		e.other:SummonItem(eq.ChooseRandom(3040,5231,1037,17005,13003,10008,1005,8791,1336,2910)); -- Item(s): Blackened Iron Coif (3040), Black Wolf Crown (5231), Fur Lined Shoes (1037), Backpack (17005), Small Lantern (13003), Gold Ring (10008), Cloth Shawl (1005), Ruined Rawhide Leggings (8791), Damask Cape (1336), Grizzly Hide Cloak (2910)
		e.other:Ding();
		e.other:Faction(311,10,0); -- Faction: Steel Warriors
		e.other:Faction(262,10,0); -- Faction: Guards of Qeynos
		e.other:Faction(230,-10,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(330,-10,0); -- Faction: The Freeport Militia
		e.other:Faction(281,10,0); -- Faction: Knights of Truth
		e.other:AddEXP(2000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Get out of here! It is time I dealt with this traitorous guard. Okay guard, let's get it on!!");
		eq.signal(15193,1,5000);  -- to Guard Elias
	end
end

-- END of FILE Zone:eastkarana  ID:15055 -- Milea_Clothspinner 

