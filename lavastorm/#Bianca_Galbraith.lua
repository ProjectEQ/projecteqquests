-- todo: level scaling versions would need to be handled (3 level-based versions per mission)
--       best way to approach this is probably different zone versions per difficulty level (or scaling?)
--       thundercrest_isles_the_creator_60, thundercrest_isles_the_creator_65, thundercrest_isles_the_creator_70

local testing_faction_bypass = false -- for testing, not intended for production

-- all Bianca missions use the same dz entrance
local thundercrest_compass    = { zone="broodlands", x=1241.88, y=511.147, z=23.4192 } -- switch id 5
local thundercrest_safereturn = { zone="broodlands", x=1242.0, y=526.0, z=27.0, h=0.0 }

local missions = {
  [4778] = { min_faction = Faction.Apprehensive, version = instance_version.thundercrest_isles_simple_task },           -- Simple Task [60]
  [4779] = { min_faction = Faction.Apprehensive, version = instance_version.thundercrest_isles_simple_task },           -- Simple Task [65]
  [4780] = { min_faction = Faction.Apprehensive, version = instance_version.thundercrest_isles_simple_task },           -- Simple Task [68+]
  [4803] = { min_faction = Faction.Apprehensive, version = instance_version.thundercrest_isles_throes_of_contagion },   -- Throes of Contagion [60]
  [4804] = { min_faction = Faction.Apprehensive, version = instance_version.thundercrest_isles_throes_of_contagion },   -- Throes of Contagion [65]
  [4805] = { min_faction = Faction.Apprehensive, version = instance_version.thundercrest_isles_throes_of_contagion },   -- Throes of Contagion [68+]

  [4796] = { min_faction = Faction.Indifferent, version = instance_version.thundercrest_isles_scions_of_thundercrest }, -- Scions of Thundercrest [60]
  [4797] = { min_faction = Faction.Indifferent, version = instance_version.thundercrest_isles_scions_of_thundercrest }, -- Scions of Thundercrest [65]
  [4798] = { min_faction = Faction.Indifferent, version = instance_version.thundercrest_isles_scions_of_thundercrest }, -- Scions of Thundercrest [68+]
  [4800] = { min_faction = Faction.Indifferent, version = instance_version.thundercrest_isles_splitting_the_storm },    -- Splitting the Storm [60]
  [4801] = { min_faction = Faction.Indifferent, version = instance_version.thundercrest_isles_splitting_the_storm },    -- Splitting the Storm [65]
  [4802] = { min_faction = Faction.Indifferent, version = instance_version.thundercrest_isles_splitting_the_storm },    -- Splitting the Storm [68+]

  [4772] = { min_faction = Faction.Amiable, version = instance_version.thundercrest_isles_holy_hour },                  -- Holy Hour [60]
  [4773] = { min_faction = Faction.Amiable, version = instance_version.thundercrest_isles_holy_hour },                  -- Holy Hour [65]
  [4774] = { min_faction = Faction.Amiable, version = instance_version.thundercrest_isles_holy_hour },                  -- Holy Hour [68+]
  [4793] = { min_faction = Faction.Amiable, version = instance_version.thundercrest_isles_the_creator },                -- The Creator [60]  "thundercrest_60"
  [4794] = { min_faction = Faction.Amiable, version = instance_version.thundercrest_isles_the_creator },                -- The Creator [65]  "thundercrest_65"
  [4795] = { min_faction = Faction.Amiable, version = instance_version.thundercrest_isles_the_creator },                -- The Creator [68+] "thundercrest_70"

  [4775] = { min_faction = Faction.Kindly, version = instance_version.thundercrest_isles_lair_unguarded },              -- Lair Unguarded [60]
  [4776] = { min_faction = Faction.Kindly, version = instance_version.thundercrest_isles_lair_unguarded },              -- Lair Unguarded [65]
  [4777] = { min_faction = Faction.Kindly, version = instance_version.thundercrest_isles_lair_unguarded },              -- Lair Unguarded [68+]
  [4806] = { min_faction = Faction.Kindly, version = instance_version.thundercrest_isles_behind_closed_doors },         -- Behind Closed Doors [60]
  [4807] = { min_faction = Faction.Kindly, version = instance_version.thundercrest_isles_behind_closed_doors },         -- Behind Closed Doors [65]
  [4808] = { min_faction = Faction.Kindly, version = instance_version.thundercrest_isles_behind_closed_doors },         -- Behind Closed Doors [68+]

  [5068] = { min_faction = Faction.Warmly, version = instance_version.thundercrest_isles_house_of_the_autumn_rose },    -- House of the Autumn Rose [60]
  [5069] = { min_faction = Faction.Warmly, version = instance_version.thundercrest_isles_house_of_the_autumn_rose },    -- House of the Autumn Rose [65]
  [5070] = { min_faction = Faction.Warmly, version = instance_version.thundercrest_isles_house_of_the_autumn_rose },    -- House of the Autumn Rose [68+]
}

local function get_missions(faction, is_gm)
  local task_offers = {}

  for task_id, mission in pairs(missions) do
    -- eq.debug(("checking %d client faction: %d vs min_faction %d"):format(task_id, faction, mission.min_faction))
    if is_gm or testing_faction_bypass or faction <= mission.min_faction then
      task_offers[#task_offers+1] = task_id
    end
  end

  -- sort by task ids so level choices don't display out of order
  table.sort(task_offers)

  return task_offers
end

function event_say(e)
  local is_gm = (e.other:Admin() >= 80 and e.other:GetGM())
  if not is_gm and not eq.is_dragons_of_norrath_enabled() then
    eq.debug("Dragons of Norrath not enabled, turn #gm on to bypass")
    return
  end

  if e.message:findi("hail") then
    local faction = e.other:GetFaction(e.self)
    if not is_gm and not testing_faction_bypass and faction > Faction.Apprehensive then
      e.other:Message(MT.NPCQuestSay, ("Bianca Galbraith says, 'Greetings, %s. I'm afraid I am not empowered to speak to you.  You are not as kindly to us as you ought to be to gain my full attention.'"):format(e.other:GetCleanName()))
    else
      -- task ids offered are based on faction and levels (levels are filtered by shared task system)
      local task_offers = get_missions(faction, is_gm)
      if #task_offers > 0 then
        eq.task_selector(task_offers)
      end
    end
  end
end

function event_task_accepted(e)
  if e.task_id == 4793 or e.task_id == 4794 or e.task_id == 4795 then -- The Creator
    e.other:SummonItem(86006) -- item: Lens of Truth
  end

  local mission = missions[e.task_id]
  if mission and mission.version ~= nil then
    -- dz duration will be overridden by time remaining on the shared task
    local dz = {
      instance   = { zone="thundercrest", version = mission.version },
      compass    = thundercrest_compass,
      safereturn = thundercrest_safereturn
    }
    e.other:CreateTaskDynamicZone(e.task_id, dz)
  end
end
