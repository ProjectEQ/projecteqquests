-- Gindlin's Poison

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What do you want?");
	elseif(e.message:findi("poison")) then
		e.self:Emote("grins 'So your here about poison eh? I can make it for ya. Get me a snakes venom sac and the Special Brew made by Crow in Crow's Bar in Qeynos, and of course, a fee of 20 gold.'");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 14017,item2 = 13901, gold = 20})) then
		e.self:Emote("grins slyly 'Why thank you good sir. One moment please.'");
		e.other:SummonItem(14015);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE zone: ID:12011 -- Gindlin_Toxfodder.lua