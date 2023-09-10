-- area emote npc id: 243629
local TRIGGER_RADIUS = 50
local EMOTE_TIMER_RATE = 2000
local TRIGGER_MINIMUM = 3

local area_emotes = {
  {
    loc = { 851, 730, 8 },
    color = MT.Red,
    text = "Dirt falls from the ceiling as the distant thunder of stone footsteps lashes out at the still air.  Whatever you've done, the master of these caverns is unhappy about it and is sending someone, or something, to take care of you."
  },
  {
    loc = { 642, 397, 11 },
    color = MT.Red,
    text = "Dirt falls from the ceiling as the distant thunder of stone footsteps lashes out at the still air.  Whatever you've done, the master of these caverns is unhappy about it and is sending someone, or something, to take care of you."
  },
  {
    loc = { 375, 488, 6 },
    color = MT.Red,
    text = "Dirt falls from the ceiling as the distant thunder of stone footsteps lashes out at the still air.  Whatever you've done, the master of these caverns is unhappy about it and is sending someone, or something, to take care of you."
  },
  {
    loc = { 211, 96, 1 },
    color = MT.Red,
    text = "Dirt falls from the ceiling as the distant thunder of stone footsteps lashes out at the still air.  Whatever you've done, the master of these caverns is unhappy about it and is sending someone, or something, to take care of you."
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
    if index > 0 and #e.self:GetClientsInProximity(TRIGGER_RADIUS) >= TRIGGER_MINIMUM then
      eq.get_entity_list():MessageClose(e.self, true, 100, area_emotes[index].color, area_emotes[index].text)
      eq.depop()
    end
  end
end
