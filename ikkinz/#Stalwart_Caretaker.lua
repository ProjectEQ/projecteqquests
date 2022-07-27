-- items: 60234
function event_say(e)
	eq.zone_emote(0,"The stone worker does not move. It almost seems not to have any purpose at all, yet it blocks the door behind it.");
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 60234})) then
		e.self:Emote("motions towards the door behind it. You have passed the first test.");
		eq.zone_emote(0,"Only research can solve the mystery of the runed glyphs");
		eq.ZoneMarquee(10,510,1,1,6000,"Only research can solve the mystery of the runed glyphs");
		eq.zone_emote(15,"Stone grinds against stone and the door slides open");
		eq.get_entity_list():FindDoor(15):SetLockPick(0);
		eq.get_entity_list():FindDoor(16):SetLockPick(0);
		eq.get_entity_list():FindDoor(15):ForceOpen(e.self);
		eq.get_entity_list():FindDoor(16):ForceOpen(e.self);
	end
end