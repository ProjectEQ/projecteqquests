-- Druzzil Ro guide (223300) - Phase 1 area teleporter + Phase 4 skip token

local TOKEN_ID = 90100;

local AREAS = {
	earth  = {-35, 1636, 496, 124},
	air    = {-36, 1352, 496, 124},
	undead = {-27, 1103, 496, 124},
	water  = {-51,  857, 496, 124},
	fire   = {-55,  569, 496, 124},
};

function event_spawn(e)
	e.self:SetTargetable(true);
end

function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("The plane is fractured into five trials. I can send you to the [" ..
			eq.say_link("earth") .. "], [" .. eq.say_link("air") .. "], [" .. eq.say_link("undead") .. "], [" ..
			eq.say_link("fire") .. "], or [" .. eq.say_link("water") .. "] area so your raid can spread out.");
		e.self:Say("If you carry [" .. eq.say_link("Sands of the Fractured Hourglass", false, "Sands of the Fractured Hourglass") ..
			"] from a prior victory over the final guardians of Phase Three, hand it to me and I will pull your expedition forward to the age of the gods.");
		return;
	end
	for name, loc in pairs(AREAS) do
		if (e.message:findi(name)) then
			e.other:MovePCInstance(223, eq.get_zone_instance_id(), loc[1], loc[2], loc[3], loc[4]);
			return;
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = TOKEN_ID})) then
		local dz = eq.get_expedition();
		if (dz.valid) then
			eq.signal(223097, 9)
			dz:AddLockout('Phase 1 Complete', 43200);
			dz:AddLockout('Phase 2 Complete', 475200);
			dz:AddLockout('Phase 3 Complete', 475200);
			local instance_id = eq.get_zone_instance_id();
			for c in eq.get_entity_list():GetClientList().entries do
				if (c.valid) then
					c:Message(MT.Yellow, "Time bends around you as Druzzil Ro pulls you forward.");
					c:MovePCInstance(223, instance_id, -395, 0, 350, 127);
				end
			end
			for i = 1, 14 do
				eq.spawn_condition("potimeb", instance_id, i, 0);
			end
			eq.depop_zone(false);
			eq.get_entity_list():GetSpawnByID(157394):Repop(2); -- zone_status
			eq.get_entity_list():GetSpawnByID(157395):Repop(2); -- zone_emoter
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
