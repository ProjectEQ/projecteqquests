-- items: 69960
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to our home of the finest jewelers in all of Norrath.");
	elseif(e.message:findi("Tayla")) then
		e.self:Say("I know nothing.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["paladin_epic"] == "9" and item_lib.check_turn_in(e.trade, {platinum = 500})) then
		e.self:Say("Camlend gave me an old set of prayer beads ages ago. He said that they would be needed at some point. Over the years I crafted sockets in them thinking that one day I would add a few gems to them. Take the beads. I'm glad to hear they could be of some use to help someone. Thank you for your donation. It should be enough to cover the cost of creating the sockets.");
		e.other:SummonItem(69960); --qeynos prayer bead
	end
	item_lib.return_items(e.self, e.other, e.trade)
end 