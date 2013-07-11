function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah..  good day. friend.  My name's Leanon Ruksey. loyal member of the League of Antonican Bards..  Qeynos Chapter. of course.  It's part of my job to keep up with the goings-on of the city. who's coming and going and all that.  So we usually keep a man here and one at the docks.  Anyway. nice chatting with you..  be careful out there!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18020})) then
		e.self:Say(string.format("Ah, hello there, %s. It's such a fine day out, wouldn't you say? Ah, reports are due in. Very well, here you go. Say hello to the fellows back at the Wind Spirit's Song for me. May you have many safe travels, my friend.",e.other:GetName()));
		e.other:SummonItem(18024);
		e.other:Ding();
		e.other:Faction(192,2,0);
		e.other:Faction(184,2,0);
		e.other:Faction(135,2,0);
		e.other:Faction(273,-2,0);
		e.other:Faction(207,-2,0);
		e.other:AddEXP(200);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
