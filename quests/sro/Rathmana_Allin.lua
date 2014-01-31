-- NPC: Rathmana Allin.  Location: South Ro

--  Qazzaz - 04/01/10 - Added minimal support for The Bayle List quest.  Couldn't find any text.
-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Company?! Way out here in the desert of Ro? This is a pleasant surprise! Won't you stay for a while? I am sure the desert has dried your throat. I have supplies if necessary. At a price, of course. Are you [traveling] or are you here on [business]?");
	elseif(e.message:findi("business")) then
		e.self:Say("Of course. You do not look like a traveling merchant or a lost adventurer. Someone has sent you to Rathmana. Well then, let's not waste time. Give me the item, or items, and my fee of twenty gold coins. It must be gold. I have no use for any other metals.");
	elseif(e.message:findi("traveling")) then
		e.self:Say("Oh, wonderful! Then you must need water and rations for your long journey. Be sure to approach any camp you may find in Ro with caution. There are many bandits in the desert. If it were not for Ortallius, they would have gutted me and thieved all my merchandise by now. If you have any use of magic then I believe I may have an [offer] for you.");
	elseif(e.message:findi("offer")) then
		e.self:Say("My offer to you is this, you give me thirty gold and I allow you to reach into my scroll bag and retrieve one scroll and only one. It may be the spell of a wizard or maybe not. The school of magic will not be known beforehand. The only knowledge you will have is that Rathmana will not exchange the spell for another. You get what you take. Do you wish to reach into my bag? Then give Rathmana his thirty gold coins.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- Rathmana's Scroll Offer
	if(item_lib.check_turn_in(e.trade, {gold = 30})) then
		e.self:Say("Good luck, my friend. May Solusek Ro guide your hand.");
		e.other:Ding();
		e.other:Faction(320,1,0);  -- Temple of Solusek Ro
		e.other:Faction(291,-1,0); -- Shadowed Men
		e.other:AddEXP(100);
		-- Force Snap, Bind Affinity, Lightning Bolt, Quickness, Whirl Til You Hurl, Column of Fire, Engulfing Darkness, Banshee Aura, Lifedraw, Charm, Rotted Illegible Scroll (Multiple copies added to increase percentage)
		e.other:SummonItem(eq.ChooseRandom(15022, 15035, 15038, 15039, 15303, 15328, 15355, 15364, 15445, 16425, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360));
	-- The Bayle List quest
	elseif (item_lib.check_turn_in(e.trade, {item1 = 18808, item2 = 18809, item3 = 18810, gold = 20})) then -- Bayle List I, Bayle List II, Bayle List III
		e.other:Ding();
		e.self:Say("hmm.  I'm not sure how you knew I could translate these, but I can always use the gold.");
		e.self:Say("Here is your translation.");
		e.other:SummonItem(18961); -- Translated Parchment
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
