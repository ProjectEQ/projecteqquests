function event_spawn(e)
	eq.set_timer("goog",150000);
end

function event_timer(e)
	e.self:Say(eq.ChooseRandom("unngh!!.. Biggle and boo.. Goggle froo..","ahhhh!!.. Tiggle bumble coo.. Bog n' Goo.."));
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Aaaarghhh!!.. Buggl n gump.. Figgle and fump..");
	elseif(e.message:findi("ariska zimel")) then
		e.self:Emote("stares deeply into your eyes.. Very eerie!!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12196,item2 = 16581,item3 = 13498})) then -- Bunker Cell, Bog Juice, Edible Goo
		e.self:Say("Bog n Goo.. Blanket too!!");
		e.self:Say("Bog n Goo.. Blanket too!!");
		e.self:Say("Hide, hide, safe, cee.. lerk has the clue.. Must travel.. Travel.. Travel.. Tunaria's corridor..");
		e.other:SummonItem(12143); -- H. K. 102
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:freportw -- a_prisoner