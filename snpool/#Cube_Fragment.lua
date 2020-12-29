local debugging = false

local cubes = {
  [285086] = { dest = {  584.00,  247.88, -173.12, 0 }, }, -- no map
  [285087] = { dest = { -185.00, 1525.88, -85.12,  0 }, }, -- no map
  [285088] = { dest = {  935.88,  278.00, -150.12, 0 }, }, -- first map
  [285089] = { dest = {  264.63,  932.50, -76.00,  0 }, }, -- second map
  [285090] = { dest = { -465.00, 1686.00, -74.12,  0 }, }, -- third map
  [285091] = { dest = { -995.88, 1290.00, -28.12,  0 }, }, -- fourth map
}

local function make_attackable(mob, attackable)
  mob:SetSpecialAbility(SpecialAbility.immune_melee, attackable and 0 or 1)
  mob:SetSpecialAbility(SpecialAbility.immune_magic, attackable and 0 or 1)
  mob:SetSpecialAbility(SpecialAbility.immune_aggro, attackable and 0 or 1)
  mob:SetSpecialAbility(SpecialAbility.immune_aggro_on, attackable and 0 or 1)
  mob:SetSpecialAbility(SpecialAbility.no_harm_from_client, attackable and 0 or 1)
end

function event_spawn(e)
  make_attackable(e.self, false)
  e.self:SetTargetable(false)
  e.self:TempName("_") -- hide name until they arrive (should show real name on track though)

  local cube = cubes[e.self:GetNPCTypeID()]
  if cube ~= nil then
    -- database has wrong grid destinations but mesh works fine except for not walking in middle of hallways
    e.self:MoveTo(cube.dest[1], cube.dest[2], cube.dest[3], cube.dest[4], true)
  end

  if debugging then
    e.self:SetRunning(true)
    e.self:SpellFinished(1554, e.self) -- spirit of scale
  end
end

function event_waypoint_arrive(e)
  local cube = cubes[e.self:GetNPCTypeID()]
  if cube ~= nil then
    make_attackable(e.self, true)
    e.self:SetTargetable(true)
    e.self:TempName("Cube_Fragment")
  end
end
