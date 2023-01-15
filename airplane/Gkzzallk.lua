-- Necromancer Epic NPC -- Gkzzallk
-- items: 18087, 20652

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, would you care for some tea?");
	elseif(e.message:findi("tea")) then
		e.self:Say("The fairies should be bringing me some tea soon.");
	end
end
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18087})) then
		e.self:Emote("screams as he touches the book. His body shimmers as he shrinks smaller and smaller until it's no larger than an insect. The book shimmers, shifting into the shape of a small, black box. Gkzzallk holds on to the opening of the box as he is sucked backward into it. The tiny screams are finally silenced as the box top closes.");
		e.other:SummonItem(20652); -- Item: Gkzzallk in a Box
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Quest by: Solid11
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
