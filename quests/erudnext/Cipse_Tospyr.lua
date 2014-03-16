function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetName() .. ". I welcome you to the Temple of Divine Light. I am the resident healer. If you should ever require the power of Quellious to [bind wounds], [cure disease] or [cure poison], speak with me and I shall help you.");
	elseif(e.message:findi("bind wounds")) then
		e.self:Say("I shall be pleased to help you with your wounds. The Temple of Divine Light requires a tribute of four gold before I may perform the service.");
	elseif(e.message:findi("cure disease")) then
		e.self:Say("Your malady will be nothing more than a memory, but before that can be, we ask that a donation of two gold coins be offered.");
	elseif(e.message:findi("cure poison")) then
		e.self:Say("You must pay the tribute of three gold before I cast the toxin from your body.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {gold = 4})) then
		e.self:CastSpell(12,e.other:GetID());
	elseif(item_lib.check_turn_in(e.trade, {gold = 3})) then
		e.self:CastSpell(203,e.other:GetID());
	elseif(item_lib.check_turn_in(e.trade, {gold = 2})) then
		e.self:CastSpell(213,e.other:GetID());
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
  
-- END of FILE Zone:erudnext