-- items: 18743, 13561, 18961, 12153
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Who are you that you dare to speak with the great Pietro Zarn!! I see nothing more than a whelp in front of me. Innoruuk himself speaks with me. And now you expect me to waste words on you, a common. Begone " .. e.other:GetName() .. " . You have nothing to peak my interest, only my rage.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18743})) then -- A tattered note
		e.self:Say("A new member to carry the rage of Innoruuk into the city and beyond. How wonderful. I must admit that you do not appear to carry the rage within. Hopefully you shall color the battlefields with the blood of many knights from the Hall of Truth. Here. Wear this tunic with pride. Once you are ready to begin your training please make sure that yo see Gunex Eklar, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13561); -- Faded Crimson Tunic
		e.other:Ding();
		e.other:Faction(271,100,0); -- Dismal Rage
		e.other:Faction(281,-15,0); -- Knights of Truth
		e.other:Faction(296,20,0); -- Opal Dark Briar
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18961})) then -- Translated Parchment
		e.self:Say("I will deal with this " .. e.other:GetName() .. ". Take this and know that you are welcomed by the Dismal Rage.");
		e.other:SummonItem(12153); -- Rage War Maul
		e.other:Ding();
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freporte  -- Pietro_Zarn
