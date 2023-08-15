local don = require("dragons_of_norrath")

local function show_help(client)
  local don_status_good = eq.say_link("#don status good", false, "good")
  local don_status_evil = eq.say_link("#don status evil", false, "evil")
  local don_teleport_good = eq.say_link("#don teleport good", false, "good")
  local don_teleport_evil = eq.say_link("#don teleport evil", false, "evil")

  client:Message(MT.White, "------------------------------------------------")
  client:Message(MT.White, "Dragons of Norrath GM command usage:")
  client:Message(MT.White, "------------------------------------------------")
  client:Message(MT.White, eq.say_link("#don status") .. " [" .. don_status_good .. "|" .. don_status_evil .. "] - view target's DoN faction and flags (both if not specified)")
  client:Message(MT.White, eq.say_link("#don teleport") .. " [" .. don_teleport_good .. "|" .. don_teleport_evil .. "] - teleport to respective camps")
  client:Message(MT.White, eq.say_link("#don aa") .. " - show DoN AA on target")
  client:Message(MT.White, eq.say_link("#don aa fix") .. " - remove invalid (missing required faction) DoN AA from target")
  client:Message(MT.White, "#don aa remove <good|evil> - remove all DoN AA on target")
  client:Message(MT.White, "#don faction add <good|evil> <amount> - add or decrease target's faction by amount")
  client:Message(MT.White, "#don faction set <good|evil> <value> - set target's faction reaction level")
  client:Message(MT.White, "#don faction reset <good|evil> - reset target's faction to character default")
  client:Message(MT.White, eq.say_link("#don faction fix") .. " - run invalid (positive with both sides) faction state fix on target")
  client:Message(MT.White, "#don flags add <good|evil> [ flag mask ] - add flag on target (next highest flag if not specified)")
  client:Message(MT.White, "#don flags remove <good|evil> [ flag mask ] - remove flag on target (highest flag if not specified)")
  client:Message(MT.White, "#don flags reset <good|evil> - clear all flags on target (does not reset completed solo quests)")
end

local function get_state(client, faction)
  local player = nil
  if faction == 'good' then
    player = don.character_state.new(client, don.faction_id.good)
  elseif faction == 'evil' then
    player = don.character_state.new(client, don.faction_id.evil)
  end
  return player
end

local function adjust_faction(sender, target, command, faction, value)
  local player = get_state(target, faction)
  if not player then
    sender:Message(MT.Red, "faction name must be \"good\" (Norrath's Keepers) or \"evil\" (Dark Reign)")
    return
  end

  if command == "add" then
    value = tonumber(value)
  elseif command == "set" then
    value = tonumber(value) - player.faction_level -- sets modded reaction, not standing
  elseif command == "reset" then
    value = -player.faction_standing
  else
    sender:Message(MT.Red, ("invalid faction command '%s'"):format(command))
    return
  end

  sender:Message(MT.White, ("Changing %s's '%s' faction (id: %d) from %d to %d"):format(target:GetName(), player.faction_name, player.faction_id, player.faction_level, player.faction_level + value))

  -- faction change doesn't work if target has gm on
  local is_gm = player.client:GetGM()
  if is_gm then player.client:SetGM(false) end
  player.client:Faction(player.faction_id, value)
  if is_gm then player.client:SetGM(true) end
end

local function on_faction_cmd(sender, target, command, faction, value)
  if command == "fix" then
    if target:GetGM() then
      sender:Message(MT.Red, "Cannot run faction fix on character with GM flag enabled")
    else
      sender:Message(MT.White, ("Running invalid faction state fix on %s (%s)"):format(target:GetName(), target:CharacterID()))
      don.fix_invalid_faction_state(target)
    end
  else
    adjust_faction(sender, target, command, faction, value)
  end
end

local function faction_desc(level)
  if level >= don.faction.Ally         then return "Ally" end
  if level >= don.faction.Warmly       then return "Warmly" end
  if level >= don.faction.Kindly       then return "Kindly" end
  if level >= don.faction.HighAmiable  then return "High Amiable" end
  if level >= don.faction.Amiable      then return "Amiable" end
  if level >= don.faction.Indifferent  then return "Indifferent" end
  if level >= don.faction.Apprehensive then return "Apprehensive" end
  if level >= don.faction.Dubious      then return "Dubious" end
  if level >= don.faction.Threaten     then return "Threatening" end
  return "Scowls"
end

local function get_binary(mask)
  local bits = ""
  for i=31,0,-1 do
    bits = bits .. ((bit.band(mask, bit.lshift(1, i)) ~= 0) and "1" or "0")
    if i % 4 == 0 then bits = bits .. " " end
  end
  return bits
end

local flag_descriptions = {
  { flag = don.flags.t1.said_help,                     desc = "(T1) Said \"help\" for access to solo quests" },
  { call = don.character_state.has_finished_t1_quests, desc = "(T1) (non-flag) finished the 3 solo quests" },
  { flag = don.flags.t1.solo_quests_hail,              desc = "(T1) Hailed after finishing 3 solo quests for access to mission" },
  { flag = don.flags.t1.group_mission_done,            desc = "(T1) Finished the group mission", good="(Children of Gimblax)", evil="(Have Note Will Travel)" },
  { flag = don.flags.t1.complete,                      desc = "(T1) Complete (hailed after completing mission)" },
  { separator = true },
  { flag = don.flags.t2.said_work,                     desc = "(T2) Said \"work\" for access to solo quests" },
  { call = don.character_state.has_finished_t2_quests, desc = "(T2) (non-flag) finished the 3 solo quests" },
  { flag = don.flags.t2.solo_quests_hail,              desc = "(T2) Hailed after finishing 3 solo quests for access to mission and raid" },
  { flag = don.flags.t2.group_mission_done,            desc = "(T2) Finished the group mission", good="(Sickness of the Spirit)", evil="(Drake Eggs)" },
  { flag = don.flags.t2.stone_fragment,                desc = "(T2) Turned in 'Glowing Stone Fragment' from 'Calling Emoush' raid" },
  { flag = don.flags.t2.complete,                      desc = "(T2) Complete (finished group mission and turned in raid item)" },
  { separator = true },
  { flag = don.flags.t3.hail_start,                    desc = "(T3) Hailed for access to solo quests" },
  { call = don.character_state.has_finished_t3_quests, desc = "(T3) (non-flag) finished the 3 solo quests" },
  { flag = don.flags.t3.solo_quests_hail,              desc = "(T3) Hailed after finishing 3 solo quests for access to mission and raids" },
  { flag = don.flags.t3.group_mission_done,            desc = "(T3) Finished the group mission", good="(History of the Isle)", evil="(The Gilded Scroll)" },
  { flag = don.flags.t3.goblin_beads,                  desc = "(T3) Turned in 'Goblin Warlord's Beads' from 'Trial of Perseverance' raid" },
  { flag = don.flags.t3.spider_spinners,               desc = "(T3) Turned in 'Lava Spider Spinners' from 'Volkara's Bite' raid" },
  { flag = don.flags.t3.complete,                      desc = "(T3) Complete (finished group mission and turned in both raid items)" },
  { separator = true },
  { flag = don.flags.t4.hail_start,                    desc = "(T4) Hailed for access to raids" },
  { flag = don.flags.t4.sand_turned_in,                desc = "(T4) Turned in 'Quintessence of Sand' from 'Guardian of the Sands' raid" },
  { flag = don.flags.t4.stone_turned_in,               desc = "(T4) Turned in 'Meditation Stone' from 'Goblin Dojo' raid" },
  { flag = don.flags.t4.yarlir_access,                 desc = "(T4)", good="Said \"defend\" for access to 'An End to the Storms' raid",
                                                                      evil="Said \"prove\" for access to 'An End to the Storms' raid" },
  { flag = don.flags.t4.yarlir_fang,                   desc = "(T4) Turned in 'Yar`lir's Fang' from 'An End to the Storms' raid" },
  { flag = don.flags.t4.complete,                      desc = "(T4) Complete (turned in 'Yar`lir's Fang' from 'An End To the Storms' raid)" },
  { separator = true },
  { flag = don.flags.t5.hail_start,                    desc = "(T5) Hailed for access to group mission and 'The Curse of Ju`rek' raid" },
  { flag = don.flags.t5.group_mission_done,            desc = "(T5) Finished the group mission", good="(Origins of the Curse)", evil="(Rival Party)" },
  { flag = don.flags.t5.diseased_wing,                 desc = "(T5) Turned in 'Diseased Wing Fragment' from 'The Curse of Ju`rek' raid" },
  { flag = don.flags.t5.said_dragon,                   desc = "(T5)", good="Said \"dragon\" for access to 'In the Shadows' raid",
                                                                      evil="Finished mission and turned in raid item for access to 'In the Shadows' raid" },
  { flag = don.flags.t5.vish_scale,                    desc = "(T5) Turned in 'Shadowscale of Vishimtar' from 'In the Shadows' raid" },
  { flag = don.flags.t5.complete,                      desc = "(T5) Complete (turned in 'Shadowscale of Vishimtar')" },
  { separator = true },
  { flag = don.flags.complete_hail,                    desc = "(optional) Hailed after completing T5" },
}

local function show_flags(sender, target, faction_id)
  local player = don.character_state.new(target, faction_id)
  local mt = (faction_id == don.faction_id.good) and MT.Lime or MT.Cyan

  sender:Message(mt, ("Flags: 0x%08x bits: %s"):format(player.flags, get_binary(player.flags)))
  sender:Message(MT.White, "------------------------------------------------")

  for _, row in ipairs(flag_descriptions) do
    if row.separator then
      sender:Message(MT.DimGray, "--")
    elseif row.call then
      local msg_mt = row.call(player) and mt or MT.DimGray
      sender:Message(msg_mt, "-- " .. row.desc)
    elseif row.flag then
      local msg_mt = player:has_flag(row.flag) and mt or MT.DimGray
      local optional = faction_id == don.faction_id.good and row.good or row.evil
      sender:Message(msg_mt, ("-- %s %s"):format(row.desc, optional or ''))
    end
  end
end

local function get_highest_flag(player)
  for i=31,0,-1 do
    local flag = bit.lshift(1, i)
    if player:has_flag(flag) then
      return flag
    end
  end
  return 0
end

local function adjust_flags(sender, target, command, faction, flag)
  local player = get_state(target, faction)
  if not player then
    sender:Message(MT.Red, "faction name must be \"good\" (Norrath's Keepers) or \"evil\" (Dark Reign)")
    return
  end

  if command == "reset" then
    player:reset_flags()
    sender:Message(MT.White, ("Reset all %s flags on character %s"):format(player.faction_name, target:GetName()))
  elseif command == "remove" then
    flag = flag or get_highest_flag(player)
    if flag == 0 then
      sender:Message(MT.White, ("Failed to remove %s flag on character %s (flag was 0)"):format(player.faction_name, target:GetName()))
    else
      sender:Message(MT.White, ("Removing %s flag 0x%08x on character %s (id: %s)"):format(player.faction_name, flag, target:GetName(), target:CharacterID()))
      player:remove_flag(flag)
    end
  elseif command == "add" then
    local highest = get_highest_flag(player)
    if not flag and highest == bit.lshift(1,31) then
      sender:Message(MT.White, ("Failed to add %s flag to character %s (already max)"):format(player.faction_name, target:GetName()))
    else
      local new_flag = flag or bit.lshift(highest, 1)
      if new_flag == 0 then new_flag = 1 end
      sender:Message(MT.White, ("Adding %s flag 0x%08x to character %s (id: %s)"):format(player.faction_name, new_flag, target:GetName(), target:CharacterID()))
      player:set_flag(new_flag)
    end
  else
    sender:Message(MT.Red, ("flag command '%s' not recognized"):format(command))
  end
end

local function on_aa_cmd(sender, target, command, faction, value)
  if command == "fix" then
    sender:Message(MT.White, ("Removing invalid DoN AA on (%s) (character id: %d)"):format(target:GetCleanName(), target:CharacterID()))
    don.remove_invalid_aa(target, don.faction_id.good)
    don.remove_invalid_aa(target, don.faction_id.evil)
  elseif command == "remove" then
    local remove_aa = function(aa_table)
      for _, aa in ipairs(aa_table) do
        if target:GetAA(aa.rank_id) > 0 then
          sender:Message(MT.White, ("Removing '%s.' from %s"):format(aa.name, target:GetName()))
          target:Message(MT.Red, ("You have lost the ability '%s.'"):format(aa.name))
          target:ResetAlternateAdvancementRank(aa.aa_id)
        end
      end
    end

    if faction == "good" then
      remove_aa(don.aa[don.faction_id.good])
    elseif faction == "evil" then
      remove_aa(don.aa[don.faction_id.evil])
    else
      sender:Message(MT.Red, "faction name must be \"good\" (Norrath's Keepers) or \"evil\" (Dark Reign)")
    end
  else
    local show_aa = function(color, aa_table)
      for _,aa in ipairs(aa_table) do
        local points = target:GetAA(aa.rank_id)
        local mt = points > 0 and color or MT.DarkGray
        sender:Message(mt, ("aa_id: %d rank_id: %d points: %d (%s)"):format(aa.aa_id, aa.rank_id, points, aa.name))
      end
    end

    sender:Message(MT.White, "------------------------------------------------")
    sender:Message(MT.White, ("Dragons of Norrath AA for (%s) (character id: %d)"):format(target:GetCleanName(), target:CharacterID()))
    sender:Message(MT.White, "------------------------------------------------")
    show_aa(MT.Lime, don.aa[don.faction_id.good])
    sender:Message(MT.White, "------------------------------------------------")
    show_aa(MT.Cyan, don.aa[don.faction_id.evil])
    sender:Message(MT.White, "------------------------------------------------")
  end
end

local function show_status(sender, target, which)
  sender:Message(MT.White, "------------------------------------------------")
  sender:Message(MT.White, ("Dragons of Norrath status for (%s) (character id: %d)"):format(target:GetCleanName(), target:CharacterID()))

  if which ~= "evil" then
    local good = don.character_state.new(target, don.faction_id.good)
    sender:Message(MT.White, "------------------------------------------------")
    sender:Message(MT.Lime, "Norrath's Keepers")
    sender:Message(MT.White, "------------------------------------------------")
    sender:Message(MT.Lime, ("Faction (reaction): %s (%s)"):format(good.faction_level, faction_desc(good.faction_level)))
    show_flags(sender, target, don.faction_id.good)
  end

  if which ~= "good" then
    local evil = don.character_state.new(target, don.faction_id.evil)
    sender:Message(MT.White, "------------------------------------------------")
    sender:Message(MT.Cyan, "Dark Reign")
    sender:Message(MT.White, "------------------------------------------------")
    sender:Message(MT.Cyan, ("Faction (reaction): %s (%s)"):format(evil.faction_level, faction_desc(evil.faction_level)))
    show_flags(sender, target, don.faction_id.evil)
  end

  sender:Message(MT.White, "------------------------------------------------")
end

local function command_don(e)
  local target = e.self:GetTarget()
  if target.null or not target:IsClient() then
    target = e.self
  end
  target = target:CastToClient()

  if e.args[1] == "status" then
    show_status(e.self, target, e.args[2])
  elseif e.args[1] == "teleport" then
    if e.args[2] == "good" then
      e.self:Message(MT.Lime, "Teleporting to Norrath's Keepers camp")
      e.self:MovePCInstance(27, 0, 557, 3616, -11, 434)
    elseif e.args[2] == "evil" then 
      e.self:Message(MT.Lime, "Teleporting to Dark Reign camp")
      e.self:MovePCInstance(27, 0, -368, 3098, 41, 169)
    else 
      sender:Message(MT.Lime, "Invalid teleport option")
    end
  elseif e.args[1] == "faction" and e.args[2] then
    on_faction_cmd(e.self, target, e.args[2], e.args[3], e.args[4])
  elseif e.args[1] == "flags" and e.args[2] and e.args[3] then
    adjust_flags(e.self, target, e.args[2], e.args[3], e.args[4])
  elseif e.args[1] == "aa" then
    on_aa_cmd(e.self, target, e.args[2], e.args[3], e.args[4])
  else
    show_help(e.self)
  end
end

return command_don
