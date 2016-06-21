

function event_enter_zone(e)
  	if(e.self:HasItem(12080)) then -- Player has Enchated Signet of Disciples on their character and Zones in.
    		e.self:Message(15, "The Signet begins to glow");
	end
end


function event_loot(e)
	if(e.self:Class() == "Warrior") then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["warrior_epic"] == "10" and qglobals["warr_epic_wos"] == nil and e.item:GetID() == 60312 ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("warr_epic_wos","1",5,"F");
		end
	end
end