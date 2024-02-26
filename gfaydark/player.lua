function event_enter_zone(e)
	eq.set_timer("spires",10 * 1000);

    local level = e.self:GetLevel();
	local zoneid = eq.get_zone_id();
	local qglobals = eq.get_qglobals(e.self);

	if qglobals.Wayfarer ~= nil and level >= 15 and e.self:GetStartZone() == zoneid then
		e.self:Message(MT.Yellow, "A mysterious voice whispers to you, 'Enyaanuia Windancer in the tavern by Trueshots Bows has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	end
end

function event_timer(e)
    local qglobals = eq.get_qglobals(e.self);
	if qglobals.nexus_gfaydark ~= nil and qglobals.spire_gfaydark ~= nil and qglobals.spire_gfaydark == "1" and e.self:HasItem(19720) then
		eq.SelfCast(2433); -- self only to avoid AE
		eq.set_global("spire_gfaydark","0",1,"F");
		eq.del_global("message_gfaydark");
		e.self:NukeItem(19720) -- removes stone from inventory.
	elseif qglobals.nexus_gfaydark ~= nil and qglobals.spire_gfaydark ~= nil and qglobals.spire_gfaydark == "1" and qglobals.message_gfaydark == nil and not e.self:HasItem(19720) then
		e.self:Message(15, "You don't have the correct component to travel to Luclin.");
		eq.set_global("message_gfaydark","1",1,"M20"); -- prevent component mssage from being spammed.
	end
end