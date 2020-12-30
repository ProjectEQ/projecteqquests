function event_click_door(e)
  local door_id = e.door:GetDoorID()
  if door_id == 3 then -- Gate to Kyv Heartstriker area
    -- only someone with the Harshly Spiked Key in current inventory can open
    -- this gate, even if it's already been opened by someone else
    if e.self:GetInventory():HasItem(54083, 1, 2) ~= -1 then -- Harshly Spiked Key
      e.self:Message(13, "There is a grinding of stone as the way opens before you.")
    else
      e.self:Message(13, "Despite your efforts, the barricade is solid.")
    end
  elseif door_id == 4 then -- Riddler door
    if e.door:GetLockPick() == 0 then
      e.self:Message(13, "There is a grinding of stone as the way opens before you.")
    else
      e.self:Message(13, "Despite your efforts, the barricade is solid.")
    end
  elseif door_id == 5 then -- obelisk zone out behind Master Stonespiritist Okkanu
    -- if a player hasn't hailed Master Spiritist to get either temp or
    -- permanent Tipt flag then the port out stone doesn't work for them
    local qglobals = eq.get_qglobals(e.self) -- god_kodtaz_access currently represents permanent flag
    local has_perm_flag = (qglobals.god_kodtaz_access and qglobals.god_kodtaz_access == "1")
    local has_temp_flag = (eq.get_data(string.format("%s-god_tipt", e.self:CharacterID())) == "T")

    if not has_temp_flag and not has_perm_flag then
      e.self:Message(15, "Master Stonespiritist Okkanu glares at you as you touch the strangely runed obelisk.")
      return 1 -- prevent zone out
    end
  end
end

function event_combine_success(e)
  if e.recipe_id == 10344 then -- Clockwork Scout Module
    e.self:Message(1, "With the final piece in place, the clockwork scout's eyes light up as it comes to life.");
    eq.spawn2(290059, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()) -- Clockwork Scout Model XIII
  end
end
