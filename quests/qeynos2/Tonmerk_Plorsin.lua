function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. child.  Welcome to the Temple of Life. Here. you may pay homage to the [Prime Healer]. [Rodcet Nife].  If you are in need of [healing] or require me to [cure disease] or [cure poison]. please inform me.  I am the resident healer of all Qeynos citizens.");
	elseif(e.message:findi("cure disease")) then
		e.self:Say("Yes. we can do that.  First. you must fetch me some bandages and brew me some bog juice.  I.. err.. require the bog juice to.. to dampen the bandages.. Yes that's it!  To dampen the bandages.");
	elseif(e.message:findi("cure poison")) then
		e.self:Say("To cast the poison from your body I require one snake fang.  The fang will contain a hint of poison which will help me focus my casting.");
	elseif(e.message:findi("healing")) then
		e.self:Say("You must pay a tribute of five gold coins before I perform the binding of your wounds.");
	elseif(e.message:findi("prime healer" or "rodcet nife")) then
		e.self:Say("He is the sustaining force of all life.  It is in honor of Him that the Temple of Life was built.  Engineered with the help of the [Academy of Arcane Science].");
	elseif(e.message:findi("academy of arcane science")) then
		e.self:Say("The Academy of Arcane Science is the greatest school of magic in Antonica.  It houses a wealth of resources and knowledge pertaining to any of the circles of magic.  It is also a marvel of magical engineering.  If you should ever visit Freeport. be sure to let me know.  I seek a faithful cleric to [pickup a reagent].");
	elseif(e.message:findi("pickup a reagent")) then
		e.self:Say("Please deliver this potion to Serna Tasknon in The Academy of Arcane Science, she will know what it is that I require.");
		e.other:SummonItem(13983);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12125})) then -- Shark Powder
		e.self:Say("I thank you, my good friend. Surely the road to Freeport was not easily trod. Please take this as compensation for your costs and I also grant you the ability to call forth the power of Rodcet Nife to smite the enemy. Go forth to defend life.");
		e.other:SummonItem(15016); -- spell: smite
		e.other:Ding();
		e.other:Faction(257,10,0); -- Priests of Life
		e.other:Faction(183,10,0); -- Knights of Thunder
		e.other:Faction(135,10,0); -- Guards of Qeynos
		e.other:Faction(21,-20,0); -- Bloodsabers
		e.other:Faction(9,10,0); -- Antonius Bayle
		e.other:AddEXP(0);
		e.other:GiveCash(0,0,25,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 16581,item2 = 13009})) then -- Bog Juice, Bandages
		e.self:Say("The glory of Rodcet Nife flows through your soul. May your body and soul live in righteous health.");
		e.self:CastSpell(96,e.other:GetID());
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13067})) then -- Snake fang
		e.self:Say("The glory of Rodcet Nife flows through your soul. May your body and soul live in righteous health.");
		e.self:CastSpell(95,e.other:GetID());
	elseif(item_lib.check_turn_in(e.trade, {gold = 5})) then
		e.self:Say("The glory of Rodcet Nife flows through your soul. May your body and soul live in righteous health.");
		e.self:CastSpell(17,e.other:GetID());
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
