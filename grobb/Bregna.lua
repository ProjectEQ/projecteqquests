-- Aid Garuuk
-- Converted to .lua by Speedz
-- added saylink by robregen
-- removed Bregna's Big Mistake (See Urako) - added More Help for Innoruuk (noudess)
-- items: 13916, 15272, 26632, 26640, 29921, 26662, 28740

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. " , are ya a follower ob Innoruuk?  I hopes so.  We needs many ta spread His Hate.  None be as bicious as be dem dat follow Him.  We do brings fear and hate ta all dat does sees us.  Dis is well.  He likes it.  Can ya [help]?");
	elseif (e.message:findi("help")) then
		e.self:Say("'Me hears orcs nearby are trubble.  Da werd frum Neriak is dey wants us ta kills dem before dey organize.  Dark elf say ta looks for Deathfist Clan.  Say dey called cen-tu-ri-ons.  Dey try ta gets big orc army.  Shows me ya can strike fear and hate inta dem orcs... dey needs be more scared a us den dem humies.  Brings me a Deathfist slashed belt.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 13916})) then -- More help for Innoruuk
		e.self:Say("Good job. Dat help lerns um. Takes dis ta help ya lerns how ta do more hateful tings. Ya gots a good starts fer Him ta be prouds a ya.");
		e.other:SummonItem(15272); -- Item: Spell: Spirit Pouch
		e.other:Faction(251,-1,0); -- -Frogloks of Guk
		e.other:Faction(237,5,0);  -- +Dark Ones
		e.other:Faction(308,1,0);  -- +Shadowknights of Night Keep
		e.other:Ding();
		e.other:AddEXP(100);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 26632, item2 = 26640, item3 = 29921, item4 = 26662})) then -- Aid Garuuk
		e.self:Say("Dis am gud. I see you've been talkin' to Garuuk. Methanks you fer da help. Take dis note back ta Garuuk so he knows you helped me. Tanks again!");
		e.other:SummonItem(28740); -- Item: Troll Receipt
		e.other:Ding();
		e.other:AddEXP(10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
