-- Quest Name: Treskar's Secret Mission
-- Quest for SK GM Treskar in Grobb

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You dare speak to Master Treskar!! You be [sent by Hukulk] or you be hurtin'!! Me have no time to waste with ugly one like you!!");
	elseif(e.message:findi("sent by hukulk")) then
		e.self:Say("Ha!! Hukulk accept puny troll now?!! Ha!! You join us and you join fight. Nightkeep enemy is " .. e.other:GetName() .. " enemy!! You help smash [other weak shadowknights]. Them weak. We true power!! You bash good and maybe you do [secret mission] for Treskar. Or I has sum other [work] fer you.");
	elseif(e.message:findi("other weak shadowknights")) then
		e.self:Say("Ha! Dem Ogre Greenbloods are weaklings. Dems your enemy. Frogloks are your enemy. Smash all Greenbloods! Smash all Frogloks!");
	elseif(e.message:findi("secret mission")) then -- Should have a faction check. However, since the Trolls haven't eaten you, we'll let you do it.
		e.self:Say("Nightkeep hear bashers see fungus man spore guardian at Innothule. Him protect young fungus man spores so they grow big, BIG an' attack trolls!! You go find spore guardian. Smash hi big red head!! Bring Treskar that huge mushroom head of his to prove he walk no more. You do this and me give you froglok skin mask.");
	elseif (e.message:findi("work")) then
		e.self:Say("So you not want to smash the weak Greenbloods. Dats ok, you can bring me three ruined wolf hides and a fire beetle eye. Dat help you git big enuff to smash dem.");
	elseif (e.message:findi("another")) then
		e.self:Say("You dun gud on the other job. I am feeling hungry, I want to make me a pie. You bring me two snake eggs and I give you a present.");
	elseif (e.message:findi("next")) then
		e.self:Say("I need you to go bash dem bad orcs. The Deathfist have ruined our lands and we will not allow it. Bring me three slashed belts of the Deathfist.");
	elseif (e.message:findi("final")) then
		e.self:Say("Here is your last task. When this done, you ready to bash Greenbloods. I need two meats from wolves and 2 snake scales.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12190})) then
		e.self:Say("Ha! Dats one big dead head. You smashed him guud. Take dis mask, Shadowknight uv Nightkeep - I seez great tings for you."); -- Guessed Dialog as quest was revised when removed to Neriak
		e.other:SummonItem(2308);
		e.other:Ding();
		e.other:Faction(66,50,0); 	-- Da Bashers (Grobb general guards)
		e.other:Faction(22,-20,0); 	-- Broken Skull Clan
		e.other:Faction(292,50,0); 	-- Shadowknights of Night Keep (Troll SK)
		e.other:Faction(22,-10,0); 	-- Green Blood Knights (Ogre SK)
		e.other:AddEXP(10000); 		-- Appropriate for ~level 10?
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13782,item2 = 13782,item3 = 13782, item4 = 10307})) then
		e.self:Say("Dats gud, here take dis armor to helps you be stronger. Come sees me when you want [another] job");
		e.other:SummonItem(2104);
		e.other:Ding();
		e.other:AddEXP(1000);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13088, item2 = 13088})) then
		e.self:Say("Dis is good.  I go make a pie now. Here is sumting for your help. Come see me agin when you want your [next] job.");
		e.other:SummonItem(eq.ChooseRandom(2145, 2140, 2144, 2137, 2137, 2138, 2147, 2139, 2146, 2142, 2148, 2143)); -- Random raw-hide armor
		e.other:Ding();
		e.other:AddEXP(1000);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13916,item2 = 13916,item3 = 13916})) then
		e.self:Say("Very good! We turn you into a basher yet. Here you go. Come see me when you want your [final] task.");
		e.other:SummonItem(eq.ChooseRandom(6031, 5070, 5071, 7024, 5042, 5047, 6033)); -- Random tarnished weapon
		e.other:Ding();
		e.other:AddEXP(1000);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13403,item2 = 13403,item3 = 13070, item4 = 13070})) then
		e.self:Say("Dats what I needed. Here you go.");
		e.other:SummonItem(eq.ChooseRandom(6014, 5023, 6013, 7009, 5013, 5021)); -- Random rusty weapon
		e.other:Ding();
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- End - SK GM Treskar, Grobb