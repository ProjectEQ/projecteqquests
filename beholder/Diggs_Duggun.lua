-- 1st part of paladin quest spell - divine might
--
-- small dialogue addition to key the player to hand the leg bone to valeron.
-- more details in valeron's .pl file in freportn.
--
-- items: 5018, 13036, 6701

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("ail, dere! Ain'tcha a sight fer me sore eyes! I knows dat we're strangers an' all, but might I ask a [" .. eq.say_link("boon",false,"boon") .. "] of ye?");
	elseif(e.message:findi("boon")) then
		e.self:Say("Well, me pickaxe is blunted awfully bad and me ale supplies are dangerously low. If'n ye would be kind enough t' get me a new pick and a couple o' bottles o' dwarven ale, I would be f'rever in yer debt.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 5018,item2 = 13036,item3 = 13036})) then
		e.self:Emote("drinks one of the ales, burps loudly, then says 'By Brell's Beard! Yer a lifesaver, ya are! 'ere, take dis bone I've found 'ere in dis maze. Looks human ta me and I'm thinkin that a proper burial is in order. Freeport's the closest place dat has one o Marr's temples. I'm thinkin dis was one o' his Holy Knights by da look o' da tattered tunic I found it wrapped in. I'm thinkin Valeron might be havin an interest in it if you show that to him.'");
		e.other:SummonItem(6701); -- Item: Dusty Old Leg Bone
		e.other:Ding();
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF zone: beholder ID: 16013 NPC: Diggs_Duggun

