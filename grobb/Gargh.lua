-- Converted to .lua by Speedz
-- added saylink by robregen
-- faction and converting to grobb version of quests by noudess
-- items: 13187, 7380, 13050, 13054, 7381, 13725, 7382, 22524, 7383, 13354, 7384

function event_say(e)
	local pfaction = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("You [" .. eq.say_link("friend of Gardunk",false,"friend of Gardunk") .. "]? Meez friend of Gardunk.");
	elseif(pfaction > 4) then
		e.self:Say("Meez don't trust you.");
	elseif(e.message:findi("friend of Gardunk")) then
		e.self:Say("Dat good. He tell meez you was comin'. Meez learn you to fight like alligator. Dominate through fear. Dat is what we do. Strike fear into heart of enemies. You [" .. eq.say_link("ready to start",false,"ready to start") .. "]?");
	elseif(e.message:findi("ready to start")) then
		e.self:Say("Good. We start easy. Little froggies a good place. They our enemies. You go to da swamp and kill da tadpoles. Bring back to me four pieces of Froglok Tadpole Flesh. Strip da flesh from our enemies. Dat your first task.");
	elseif (e.message:findi("learn about da animals")) then
		e.self:Say("We start with da rat. You go and kill rats. Tear da rat apart and bring me a Giant Rat Ear and a Giant Rat Pelt.");
	elseif (e.message:findi("fight like da alligator")) then
		e.self:Say("Best way to do dat is to fight alligators. You go out and fight da alligators in da swamp. Bring back to meez an alligator tooth and meez believe you.");
	elseif (e.message:findi("next part of your training")) then
		e.self:Say("For da next part of your training you go and strike fear into da hearts of da froggies again. Only not the little ones. You go and you drain da blood from one of da full grown ones. You bring meez back da Froglok Blood. Meez be waiting for you here if you make it back alive.");
	elseif (e.message:findi("one more task")) then
		e.self:Say("'You is getting stronger. It time for you to venture out some and spread fear to other parts of da world. You go over to da Feerrott. There you find lots of lizard men. You go and spread fear to them. Fight them. You cut off their tails. Bring me four Lizard Tail.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local pfaction = e.other:GetFaction(e.self);

	if (pfaction > 4) then
		e.self:Say("No trust.  You take dis back");
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13187, item2 = 13187, item3 = 13187, item4 = 13187})) then
		e.self:Say("You done good. You begin to know fear by causing fear. Next you learn about da animals. You learn about da animals by fighting dem and tearing them apart. You ready to [" .. eq.say_link("learn about da animals",false,"learn about da animals") .. "]?");
		e.other:SummonItem(7380); -- Item: Dark One's Bracer
		e.other:Ding();
		e.other:Faction(237,1,0); -- Faction: Dark Ones
		e.other:Faction(308,1,0); -- Faction: Shadowknights of Night Keep
		e.other:Faction(251,-1,0); -- Faction: Frogloks of Guk
		e.other:AddEXP(210);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13050, item2 = 13054})) then
		e.self:Say("'So you know all about da rat now. Dat is good. Next step is important. You need to learn to [" .. eq.say_link("fight like da alligator",false,"fight like da alligator") .. "].");
		e.other:SummonItem(7381); -- Item: Dark One's Cap
		e.other:Ding();
		e.other:Faction(237,2,0); -- Faction: Dark Ones
		e.other:Faction(308,1,0); -- Faction: Shadowknights of Night Keep
		e.other:Faction(251,-1,0); -- Faction: Frogloks of Guk
		e.other:AddEXP(210);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13725})) then
		e.self:Say("Ok meez believe you. Here your reward. Meez think you just about ready for [" .. eq.say_link("next part of your training",false,"next part of your training") .. "].");
		e.other:SummonItem(7382); -- Item: Dark One's Leggings
		e.other:Ding();
		e.other:Faction(237,6,0); -- Faction: Dark Ones
		e.other:Faction(308,1,0); -- Faction: Shadowknights of Night Keep
		e.other:Faction(251,-1,0); -- Faction: Frogloks of Guk
		e.other:AddEXP(210);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 22524})) then
		e.self:Say("You did it! You cause lots of fear for them. Dat good. Even da spirits are starting to tremble. Soon you will be able to make dem do what you want. But there is [" .. eq.say_link("one more task",false,"one more task") .. "] meez want you to do.");
		e.other:SummonItem(7383); -- Item: Dark One's Claw
		e.other:Ding();
		e.other:Faction(237,28,0); -- Faction: Dark Ones
		e.other:Faction(308,7,0); -- Faction: Shadowknights of Night Keep
		e.other:Faction(251,-4,0); -- Faction: Frogloks of Guk
		e.other:AddEXP(210);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13354, item2 = 13354, item3 = 13354, item4 = 13354})) then
		e.self:Say("Meez impressed. Da spirits, they tremble in terror before you. Meez can't teach you no more. Go and dominate through fear. Fight like da alligator and tear your enemies apart.");
		e.other:SummonItem(7384); -- Item: Dark One's Leather
		e.other:Ding();
		e.other:Faction(237,10,0); -- Faction: Dark Ones
		e.other:Faction(308,2,0); -- Faction: Shadowknights of Night Keep
		e.other:Faction(251,-1,0); -- Faction: Frogloks of Guk
		e.other:AddEXP(210);
	end

	item_lib.return_items(e.self, e.other, e.trade)
end
