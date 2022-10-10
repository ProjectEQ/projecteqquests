-- first phase banishes to two separate locations every 40s
-- once "killed", collapses and fully regenerates (slowly) to 100% to start phase 2
-- adds spawn during regeneration and phase 2 (they issue proximity emote)
-- does not appear to banish any more in phase 2
-- emotes all use color 365 (event color in live clients) default MT.Lime

--[[
  -- probably casted something here
  eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Tirranun says, 'You will burn for your defiance.  Your flesh will fuel my flames.'")

  e.other:Message(mt_event, "You have been banished!")

  eq.zone_emote(mt_event, "As Tirranun is struck down, every last ember of flame is expelled from his volcanic body.  His broken husk smolders quietly on the rock.  Alarmingly, it appears to be getting warmer.  He is recovering.")

  -- spawns Whorl of searching ashes (need to grab spawn points)
  eq.get_entity_list():MessageClose(e.self, true, 100, mt_event, "A whorl of searing ashes spins to life and searches for a hapless victim.")

  -- phase 2 stuff
  mob rename: Tirranun`s_blazing_body
  eq.zone_emote(mt_event, "Tirranun rises, and resumes his assault with a renewed and unnatural vigor.")
  eq.zone_emote(mt_event, "Tirranun shouts, 'Pitiful mortals.  You shan't destroy me so easily.'")
  eq.zone_emote(mt_event, "The bubbling lava enveloping Tirranun's frame dies down.")

  eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Tirranun`s blazing body says, 'You will burn for your defiance.  Your flesh will fuel my flames.'")
]]

local mt_event = MT.Lime -- 365 "Event Messages" on live clients
local last_shake_times = {}

local function get_clients_in_proximity(npc)
  local clients = {}
  local x, y = npc:GetX(), npc:GetY()
  for client in eq.get_entity_list():GetClientList().entries do
    if math.abs(x - client:GetX()) <= 100 and math.abs(y - client:GetY()) <= 100 then
      clients[#clients+1] = client
    end
  end
  return clients
end

local function bridge_spawn(e)
  eq.set_timer("tick", 5 * 1000)
end

local function bridge_timer(e)
  -- shakes clients in 100 square proximity, minimum 20s between bridge shakes
  -- max x,y change is 15 but needs more samples to confirm, heading changes as much as 25
  local now = os.time()
  local last_shake_time = last_shake_times[e.self:GetID()]
  if not last_shake_time or (now - last_shake_time) >= 20 then
    local clients = get_clients_in_proximity(e.self)
    if #clients > 0 then
      for _, client in ipairs(clients) do
        client:Message(mt_event, "The platform shudders violently, causing you to nearly lose your footing.")
        client:CameraEffect(1500, 1.0, client)
        local x, y, z, h = client:GetX(), client:GetY(), client:GetZ(), client:GetHeading()
        client:GMMove(x + math.random(-15, 15), y + math.random(-15, 15), z + 20, h + math.random(-25, 25))
      end
      last_shake_times[e.self:GetID()] = now
    end
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.spawn, 342115, bridge_spawn) -- "_" invis bridge npc
  eq.register_npc_event(Event.timer, 342115, bridge_timer)
end
