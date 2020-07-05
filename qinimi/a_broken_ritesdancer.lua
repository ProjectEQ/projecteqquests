-- items: 62867, 62890, 62864, 62891
function event_say(e)
	if(e.message:findi("What about the rune fragments?")) then
		if(e.other:GetFaction(e.self) <=2) then
			e.other:Message(1,"The worn Taelosian looks up at you defiantly. She studies you a moment and nods. Whatever judgment she was making about you, you seem to have passed. She reaches into her ragged clothing and pulls out a small hunk of rock and hands it to you. She then quickly returns to work.");
			e.other:SummonItem(62867); -- Item: Rune Fragment
		else
			e.other:Message(1,"The worn Taelosian looks up at you discretely, as if looking at you directly would cause physical pain. She shyly hands you a small, worn bag and what appears to be an animal fang. She then holds up six fingers and points at the fang, then points at herself. She then turns quickly away and proceeds to act as if you are not there.");
			e.other:SummonItem(62890); -- Item: Threadbare Cloth Bag
			e.other:SummonItem(62864); -- Item: Undamaged Noc Fang
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 62891})) then		
		e.other:Message(1,"The worn Taelosian looks up at you defiantly. She studies you a moment and nods. Whatever judgment she was making about you, you seem to have passed. She reaches into her ragged clothing and pulls out a small hunk of rock and hands it to you. She then quickly returns to work.");
		e.other:SummonItem(62867); -- Item: Rune Fragment
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
