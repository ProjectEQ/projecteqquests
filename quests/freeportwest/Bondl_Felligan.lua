function event_say(e)
	if(e.message:findi("hail")) then -- Part of Shaman Epic 1.0
		e.self:Emote("burps loudly in your face and says, 'Bah! Leave me be, fool! You have nothin' I want and I certainly have nothin' you want.");
	elseif(e.message:findi("you can buy booze")) then -- Part of Shaman Epic 1.0
		e.self:Emote("suddenly becomes completely sober and says, 'Very well, shaman, please come with me.'");
		eq.start(13);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 1665})) then -- Part of Shaman Epic 1.0
		e.self:Say("WOW, thanks! This must be worth a fortune! I could drink for a month after sellin' this to one of them fool merchants. I'm going to see how much I can get for it right now!");
		e.other:Faction(342,100,0);
		e.other:AddEXP(1000);
		eq.spawn2(8117,0,0,62,66,32.1,254);
		eq.spawn2(8118,0,0,67,103,32.1,508);
		e.self:Say("What!? You don't approve of me buyin' some drinks with this gem? Who the heck are you to offer me a gift and order me what to do with it? Is this some kinda conditional kindness? Well? Are you gonna let me buy some booze with this or not?");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF Bondl_Felligan