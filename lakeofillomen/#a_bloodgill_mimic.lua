-- items: 52941
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Can't you feel him? I hear the wind blow across the lake and I think he must still be . . .  ");
	elseif(e.message:findi("who is he")) then
		e.self:Say("He who fell from the sky. I have sought [evidence] of him for my [master].");
	elseif(e.message:findi("master")) then
		e.self:Say("You know my master. Are we not the same?");
	elseif(e.message:findi("Aida")) then
		e.self:Say("Aida was once my partner, but it has been years since I have seen her. It does worry me so. ");
	elseif(e.message:findi("where is she")) then
		e.self:Say("I last saw her heading into an airless place. So confident, she was");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 52941})) then	-- Garudon's Statue
		e.self:Say("I thank you. How terrible it must be to still remain after such time. You must possess some measure of power to return this to me. I believe Aida could benefit from the help of one such as yourself.");
		eq.set_global("EnchPre","1",5,"F");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
