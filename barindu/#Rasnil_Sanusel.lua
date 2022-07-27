-- Rarundel's Memory OOW quest?

function event_trade(e)
	local item_lib = require("items");
		if (item_lib.check_turn_in(e.trade, {item1 = 67408})) then --Rarundel's Memroy Stone
			e.self:Say("If only she could have told me this face to face. Why did they have to take her from me, why did this happen to us?' Tears begin to roll down Rasnil's face as he picks up a clump of soil and forms it into a small vial. Placing the vial under his eye he lets a tear drop in it and hands it to you. 'Thank you for bringing this to me, please take this to her so that she will know how much she still means to me.");
			e.other:SummonItem(67409); --Rasnil's Tear
		end
	item_lib.return_items(e.self, e.other, e.trade)
end

--function event_say(e)
--	if(e.message:findi("hail")) then
--		e.self:Emote("ignores your attempts to talk to her.");
--	end
--end
