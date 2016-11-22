function event_loot(e)
	if(e.self:Class() == "Rogue" and e.item:GetID() == 52346 ) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["Fatestealer_culth"] == "1" and qglobals["rogue_solc_chest"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("rogue_solc_chest","1",5,"F");
		end
	elseif(e.self:Class() == "Wizard" and e.item:GetID() == 11619) then --Loot Wisp of Pure Flame
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["wiz_solc_chest"] == nil) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("wiz_solc_chest","1",5,"F");
		end
	end
end

function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	local el = eq.get_entity_list();	
	if(qglobals.wiz_epic == "2") then
		eq.signal(278125,100)
	end	
end