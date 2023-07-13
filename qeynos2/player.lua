function event_enter_zone(e)
	local level = e.self:GetLevel();
	local zoneid = eq.get_zone_id();
	local qglobals = eq.get_qglobals(e.self);
	local client = eq.get_entity_list():GetClientByID(e.self:GetID());

  	if(level >= 15 and qglobals.Wayfarer == nil and e.self:GetStartZone() == zoneid) then
    		e.self:Message(15, "A mysterious voice whispers to you, 'Drun Vorwig has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
  	end

	if(e.self:HasItem(9816)) then -- Player has Sealed Silver Package and required global
		eq.signal(2134, 1); -- signal a_gruff_voice event controller to begin doing things
		if (client.valid) then
			client:MovePC(2,-1096,1262,3,0); --move to corner of zone every time the rogue zones in with the package
		end
		
	end
end

function event_death(e)
	if(e.self:HasItem(9816)) then

		e.self:NukeItem(9816); --nuke sealed silver package if you die

	end

end
