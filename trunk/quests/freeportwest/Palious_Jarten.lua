function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("It is good to see you. %s!! Do not forget that the clerics of Mithaniel Marr are here to help those who pay tribute to Him. Should you require me to [cure disease]. just mention it.",e.other:GetName()));
	elseif(e.message:findi("cure disease")) then
		e.self:Say("If you require me to cure disease. it will cost you 10 gold coins.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {gold = 10})) then
		e.self:Say("May the valor of Mithaniel Marr burn brightly in our soul!");
		e.self:CastSpell(213,e.other:GetID());
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
