-- items: 62884, 62868, 62885
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("plan to find") and qglobals["druid_epic"] == "10") then
		e.self:Say("Then you'll need this. I use it to store magical potions, but it might work for holding frozen pieces of a greater rain spirit.' He shrugs. 'I hope so, anyway. I don't exactly see a lot of frozen rain spirits.' He smiles. 'I wish you luck, friend. Rescuing such a being would be a boon for all of Norrath.");
		e.other:SummonItem(62884); -- Item: Thick Leather Bag
	else
		e.self:Say("Well hello there. I hope all is well with you, friend.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 62868})) then		
		e.self:Say("Well, this is an amazing find! I didn't think any of his runes survived the invasion.' The historian cleans the rune with a special solution, then hands it back to you. 'Let me tell you what I know of Yuisaha. He was a great rain spirit, perhaps the greatest patron of the Taelosians. He was manifested when the Muramites invaded Talosia so long ago. He was captured by the army and brought back to the Plane of Discord. What happened to Yuisaha then is hard to say, but there is a separate story of a powerful rain spirit that was frozen during a battle and shattered. The story claims that the frozen shards of the spirit were divided among the leaders of the winning army. Where they have gone since then, or if they still exist, nobody can tell. Do you really [" .. eq.say_link("plan to find") .. "] him?");
		eq.set_global("druid_epic","10",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 62885})) then		
		e.self:Emote("opens the bag and examines the shards with care and awe. He then seals them back into the bag and returns it to you. 'Well, isn't that a sight to behold. I'm grateful to you for letting me see them. It appears that the stories were correct. My guess would be that those shards were given to various Muramite leaders as rewards for some particularly horrible work they had done. I hope you can find a way to make those pieces whole again. I wish I could help you, but you've already exceeded the bounds of my knowledge. I wish you luck finding someone to help you restore the rain spirit shards.");
		eq.set_global("druid_epic","11",5,"F");
		e.other:SummonItem(62885); -- Item: Synched Leather Bag
	end	
	item_lib.return_items(e.self, e.other, e.trade)
end
