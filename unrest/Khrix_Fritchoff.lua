-- items: 10400
function event_say(e) -- no matter what you say, he'll always respond to this text.
	e.self:Say('Close the door and be gone fool! You are going to give away my hiding spot!');
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 10400})) then
		e.self:Say('At last I may leave this place!! Good luck destroying my abomination, you will surely need it against my most powerful yet uncontrolable creation!');
		e.other:Ding();
		e.other:Faction(238,1); -- Faction: Dark Reflection
		e.other:Faction(245,-1); -- Faction: Eldritch Collective
		e.other:Faction(255,-1); -- Faction: Gem Choppers
		e.other:Faction(240,-1); -- Faction: Deepmuses
		eq.unique_spawn(63111,0,0,60,622,20,0); -- spawns Khrixs Abomination
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Khrix_Fritchoff  zone - unrest.
