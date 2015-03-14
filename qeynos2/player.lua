function event_enter_zone(e)
	local level = e.self:GetLevel();
	local zoneid = eq.get_zone_id();
	local qglobals = eq.get_qglobals(e.self);

  	if(level >= 15 and qglobals.Wayfarer == nil and e.self:GetStartZone() == zoneid) then
    		e.self:Message(15, "A mysterious voice whispers to you, 'Drun Vorwig has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
  	end
end
