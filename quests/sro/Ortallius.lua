-- DEVELOPER: KOVOU
-- DEVELOPER: UNKOWN Gem Turn in text was already present

-- *** NPC INFORMATION ***

-- NAME: Ortallius
-- ID: 35036
-- ZONE: sro
-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the lands of Ro. Stand and fight with me. We shall fight to reclaim the desert in the name of Solusek Ro. Death to all [dervish cutthroats]!!");
	elseif(e.message:findi("dervish cutthroats")) then
		e.self:Say("The dervish cutthroats are the vile scum who inhabit the desert. They are rogues who assault wayward travelers. Solusek Ro has commanded their extermination!! Do you wish to [join the crusade]?");
	elseif(e.message:findi("join the crusade")) then
		e.self:Emote("grins enthusiastically. 'The scum rarely wander far from their camps. Hunt them down and I will reward you for every three insignia rings you bring as proof of their deaths.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12348, item2 = 12349})) then -- 2 Gems
		e.self:Say("You serve the Burning Prince as I do. The Redeemed has instructed me to give you this reward upon completion of your test. Practice your arts and prepare yourself. Evil approaches our realm. Long live Ro!!");
		e.other:Ding();
		e.other:SummonItem(7041);	-- Burning Rapier
		e.other:Faction(442,10,0);	-- faction better: 'Temple Of Sol Ro'
		e.other:Faction(291,-30,0);	-- faction worse: 'Shadowed Men'
		e.other:GiveCash(0,0,0,4);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 1903})) then
		e.self:Say("You will make a fine addition to the crusade. Continue the cleansing of the desert. Let it be known that the Defenders of Ro are here to challenge the evils of the desert. I call upon the righteousness of all paladins to assist me.");
		e.other:Ding();
		e.other:AddEXP(250);
		e.other:SummonItem(eq.ChooseRandom(5013,5014,5015,5016,5019,5020,5020,5021,5022,5023,5024,5025,5013,5014,5015,5016,5019,5020,5020,5021,5022,5023,5024,5025,5013,5014,5015,5016,5019,5020,5020,5021,5022,5023,5024,5025,3040,3042,3043,3044,3046,3047,3048,3049,3050,3051));
		e.other:Faction(442,1,0);		-- faction better: 'Temple Of Sol Ro'
		e.other:Faction(291,-3,0);		-- faction worse: 'Shadowed Men'
		e.other:GiveCash(8,4,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
