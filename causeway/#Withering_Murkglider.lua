function event_spawn(e)
  eq.set_next_hp_event(99);
end

function event_combat(e)
  if not e.joined then
    e.self:SetHP(e.self:GetMaxHP());
    eq.set_next_hp_event(99);
  end
end

function event_hp(e)
  eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, MT.White, 100,"Small parasites pour from the failing mistglider.");
  local xloc = e.self:GetX();
  local yloc = e.self:GetY();
  local zloc = e.self:GetZ();
  local heading = e.self:GetHeading();
    if (e.hp_event == 99) then
    -- spawn a_parasitic_murkglider
      eq.spawn2(303121,0,0,xloc,yloc,zloc,heading); -- NPC: A_parasitic_murkglider
      eq.spawn2(303121,0,0,xloc,yloc,zloc,heading); -- NPC: A_parasitic_murkglider
      eq.spawn2(303121,0,0,xloc,yloc,zloc,heading); -- NPC: A_parasitic_murkglider
      eq.set_next_hp_event(79);
    elseif (e.hp_event == 79) then
    -- spawn a_parasitic_murkglider
      eq.spawn2(303121,0,0,xloc,yloc,zloc,heading); -- NPC: A_parasitic_murkglider
      eq.spawn2(303121,0,0,xloc,yloc,zloc,heading); -- NPC: A_parasitic_murkglider
      eq.spawn2(303121,0,0,xloc,yloc,zloc,heading); -- NPC: A_parasitic_murkglider
      eq.set_next_hp_event(59);
    elseif (e.hp_event == 59) then
    -- spawn a_parasitic_murkglider
      eq.spawn2(303121,0,0,xloc,yloc,zloc,heading); -- NPC: A_parasitic_murkglider
      eq.spawn2(303121,0,0,xloc,yloc,zloc,heading); -- NPC: A_parasitic_murkglider
      eq.spawn2(303121,0,0,xloc,yloc,zloc,heading); -- NPC: A_parasitic_murkglider
      eq.set_next_hp_event(39);
    elseif (e.hp_event == 39) then
    -- spawn a_parasitic_murkglider
      eq.spawn2(303121,0,0,xloc,yloc,zloc,heading); -- NPC: A_parasitic_murkglider
      eq.spawn2(303121,0,0,xloc,yloc,zloc,heading); -- NPC: A_parasitic_murkglider
      eq.spawn2(303121,0,0,xloc,yloc,zloc,heading); -- NPC: A_parasitic_murkglider
      eq.set_next_hp_event(19);
    elseif (e.hp_event == 19) then
    -- spawn a_parasitic_murkglider
      eq.spawn2(303121,0,0,xloc,yloc,zloc,heading); -- NPC: A_parasitic_murkglider
      eq.spawn2(303121,0,0,xloc,yloc,zloc,heading); -- NPC: A_parasitic_murkglider
      eq.spawn2(303121,0,0,xloc,yloc,zloc,heading); -- NPC: A_parasitic_murkglider
    end
end
