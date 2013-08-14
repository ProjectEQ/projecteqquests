function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Correct. Toxdil is my name. No last name. I swear allegiance to no house nor guild. What brings you down here? Perhaps you seek my [deadly liquid], perhaps not. Whatever your reasons, I warn you to keep an eye out for the militia. They have begun to patrol the sewers.");
	elseif(e.other:Class() == "Rogue") then
		if(e.message:findi("deadly liquid")) then
			e.self:Say("The deadly liquid I offer to rogues is called spider venom. I will be glad to make it for you, but first you must supply me with two snake venom sacs and my fee of 20 gold pieces. You may find the sacs upon the giant snakes of the Commonlands.");
		elseif(e.message:findi("gem of righteousness")) then
			e.self:Say("That gem is worthless!! If you want it, you can have it. Oh, but I forgot! I sold it to some gem merchant. I can't seem to remember her name, but she paid highly for it. Ha!! Imagine that. Worthless hunk of crystal. Do not bother looking for it.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12353})) then
		e.self:Say("The gem!! I would notice it's sparkle anywhere!! I cannot believe you are handing it back to me!! What a fool. Here you are fool. You can have this worthless key now.");
		e.other:SummonItem(12351); -- A Tiny Key
		e.other:Ding();
		e.other:AddEXP(15000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 14017,item2 = 14017,gold = 20})) then
		e.other:SummonItem(14016); -- Snake Venom
		e.other:Ding();
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Toxdil

