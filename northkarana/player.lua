function event_enter_zone(e)
	eq.set_timer("spires",10 * 1000);

    if e.self:GetClass() == Class.BARD or e.self:GetClass() == Class.ROGUE then
		if e.self:HasItem(52355) and not e.self:HasItem(52359) then -- Item Has: Shakey's Dilapidated Noggin Item Does Not Have: Radiant Azure Lightstone
			eq.unique_spawn(13123, 109, 0, 0, 0, -8); -- NPC: Flighty_Azure_Wisp
			e.self:Message(MT.Yellow, "Out of the corner of your eye, you catch a glimpse of a brightly colored wisp as it darts by. It's moving at an incredible speed.");
		end
	end
end

function event_timer(e)
    local qglobals = eq.get_qglobals(e.self);

	if qglobals.nexus_nk ~= nil and qglobals.spire_nk ~= nil and qglobals.spire_nk == "1" and e.self:HasItem(19720) then
		eq.SelfCast(2433); -- self only to avoid AE
		eq.set_global("spire_nk","0",1,"F");
		eq.del_global("message_nk");
		e.self:NukeItem(19720) -- removes stone from inventory.
	elseif qglobals.nexus_nk ~= nil and qglobals.spire_nk ~= nil and qglobals.spire_nk == "1" and qglobals.message_nk == nil and not e.self:HasItem(19720) then
		e.self:Message(MT.Yellow, "You don't have the correct component to travel to Luclin.");
		eq.set_global("message_nk","1",1,"M20"); -- prevent component mssage from being spammed.
	end
end

function event_loot(e)
    local qglobals = eq.get_qglobals(e.self);
	if e.self:GetClass() == Class.RANGER and e.item:GetID() == 62604 and e.corpse:GetNPCTypeID() == 13131 then
        if qglobals.ranger_epic15_pre ~= nil and qglobals.ranger_epic15_pre ~= "8" then
            return 1;
        else
            return 0;
        end
    end

    if e.item:GetID() == 14344 and e.corpse:GetNPCTypeID() == 13125 and e.self:HasItem(26896) and e.self:HasItem(11430) and e.self:HasItem(22892) then -- All 4 Heads
        e.self:Message(MT.Yellow, "With his last breath, the paladin says, 'You are too late. The last paladin has fled to Natimbi with the staff and is on his way to destroy it!'");
    end
end

