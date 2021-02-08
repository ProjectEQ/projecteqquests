local TRIGGER_RADIUS = 50 -- from live (message distance is default sayecho 100)
local EMOTE_TIMER_RATE = 2000 -- how often to check for if clients in proximity for emote

-- triggers did not respawn here or the spawn time is long
local area_emotes = {
  {
    loc = { -204, -23, -6 },
    repeatable = false,
    text = "You must raise your arm to cover your mouth and nose as an awful stench comes lofting through the hallway."
  },
  {
    loc = { -1331, -44, 0 },
    repeatable = false,
    text = "In the distance, through the thick air, you can make out the deadly barbs on the shell of an amphibian."
  },
  {
    loc = { -1036, -626, -72 },
    repeatable = false,
    text = "Putrid ooze overflows from the pipes, causing waves of slime to lap against the edges of the room.  A grim orchestra of skittering noises echo off the walls."
  },
  {
    loc = { -322, -1630, -73 },
    repeatable = false,
    text = "You can feel the presence of hundreds of insect eyes staring at you from the darkness."
  },
  {
    loc = { -103, -754, -71 },
    repeatable = false,
    text = "The sound of claws scraping against the stone floor is heard from the room ahead."
  },
  {
    loc = { 404, -913, -73 },
    repeatable = false,
    text = "You watch in disgust as the sewer water congeals into masses that begin to take on a life of their own."
  },
}

function trigger_spawn(e)
  -- find our emote index
  for i=1,#area_emotes do
    local area = area_emotes[i]
    local dist = e.self:CalculateDistance(area.loc[1], area.loc[2], area.loc[3])
    if dist < 10 then
      e.self:SetEntityVariable("emote_index", tostring(i))
      eq.set_timer("area_emote", EMOTE_TIMER_RATE)
      break
    end
  end
end

function trigger_timer(e)
  if e.timer == "area_emote" then
    local index = tonumber(e.self:GetEntityVariable("emote_index")) or 0
    if index > 0 and eq.PlayerCheck(e.self:GetX(), e.self:GetY(), e.self:GetZ(), TRIGGER_RADIUS) then
      -- these are actually death emotes (speak_mode: 3, msg_type: 343)
      eq.get_entity_list():MessageClose(e.self, true, 100, 343, area_emotes[index].text)
      e.self:Depop(area_emotes[index].repeatable) -- depop with respawn timer if repeatable
    end
  end
end

function event_encounter_load(e)
  eq.register_npc_event("area_emotes", Event.spawn, 287034, trigger_spawn) -- npc: "_" in version 0 of zone
  eq.register_npc_event("area_emotes", Event.timer, 287034, trigger_timer) -- npc: "_" in version 0 of zone

  eq.register_npc_event("area_emotes", Event.spawn, 287092, trigger_spawn) -- npc: "_" in version 1 of zone
  eq.register_npc_event("area_emotes", Event.timer, 287092, trigger_timer) -- npc: "_" in version 1 of zone
end
