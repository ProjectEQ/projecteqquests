local dz_task_id = 0
local owner_id = 0 -- saved id of client that can issue follow command
local is_following = false -- was in follow state for correct dialogue
local rescued_lila = false
local get_lila_to_entrance = 4 -- task element index
local area = { min_x = -98, min_y = -1782, min_z = 12, max_x = 102, max_y = -1582, max_z = 212 } -- entrance

local function get_owner_client()
  if owner_id ~= 0 then
    local owner_client = eq.get_entity_list():GetClientByID(owner_id)
    if owner_client.valid then
      return owner_client
    end
  end
  return Client()
end

local function follow_client(client)
  owner_id = client:GetID()
  eq.follow(owner_id, 15)
  is_following = true
end

local function lila_say(e)
  local follow_id = e.self:GetFollowID()

  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Lila Trulan says, 'Thank you so much for rescuing me.  I don't know how much longer I would have been able to hold out.  Let's get out of here!  Just let me know when it's safe to follow you or if I should stop and wait.'")
  elseif e.message:findi("follow") then
    -- live locks follow to the player that first says follow until that player zones
    local owner_client = get_owner_client()
    --eq.debug(("active follow_id: %d owner_id: %d owner_valid: %s is_following: %s"):format(e.self:GetFollowID(), owner_id, tostring(owner_client.valid), is_following))

    if follow_id == e.other:GetID() then
      e.other:Message(MT.NPCQuestSay, "Lila Trulan says, 'I'm already following you!'")
    elseif follow_id ~= 0 and follow_id ~= e.other:GetID() and owner_client.valid then
      -- is actively following another player in zone (live says name of player that said follow, not owner)
      e.other:Message(MT.NPCQuestSay, ("Lila Trulan says, 'I'm already following %s, but thanks for offering!'"):format(e.other:GetName()))
    elseif follow_id == 0 and not is_following and owner_id ~= e.other:GetID() and owner_client.valid then
      -- is stopped but has another owner client that's still in zone
      e.other:Message(MT.NPCQuestSay, "Lila Trulan says, 'I was already following someone, but I've forgotten who. Can you ask them to let me know so I can follow them again, please?'")
    elseif follow_id == 0 and not is_following and (owner_id == e.other:GetID() or not owner_client.valid) then
      -- is stopped and this is owner or was following player that zoned (or this is first follow)
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Lila Trulan says, 'Thanks so much for rescuing me! Let's get out of here!'")
      follow_client(e.other)
    elseif follow_id == 0 and is_following and not owner_client.valid then
      -- was actively following a player that zoned
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Lila Trulan says, 'Hmm, not sure where the person I was following went off to, but I do need to get out of here. So, %s, let's go!'"):format(e.other:GetName()))
      follow_client(e.other)
    end
  elseif e.message:findi("stop") then
    if follow_id == 0 and not is_following then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Lila Trulan says, 'I'm already stopped! Can't you see I'm not moving?'")
    else
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Lila Trulan says, 'Ok, stopping for a moment. Let's not wait too long, I'm worried they'll find me again.'")
      eq.stop_follow() -- todo: should pause briefly before returning to spawn
      is_following = false
    end
  end
end

local function lila_tick(e)
  if not rescued_lila then
    local x, y, z = e.self:GetX(), e.self:GetY(), e.self:GetZ()
    if x > area.min_x and x < area.max_x and y > area.min_y and y < area.max_y and z > area.min_z and z < area.max_z then
      local client = eq.get_entity_list():GetClientByID(e.self:GetFollowID())
      if client.valid then
        eq.zone_emote(MT.Yellow, "Additional captors have intercepted you to try and take back the hostage!")
        eq.spawn2(340598, 0, 0, -21.0, -1501.0, 112.0, 228.0) -- Goblin_Captor
        eq.spawn2(340598, 0, 0, 10.0, -1493.0, 112.0, 242.0)  -- Goblin_Captor
        client:UpdateTaskActivity(dz_task_id, get_lila_to_entrance, 1)
        eq.stop_follow()
        is_following = false
        rescued_lila = true
      end
    end
  end
end

function event_encounter_load(e)
  dz_task_id = eq.get_dz_task_id()
  eq.register_npc_event(Event.say,  340597, lila_say) -- Lila_Trulan
  eq.register_npc_event(Event.tick, 340597, lila_tick)
end
