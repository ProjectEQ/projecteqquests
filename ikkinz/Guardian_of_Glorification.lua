--Ikkinz Raid #2: Chambers of Glorification
-- first guardian who is non-aggro and accepts the item to start event
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("ignores your hail. It is as if it lacks the life-force needed to move. Perhaps you have something with you that might awaken it.");
		e.self:Say("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 60227})) then
		eq.zone_emote(0,"Guardian of Glorification comes alive with the power of Kruxilitek!");
		eq.unique_spawn(294582, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); --##Guardian_of_Glorification
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
