function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Not so loud! My head is spinning so! What I wouldn't give for a Tumpy's Tonic right now! They were always just the thing for the hair of the gnoll that bit me.");
	elseif(e.message:findi("tonic")) then
		e.self:Say("Ahh! If you need to ask, you've never had one. Tumpy Irontoe in Kaladim made me drink one of his special brews when I lost a game of King's Court with him. I would give anything I own for one of those right now!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12114})) then
		e.self:Say("<SLURP!!>  Ahh thhhhat'thh betterr. Take thithhh. <BURP!>");
		e.other:SummonItem(19006);
		e.other:Ding();
		e.other:AddEXP(1000);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
