-- module for Dragons of Norrath expansion

local don = {}

-- DoN character state object to track progression with a DoN faction
don.character_state = {}
don.character_state.__index = don.character_state

don.faction_id = {
  evil = 1021, -- Dark Reign
  good = 1023  -- Norrath's Keepers
}

don.faction_name = {
  [don.faction_id.evil] = "Dark Reign",
  [don.faction_id.good] = "Norrath's Keepers"
}

don.faction = {
  Ally         = 1100,
  Warmly       = 750,
  Kindly       = 500,
  HighAmiable  = 300, -- 300 reaction level in live faction window
  Amiable      = 100,
  Indifferent  = 0,
  Apprehensive = -100,
  Dubious      = -500,
  Threaten     = -750
}

don.nest_unlocked_content_flag = "don_nest_unlocked"

don.flags = {
  key = {
    [don.faction_id.evil] = "don_evil",
    [don.faction_id.good] = "don_good",
  },

  -- Norrath's Keepers: Gift of the Keepers -- Dark Reign: Gift of the Dark Reign
  t1 = {
    said_help               = bit.lshift(1, 0), -- said "help" for access to 3 solo quests
    solo_quests_hail        = bit.lshift(1, 1), -- hailed after finishing 3 solo quests for access to request mission
    group_mission_done      = bit.lshift(1, 2), -- finished 'Children of Gimblax' (good) or 'Have Note Will Travel' (evil) (can be done out of order)
    complete                = bit.lshift(1, 3), -- hailed after finishing 3 solo quests and gimblax
  },
  -- Norrath's Keepers: Valor of the Keepers -- Dark Reign: Tenacity of the Dark Reign
  t2 = {
    said_work               = bit.lshift(1, 4), -- said "work" for access to 3 solo quests and non-progression raid 'Fanning the Flames'
    solo_quests_hail        = bit.lshift(1, 5), -- hailed after finishing 3 solo quests for access to request mission and ''Calling Emoush' raid
    group_mission_done      = bit.lshift(1, 6), -- finished 'Sickness of the Spirit' (good) or 'Drake Eggs' (evil) (can be done out of order)
    stone_fragment          = bit.lshift(1, 7), -- turned in 'Glowing Stone Fragment' from 'Calling Emoush' raid (with required access)
    complete                = bit.lshift(1, 8), -- finished both group mission and raid turn in (raid turn in completed last or hailed after missio with raid item already turned in)
  },
  -- Norrath's Keepers: Embrace of the Keepers -- Dark Reign: Embrace of the Dark Reign
  t3 = {
    hail_start              = bit.lshift(1, 9),  -- hailed after completing t2 for access to 3 solo quests and non-progression raids 'Reflections of Silver' and 'Kessdona's Perch'
    solo_quests_hail        = bit.lshift(1, 10), -- hailed after finishing 3 solo tasks for access to group mission and 'Trial of Perseverance' raid
    group_mission_done      = bit.lshift(1, 11), -- finished 'History of the Isle' (good) or 'The Gilded Scroll' (evil) (can be done out of order)
    goblin_beads            = bit.lshift(1, 12), -- turned in 'Goblin Warlord's Beads' from 'Trial of Perseverance' raid' (with required access)
    spider_spinners         = bit.lshift(1, 13), -- turned in 'Lava Spider Spinners' from 'Volkara's Bite' raid (with required access)
    complete                = bit.lshift(1, 14), -- finished group mission and both raid turn ins (raid turn ins completed last or hailed after mission with raid items already turned in)
  },
  -- Norrath's Keepers: Power of the Keepers -- Dark Reign: Power of the Dark Reign
  t4 = {
    hail_start              = bit.lshift(1, 15), -- hailed after completing t3 for access to 'Guardian of the Sands' and 'Goblin Dojo' raids
    sand_turned_in          = bit.lshift(1, 16), -- turned in 'Quintessence of Sand' from 'Guardian of the Sands' raid (with required access)
    stone_turned_in         = bit.lshift(1, 17), -- turned in 'Meditation Stone' from 'Goblin Dojo' raid (with required access)
    yarlir_access           = bit.lshift(1, 18), -- said "defend" (good) or "prove" (evil) after turning in raid items for access to 'An End to the Storms' raid
    yarlir_fang             = bit.lshift(1, 19), -- turned in 'Yar'lir's Fang' from 'An End to the Storms' raid
    complete                = bit.lshift(1, 20), -- complete
  },
  -- Norrath's Keepers: Sanctity of the Keepers -- Dark Reign: Fervor of the Dark Reign
  t5 = {
    hail_start              = bit.lshift(1, 21), -- hailed after completing t4 for access to group mission and 'The Curse of Ju'rek' raid
    group_mission_done      = bit.lshift(1, 22), -- finished 'Origins of the Curse' (good) or 'Rival Party' (evil) (can be done out of order)
    diseased_wing           = bit.lshift(1, 23), -- turned in 'Diseased Wing Fragment' from 'The Curse of Ju'rek' raid (with required access)
    said_dragon             = bit.lshift(1, 24), -- said "dragon" for access to for access to 'In the Shadows' raid (evil side gives after finishing group mission and raid turn in)
    vish_scale              = bit.lshift(1, 25), -- turned in 'Shadowscale of Vishimtar' from 'In the Shadows' raid
    complete                = bit.lshift(1, 26), -- complete
  },

  complete_hail             = bit.lshift(1, 27), -- hailed after completing t5, required to continue "darkness" lore conversation
}

don.spell_rewards = {
  [Class.BARD]         = 76024, -- Spell: Storm Blade
  [Class.BEASTLORD]    = 76030, -- Spell: Growl of the Panther
  [Class.BERSERKER]    = 76035, -- Tome of Destroyer's Volley
  [Class.CLERIC]       = 76020, -- Spell: Ward of Retribution
  [Class.DRUID]        = 76023, -- Spell: Serpent Vines
  [Class.ENCHANTER]    = 76029, -- Spell: Rune of Rikkukin
  [Class.MAGICIAN]     = 76028, -- Spell: Summon: Molten Orb
  [Class.MONK]         = 76034, -- Tome of Dragon Fang
  [Class.NECROMANCER]  = 76026, -- Spell: Shadow Orb
  [Class.PALADIN]      = 76021, -- Tome of Guard of Righteousness
  [Class.RANGER]       = 76022, -- Spell: Earthen Shackles
  [Class.ROGUE]        = 76033, -- Tome of Assassin's Feint
  [Class.SHADOWKNIGHT] = 76031, -- Tome of Soul Shield
  [Class.SHAMAN]       = 76025, -- Spell: Spirit of the Panther
  [Class.WARRIOR]      = 76032, -- Tome of Cyclone Attack
  [Class.WIZARD]       = 76027, -- Spell: Claw of Vox
}

-- live combines these into a single aa with ranks
don.aa = {
  [don.faction_id.evil] = {
    { aa_id = 471, rank_id = 1361, name = "Gift of the Dark Reign" },
    { aa_id = 472, rank_id = 1362, name = "Tenacity of the Dark Reign" },
    { aa_id = 473, rank_id = 1363, name = "Embrace of the Dark Reign" },
    { aa_id = 474, rank_id = 1364, name = "Power of the Dark Reign" },
    { aa_id = 475, rank_id = 1365, name = "Fervor of the Dark Reign" },
  },
  [don.faction_id.good] = {
    { aa_id = 476, rank_id = 1366, name = "Gift of the Keepers" },
    { aa_id = 477, rank_id = 1367, name = "Valor of the Keepers" },
    { aa_id = 478, rank_id = 1368, name = "Embrace of the Keepers" },
    { aa_id = 479, rank_id = 1369, name = "Power of the Keepers" },
    { aa_id = 480, rank_id = 1370, name = "Sanctity of the Keepers" },
  }
}

-- used to grant AA rewards for flag completion and fix missing AA in hail scripts
don.aa_rewards = {
  [don.flags.t1.complete] = { aa_index = 1, next_flag = don.flags.t2.complete },
  [don.flags.t2.complete] = { aa_index = 2, next_flag = don.flags.t3.complete },
  [don.flags.t3.complete] = { aa_index = 3, next_flag = don.flags.t4.complete },
  [don.flags.t4.complete] = { aa_index = 4, next_flag = don.flags.t5.complete },
  [don.flags.t5.complete] = { aa_index = 5, next_flag = nil },
}

-- Called by global event_connect to check if player has invalid DoN faction
-- (positive with both sides) and resets the side with lowest faction if so
function don.fix_invalid_faction_state(client)
  if client:GetGM() or not eq.is_dragons_of_norrath_enabled() then
    return
  end

  local good_faction = client:GetModCharacterFactionLevel(don.faction_id.good)
  local evil_faction = client:GetModCharacterFactionLevel(don.faction_id.evil)

  -- this shouldn't be possible unless through some bug
  if good_faction >= don.faction.Indifferent and evil_faction >= don.faction.Indifferent then
    local reset = { faction_id = don.faction_id.evil, faction_level = evil_faction }
    if good_faction < evil_faction then
      reset = { faction_id = don.faction_id.good, faction_level = good_faction }
    end

    -- live reset this to -200 reaction (-100 standing) on an agnostic character
    -- not sure if reset depends on deity faction mod or all characters reset the same
    local reset_amount = -(200 + reset.faction_level)
    client:Faction(reset.faction_id, reset_amount)
    client:Message(MT.Yellow, ("You appear to have earned renown with both 'Norrath's Keepers' and the 'Dark Reign'. While we congratulate you on your efforts the two warring camps have found out that you are a spy. You will be granted the title of 'the Devious' and your faction with the '%s' will be adjusted accordingly."):format(don.faction_name[reset.faction_id]))
    -- todo: lua api for CreateNewPlayerSuffix

    -- remove any AA from the reset faction
    don.remove_invalid_aa(client, reset.faction_id)
  end
end

-- Remove DoN AA from player if faction drops below minimum (indifferent)
function don.remove_invalid_aa(client, faction_id)
  local state = don.character_state.new(client, faction_id)
  state:remove_invalid_aa()
end

-- solo progression quests
don.solo_quests = {
  [don.faction_id.evil] = {
    t1 = { 4827, 4828, 4829 }, -- The Burning Poison,         Blood of the Basilisk, Clearing the Path
    t2 = { 4830, 4831, 4832 }, -- Blood from Sand,            Army of Stone,         Reap the Kirin Mind
    t3 = { 4833, 4834, 4835 }, -- Muddy the Waters,           Knowledge is Power,    Snowfoot Attack
  },
  [don.faction_id.good] = {
    t1 = { 5044, 5045, 5046 }, -- Creating an Antidote,       Burning Arrows,        Greed of the Goblins
    t2 = { 5047, 5048, 5049 }, -- Turn the Tides of the Sand, Recover the Lost Map,  Defend the Kirin Contact
    t3 = { 5050, 5051, 5052 }, -- Protect the Waters,         The Sacred Scrolls,    Snowfoot Revenge
  }
}

-- progression group missions and completion flags\
-- `finish_if_flag`: flag to check if mission finishes a progression step (if a parallel flag was completed before the mission)
don.mission_flags = {
  t1 = { add_flag = don.flags.t1.group_mission_done, finish_if_flag = don.flags.t1.solo_quests_hail },
  t2 = { add_flag = don.flags.t2.group_mission_done, finish_if_flag = don.flags.t2.stone_fragment },
  t3 = { add_flag = don.flags.t3.group_mission_done, finish_if_flag = bit.bor(don.flags.t3.goblin_beads, don.flags.t3.spider_spinners) },
  t5 = { add_flag = don.flags.t5.group_mission_done, finish_if_flag = don.flags.t5.diseased_wing },
}

don.progression_missions = {
  [401]  = { faction_id = don.faction_id.good, flags = don.mission_flags.t1 }, -- Children of Gimblax [68+]
  [4785] = { faction_id = don.faction_id.good, flags = don.mission_flags.t2 }, -- Sickness of the Spirit [68+]
  [4799] = { faction_id = don.faction_id.good, flags = don.mission_flags.t3 }, -- History of the Isle
  [4991] = { faction_id = don.faction_id.good, flags = don.mission_flags.t5 }, -- Origins of the Curse

  [5015] = { faction_id = don.faction_id.evil, flags = don.mission_flags.t1 }, -- Have Note Will Travel [65+]
  [5555] = { faction_id = don.faction_id.evil, flags = don.mission_flags.t2 }, -- Drake Eggs [68+]
  [4771] = { faction_id = don.faction_id.evil, flags = don.mission_flags.t3 }, -- The Gilded Scroll
  [4986] = { faction_id = don.faction_id.evil, flags = don.mission_flags.t5 }, -- Rival Party [68+]
}

-- Checks if a DoN progression mission was completed to set flags (called from global player)
function don.on_task_complete(client, task_id)
  if not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if don.progression_missions[task_id] then
    local mission = don.progression_missions[task_id]
    local player = don.character_state.new(client, mission.faction_id)

    if not player:has_flag(mission.flags.add_flag) then
      -- if character is in lavastorm when a progression mission is completed they
      -- see flag and message to speak to the progression npc if it finished a step
      local is_lavastorm = eq.get_zone_short_name() == "lavastorm"
      player:set_flag(mission.flags.add_flag, not is_lavastorm)

      if is_lavastorm and player:has_flag(mission.flags.finish_if_flag) then
        if mission.faction_id == don.faction_id.good then
          client:Message(MT.Yellow, "Congratulations!  Chieftain Relae Aderie at the Norrath's Keepers Enclave wishes to speak with you now.")
        else
          client:Message(MT.Yellow, "Congratulations!  Commander Zaerr Ty'Dar at the Dark Reign Outpost wants to speak with you now.")
        end
      end
    end
  end
end

-- progression raid item trade requirements and flags\
-- `req_flag`: required flag, otherwise item returned\
-- `faction`:  minimum faction level, if not met invokes 'on_low_faction' and item returned\
-- `add_flag`: flag set on successful trade (if player already has the flag item is returned)\
-- `finish_if_flag`: if player has this flag, trades invoke 'on_finish' instead of 'on_accept'\
don.trade_requirements = {
  -- t2
  [57202] = { -- Glowing Stone Fragment
    min_faction    = don.faction.Amiable,
    req_flag       = don.flags.t2.solo_quests_hail,
    add_flag       = don.flags.t2.stone_fragment,
    finish_if_flag = don.flags.t2.group_mission_done
  },

  -- t3
  [57203] = { -- Goblin Warlord's Beads
    min_faction    = don.faction.HighAmiable,
    req_flag       = don.flags.t3.solo_quests_hail,
    add_flag       = don.flags.t3.goblin_beads,
    finish_if_flag = bit.bor(don.flags.t3.group_mission_done, don.flags.t3.spider_spinners),
  },
  [57206] = { -- Lava Spider Spinners
    min_faction    = don.faction.HighAmiable,
    req_flag       = don.flags.t3.solo_quests_hail,
    add_flag       = don.flags.t3.spider_spinners,
    finish_if_flag = bit.bor(don.flags.t3.group_mission_done, don.flags.t3.goblin_beads),
  },

  -- t4
  [57204] = { -- Meditation Stone
    min_faction    = don.faction.Kindly,
    req_flag       = don.flags.t4.hail_start,
    add_flag       = don.flags.t4.stone_turned_in,
    finish_if_flag = don.flags.t4.sand_turned_in,
  },
  [57207] = { -- Quintessence of Sand
    min_faction    = don.faction.Kindly,
    req_flag       = don.flags.t4.hail_start,
    add_flag       = don.flags.t4.sand_turned_in,
    finish_if_flag = don.flags.t4.stone_turned_in,
  },
  [57200] = { -- Yar`Lir's Fang
    min_faction    = don.faction.Kindly,
    req_flag       = don.flags.t4.yarlir_access,
    add_flag       = don.flags.t4.yarlir_fang,
    finish_if_flag = nil
  },

  -- t5
  [57205] = { -- Diseased Wing Fragments
    min_faction    = don.faction.Warmly,
    req_flag       = don.flags.t5.hail_start,
    add_flag       = don.flags.t5.diseased_wing,
    finish_if_flag = don.flags.t5.group_mission_done
  },
  [57201] = { -- Shadowscale of Vishimtar
    min_faction    = don.faction.Warmly,
    req_flag       = don.flags.t5.said_dragon,
    add_flag       = don.flags.t5.vish_scale,
    finish_if_flag = nil
  },
}

-- Handle DoN raid item turn-in faction and flag requirements\
-- returns true if item should be returned and invokes callbacks based on player state
-- todo: unknown if live also confirms character level on raid item turn ins
function don.handle_trade(player, item_id, on_low_faction, on_accept, on_finish)
  if not eq.is_dragons_of_norrath_enabled() then
    return true
  end

  local return_item = true

  local reqs = don.trade_requirements[item_id]
  if reqs and not player:has_flag(reqs.add_flag) and player:has_flag(reqs.req_flag) then
    if reqs.min_faction and not player:has_min_faction(reqs.min_faction) then
      if on_low_faction then on_low_faction(player) end
    else
      player:set_flag(reqs.add_flag)
      -- this turn-in may finalize a step and trigger different dialogue/flags
      if reqs.finish_if_flag and player:has_flag(reqs.finish_if_flag) then
        if on_finish then on_finish(player) end
      else
        if on_accept then on_accept(player) end
      end
      return_item = false
    end
  end

  return return_item
end

-- filter task offers by mininum faction and flags\
-- `player_state` should be a don.character_state object
function don.get_filtered_tasks(player_state, task_table)
  local task_offers = {}

  local is_gm = player_state.client:GetGM()
  for _, task in pairs(task_table) do
    if is_gm or not task.min_faction or player_state:has_min_faction(task.min_faction) then
      -- note: live task system also enforces flag filters in source ("does not meet requirements")
      if is_gm or not task.flag or player_state:has_flag(task.flag) then
        task_offers[#task_offers+1] = task.task_id
      end
    end
  end

  return task_offers
end

-- item ids used for the "Clues" mission
don.clue_item_ids = {
  scrap_of_dark_cloth       = 81904, -- Scrap of Dark Cloth
  deformed_dragon_embryo    = 81905, -- Deformed Dragon Embryo
  desiccated_drake_corpse   = 81913, -- Desiccated Drake Corpse
  shattered_draconic_symbol = 81914, -- Shattered Draconic Symbol
  dark_dragon_scale         = 81915, -- Dark Dragon Scale
}

-- common method used by #Tatsujiro_the_Serene and #Xeib_Darkskies to complete the "Clues" mission
function don.finish_clues_mission(client, task_ids)
  local clues_speak_id = 2
  for _, task_id in ipairs(task_ids) do
    if client:IsTaskActivityActive(task_id, clues_speak_id) then
      for _, item_id in pairs(don.clue_item_ids) do
        local inv = client:GetInventory()
        if inv:HasItem(item_id, 1, bit.bor(InventoryWhere.Personal, InventoryWhere.Cursor)) ~= -1 then
          client:UpdateTaskActivity(task_id, clues_speak_id, 1)
          client:RemoveItem(item_id)
          return item_id
        end
      end
    end
  end
  return 0
end

function don.is_nest_unlocked()
  return eq.is_content_flag_enabled(don.nest_unlocked_content_flag)
end

function don.unlock_nest()
  -- todo: trigger eqswitch reloads for players already inside broodlands, otherwise they will need to re-zone
  eq.set_content_flag(don.nest_unlocked_content_flag, true)
end

function don.character_state.new(client, faction_id)
  if faction_id ~= don.faction_id.good and faction_id ~= don.faction_id.evil then
    error("Cannot load don.character_state, faction_id must be for Norrath's Keepers or Dark Reign")
  end

  local inst = {}
  setmetatable(inst, don.character_state)

  inst.client           = client
  inst.level            = client:GetLevel()
  inst.faction_id       = faction_id
  inst.faction_name     = don.faction_name[faction_id]
  inst.faction_level    = client:GetModCharacterFactionLevel(faction_id) -- "reaction" in live's faction window
  inst.faction_standing = client:GetCharacterFactionLevel(faction_id) -- unmodded
  inst.flag_key         = don.flags.key[faction_id]
  inst.solo_quests      = don.solo_quests[faction_id]
  inst.aa               = don.aa[faction_id]

  inst:load_flags()
  return inst
end

function don.character_state:has_min_faction(faction_level)
  return self.faction_level >= faction_level
end

function don.character_state:load_flags()
  self.flags = tonumber(self.client:GetBucket(self.flag_key)) or 0
end

function don.character_state:reset_flags()
  self.flags = 0
  self.client:DeleteBucket(self.flag_key)
end

function don.character_state:has_flag(flag)
  return bit.band(flag, self.flags) == flag
end

function don.character_state:remove_flag(flag)
  self.flags = bit.band(self.flags, bit.bnot(flag))
  self.client:SetBucket(self.flag_key, tostring(self.flags))
end

function don.character_state:set_flag(flag, silent)
  silent = silent or false
  local has_flag = self:has_flag(flag)
  if not has_flag then
    self.flags = bit.bor(self.flags, flag)
    self.client:SetBucket(self.flag_key, tostring(self.flags))
    if not silent then
      self.client:Message(MT.Yellow, "You have received a character flag!")
    end
  end
  self:reward_flag(flag, has_flag)
end

-- Reward player for the specified tier completion flag
function don.character_state:reward_flag(flag, had_flag)
  local aa_reward = don.aa_rewards[flag]
  if not aa_reward then
    return
  end

  -- AA points only rewarded once since this may be called to re-grant DoN AA for faction changes
  if not had_flag then
    self.client:AddAAPoints(2)
    self.client:QuestReward(self.client) -- zeroed out packet on live for trumpet sound (not sure if part of AddAAPoints)

    -- level 69 class spell reward (live does not reward again if deleted)
    if flag == don.flags.t2.complete then
      self.client:SummonItem(don.spell_rewards[self.client:GetClass()])
    end
  end

  -- grant AA and any missing ranks below this tier
  for i=1, aa_reward.aa_index do
    if self.client:GetAA(self.aa[i].rank_id) == 0 then
      self.client:GrantAlternateAdvancementAbility(self.aa[i].aa_id, 1)
    end
  end
end

-- Removes all DoN AA if player does not have minimum required faction (indifferent)
-- live removes DoN AA if below indifferent on opposing faction token turn ins and opposing faction NPC hail
-- killing guards, completing Wayfarer tasks, or token turn ins that increase faction do not trigger it
function don.character_state:remove_invalid_aa()
  if self:has_min_faction(don.faction.Indifferent) then
    return
  end

  local messaged = false
  for _, aa in ipairs(self.aa) do
    if self.client:GetAA(aa.rank_id) > 0 then
      if not messaged then
        self.client:Message(MT.Red, ("You have lost the blessings of %s!"):format(self.faction_name))
        messaged = true
      end
      self.client:Message(MT.Red, ("You have lost the ability '%s.'"):format(aa.name))
      self.client:ResetAlternateAdvancementRank(aa.aa_id)
    end
  end
end

-- Live requires hailing Chieftain or Commander to restore DoN AA if removed for low faction.
-- This results in dialogue for highest completed tier and re-grants AA with previous ranks.
-- Restoring AA requires player to have faction for their highest completed tier
-- (e.g. if player finished t2, restoring AA requires amiable; t1 AA is not restored at indifferent).
--
-- Returns true if player has `flag` but not its AA reward and has not completed the next tier
function don.character_state:needs_aa(flag)
  local aa_reward = don.aa_rewards[flag]
  if not aa_reward then
    return false
  end

  local aa = self.aa[aa_reward.aa_index]
  return self:has_flag(flag) and (not aa_reward.next_flag or not self:has_flag(aa_reward.next_flag)) and self.client:GetAA(aa.rank_id) == 0
end

function don.character_state:assign_quests(task_table)
  for _, task_id in pairs(task_table) do
    if not self.client:IsTaskActive(task_id) and not self.client:IsTaskCompleted(task_id) then
      self.client:AssignTask(task_id)
    end
  end
end

function don.character_state:has_finished_quests(task_table)
  for _, task_id in pairs(task_table) do
    if not self.client:IsTaskCompleted(task_id) then
      return false
    end
  end
  return true
end

function don.character_state:has_finished_t1_quests()
  return self:has_finished_quests(self.solo_quests.t1)
end

function don.character_state:has_finished_t2_quests()
  return self:has_finished_quests(self.solo_quests.t2)
end

function don.character_state:has_finished_t3_quests()
  return self:has_finished_quests(self.solo_quests.t3)
end

return don
