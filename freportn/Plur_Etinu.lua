-- items: 13074, 14029
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Your soul is welcome in our temple. The Queen of Love, Erollisi Marr, desires more to join our ranks. This city of Freeport must not stay under the control of  the Freeport Militia. I am here to [cure poison] and [cure disease], or if any [need healing].");
	elseif(e.message:findi("cure poison")) then
		e.self:Say("Before the Queen of Passion can force the toxin from your system, I shall require 3 bixie stingers to perform the act.");
	elseif(e.message:findi("cure disease")) then
		e.self:Say("The affliction which has been cast upon you shall be purged from your body, but first I need two portions of zombie flesh to perform the act.");
	elseif(e.message:findi("healing")) then
		e.self:Say("If it is the power of the passion you require to bind your wounds, then lay down your tribute of 10 gold.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13074, item2 = 13074})) then -- 2x zombie skin
		e.self:Say("May the Power of Passion purge you of disease!"); -- text made up
		e.other:Ding();
		e.self:CastSpell(213,e.other:GetID()); -- Spell: Cure Disease
	elseif(item_lib.check_turn_in(e.trade, {item1 = 14029, item2 = 14029, item3 = 14029})) then -- 3x bixie stingers.
		e.self:Say("May the Power of Passion forced you free of poison!"); -- text made up
		e.other:Ding();
		e.self:CastSpell(203,e.other:GetID()); -- Spell: Cure Poison
	elseif(item_lib.check_turn_in(e.trade, {gold = 10})) then
		e.self:Say("May the unbridled passion of Erollisi Marr flow through your body.");
		e.other:Ding();
		e.self:CastSpell(17,e.other:GetID()); -- Spell: Light Healing
	end
	item_lib.return_items(e.self, e.other, e.trade)
end