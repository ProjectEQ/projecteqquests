--draniksscar
local recepactive=false;

function event_enter_zone(e)
	if(e.self:Class() == "Warrior" ) then
		local qglobals = eq.get_qglobals(e.self);
		if (qglobals["warrior_epic"] ~= nil and qglobals["warrior_epic"] >= "2") then
			eq.set_timer("borer",5000);
			recepactive=false;
		end
	end
end

function event_timer(e)
	if(e.timer == "borer") then
		if(e.self:GetItemIDAt(Slot.Cursor)==60300 and not recepactive) then --energy receptor on cursor
			e.self:Message(MT.LightBlue,"The energy receptor appears to be active");
			eq.depop_all(302050);
			eq.spawn2(302050, 0, 0, 155,-1053,29.5, 152); -- NPC: Blackfall_Borer
			eq.create_ground_object(60301,155,-1053,29.5,0);	
			recepactive=true;
		end
	end
end

function event_loot(e)
	if(e.self:Class() == "Beastlord" and e.item:GetID() == 52907) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["beast_epic"] == "15" and qglobals["beast_epic_ds"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("beast_epic_ds","1",5,"F");
		end
	end	
end

local door_ids = {
  [2] = "dranikhollowsa", -- watering hole
  [3] = "dranikhollowsb", -- firepit
  [4] = "dranikhollowsc"  -- murkglider
}

function event_click_door(e)
  local door_id = e.door:GetDoorID();

  local zone_name = door_ids[door_id]
  if zone_name then
    local dz = e.self:GetExpedition()
    if dz.valid and dz:GetZoneName() == zone_name then
      e.self:MovePCDynamicZone(dz:GetZoneID())
    end
  end
end
