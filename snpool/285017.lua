-- area emote npc
local TRIGGER_RADIUS = 50 -- from live (message distance is default sayecho 100)
local EMOTE_TIMER_RATE = 2000 -- how often to check for if clients in proximity for emote

-- trigger mobs respawned every 4 minutes here
local area_emotes = {
  {
    loc = { -235, -14, -18 },
    repeatable = true,
    text = "Muted skittering can be heard echoing off the wet, stone walls."
  },
  {
    loc = { -543, 75, -51 },
    repeatable = true,
    text = "Slimy water drips from the walls here, causing rancid pools of goo to collect on the floor."
  },
  {
    loc = { -836, 474, -59 },
    repeatable = true,
    text = "You step in something soggy, causing your feet to be encrusted with disgusting green slime."
  },
  {
    loc = { -175, 1699, -43 },
    repeatable = true,
    text = "Stone pipes creak as if they are about to fall to pieces as you walk underneath them.  Some event has shaken the very foundation of this place."
  },
  {
    loc = { -177, 1304, -44 },
    repeatable = true,
    text = "Curdled water bubbles in this pool.  The stench of decomposition turns your stomach.  It wasn't always this way.  It used to be well-maintained."
  },
  {
    loc = { 289, 791, -109 },
    repeatable = true,
    text = "You almost slip on the slimy floor. As you look down you see rotting remnants of flesh and bone that have washed down from the city above."
  },
  {
    loc = { 270, 679, -143 },
    repeatable = true,
    text = "Fetid water splashes into a pool, causing slimy ripples to appear."
  },
  {
    loc = { -954, 1282, -29 },
    repeatable = true,
    text = "The smell here is almost unbearable.  Your vision is hampered by the thickness of the dank air in here."
  },
  {
    loc = { 1188, 455, -146 },
    repeatable = true,
    text = "As you enter this room you see a rather large gelatinous cube slither up through a grate in an unpleasant looking pool of water.  The grime has come alive."
  },
}

function event_spawn(e)
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

function event_timer(e)
  if e.timer == "area_emote" then
    local index = tonumber(e.self:GetEntityVariable("emote_index")) or 0
    if index > 0 and eq.PlayerCheck(e.self:GetX(), e.self:GetY(), e.self:GetZ(), TRIGGER_RADIUS) then
      -- these are actually death emotes (speak_mode: 3, msg_type: 343)
      eq.get_entity_list():MessageClose(e.self, true, 100, 343, area_emotes[index].text)
      e.self:Depop(area_emotes[index].repeatable) -- depop with respawn timer if repeatable
    end
  end
end
