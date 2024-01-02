function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("ail, dere! Ain'tcha a sight fer me sore eyes! I knows dat we're strangers an' all, but might I ask a [boon] of ye?");
	elseif e.message:findi("boon") then
		e.self:Say("Well, me pickaxe is blunted awfully bad and me ale supplies are dangerously low. If'n ye would be kind enough t' get me a new pick and a couple o' bottles o' dwarven ale, I would be f'rever in yer debt.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 5018,item2 = 13036,item3 = 13036}) then -- Items: Pick and 2x Dwarven Ale
		e.self:Emote("drinks one of the ales, burps loudly, then says 'By Brell's Beard! Yer a lifesaver, ya are! 'ere, take dis bone I've found 'ere in dis maze. Looks human ta me and I'm thinkin that a proper burial is in order. Freeport's the closest place dat has one o Marr's temples. I'm thinkin dis was one o' his Holy Knights by da look o' da tattered tunic I found it wrapped in. I'm thinkin Valeron might be havin an interest in it if you show that to him.'");
		e.other:QuestReward(e.self,0,0,0,0,6701,500); -- Item: A Dusty Old Leg Bone
	end
	item_lib.return_items(e.self, e.other, e.trade)
end