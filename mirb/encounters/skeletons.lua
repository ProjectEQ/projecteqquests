-- there was no time limit for this on live, waited over 5 minutes with an icy spawned
local icy_count = 0

function skeleton_death(e)
  if e.self:GetNPCTypeID() == 237756 then -- a_chromatic_bonewalker (gray)
    eq.spawn2(237791, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()) -- a_chromatic_bonewalker (brown)
  elseif e.self:GetNPCTypeID() == 237791 then -- a_chromatic_bonewalker (brown)
    eq.spawn2(237757, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()) -- a_chromatic_bonewalker (red)
  elseif e.self:GetNPCTypeID() == 237757 then -- a_chromatic_bonewalker (red)
    eq.spawn2(237789, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()) -- an_icy_bonewalker
    icy_count = icy_count + 1
    eq.debug("icy skeleton count: " .. icy_count)

    if icy_count == 4 then
      eq.depop_all(237789) -- an_icy_bonewalker
      eq.signal(237743, 2) -- Durgin_Skell (skeleton event complete)
    end
  elseif e.self:GetNPCTypeID() == 237789 then -- an_icy_bonewalker
    eq.spawn2(237756, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()) -- a_chromatic_bonewalker (gray)
    icy_count = math.max(0, icy_count - 1)
  end
end

function event_encounter_load(e)
  eq.register_npc_event("skeletons", Event.death_complete, 237756, skeleton_death) -- a_chromatic_bonewalker (gray, texture 1)
  eq.register_npc_event("skeletons", Event.death_complete, 237791, skeleton_death) -- a_chromatic_bonewalker (brown, texture 2)
  eq.register_npc_event("skeletons", Event.death_complete, 237757, skeleton_death) -- a_chromatic_bonewalker (red, texture 3)
  eq.register_npc_event("skeletons", Event.death_complete, 237789, skeleton_death) -- an_icy_bonewalker
end
