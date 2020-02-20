--added functionality for rogue pre-quest in Shar Vahl prison #Drogerin


function event_enter_zone(e)
	local level = e.self:GetLevel();
	local zoneid = eq.get_zone_id();
	local qglobals = eq.get_qglobals(e.self);

  	if(level >= 15 and qglobals.Wayfarer == nil and e.self:GetStartZone() == zoneid) then
    	e.self:Message(15, "A mysterious voice whispers to you, 'Vlarha Myticla has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	end
end


function event_click_door(e)
	local door_id = e.door:GetDoorID();
	
	if (e.self:Class() == "Rogue") then 
		if (door_id == 106) then
			if (e.self:HasItem(52007) == true) then
				eq.spawn2(155346,0,0,-541.79,99.84,-235.62,506.8);
				e.self:Message(13, "You try the Cell Key on the lock and it's a perfect fit.");
			end
		end
	end
end
