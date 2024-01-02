-- Reinforced Satchel of Al'Kabor

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 55270 }) then -- Item: Shelie's Note
		e.self:Say("This note is covered in filth! Oh, it is from Shelie, that explains it.");
        e.self:Emote("holds the note in front of her by the top corner and begins to read it. 'I can barely make out this scrawl that that ogre calls writing, but I believe it says you need some Bloodguard Mummy Wrappings from the Mistmoore Catacombs. It's your lucky day, and obviously not mine, I do have some mummy wrappings. Take them. Just don't take them out of the protective case until they can be cleaned, lest you get a flesh rotting disease that will make the next month of your life a living nightmare as you slowly die a horrible, agonizing death.'");
        e.self:Say("Don't say I didn't warn you. Why must I be surrounded by all this filth? I am much too good for this. That is the price I pay for living the life of an adventurer, I suppose.");
        e.self:Emote("makes some notes of her own. 'Take this note to Dahdd Jonne. He is at the camp in South Ro unless he is off in Rivervale stuffing his fat face.' Jilsua continues to mumble to herself as you walk away.'");
		e.other:QuestReward(e.self,{itemid = 55272});  -- Item: Jilsua's Note
		e.other:SummonItem(55267); -- Item: Bloodguard Mummy Wrappings
	end
	item_lib.return_items(e.self, e.other, e.trade)
end