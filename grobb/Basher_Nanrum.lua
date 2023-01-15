-- Quest Name: A job for Nanrum
-- Author: BWStripes
-- Converted to .lua by Speedz
-- Added support for Urako's Big Mistake
-- items: 10307, 10351, 10026, 10060, 10018, 10006, 10017

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Peh! What am you wanted?! I am Basher Nanrum. You? " .. e.other:GetName() .. "? Heh, you look for works? Hmm, me tinks you too weakling for [" .. eq.say_link("job",false,"job") .. "] me need done. Hmm.. You might do, mebbe.");
	elseif(e.message:findi("job")) then
		e.self:Say("Me in charge of making torches for basher patrols. But Nanrum is much too mighty for such stupid job and Nanrum get idea. Dem fire bugses in da desert - dem eyes glowed. And dem don't burneded like torches. If " .. e.other:GetName() .. " getted Nanrum three fire beetle eyes me would giveded " .. e.other:GetName() .. " a shiny thingie dat you wanteded. Go ahed, " .. e.other:GetName() .. " , an' get me da eyes.");
	elseif(e.message:findi("where is the skeleton")) then
		e.self:Say("Yeah!  Me see dat bone man.  He over by da Cleaver.  He tink he a butcher or sumting!");
		eq.unique_spawn(52118,0,0,-459,359,10,0); -- NPC: a_skeleton
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 10307, item2 = 10307, item3 = 10307})) then
		e.self:Say("Heh heh. All da eyeballses! I didn't think ya could do it but ya did. Here is da shiny. If you gets more I always have more shinies.");
		e.other:SummonItem(eq.ChooseRandom(10351, 10026, 10060, 10018, 10006, 10017)); -- Item(s): Brass Earring (10351)
		e.other:Faction(235,1,0); -- Da Bashers
		e.other:Faction(222,-1,0); -- Broken Skull Clan
		e.other:Ding();
		e.other:AddEXP(100);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 10307, item2 = 10307})) then
	 	e.self:Say("Well dat be some of da eyeballses I askeded for. But I you needs ta give me three for da shiny.");
		e.other:SummonItem(10307,2); -- Item: Fire Beetle Eye
	elseif (item_lib.check_turn_in(e.trade, {item1 = 10307})) then
	 	e.self:Say("Well dat be some of da eyeballses I askeded for. But I you needs ta give me three for da shiny.");
		e.other:SummonItem(10307); -- Item: Fire Beetle Eye
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
