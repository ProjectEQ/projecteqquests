-- area emote npc id: 243605
local TRIGGER_RADIUS = 50
local EMOTE_TIMER_RATE = 2000
local TRIGGER_MINIMUM = 3

local area_emotes = {
  {
    loc = { -280, -108, 6 },
    color = 15,
    text = "Your footsteps break the silence in the caverns. Your activity has alarmed nearby scouts looking to please their master with information of an intruder.  Perhaps it wasn't so wise of you to come here..."
  },
  {
    loc = { 542, 109, 9 },
    color = 15,
    text = "Something large and menacing claws at the rocks just ahead.  The scrapes grind with the anticipation of the slaughter soon to come.  Whatever beast lingers ahead knows that it is almost time for it to unleash its fury and serve the master that put it here."
  },
  {
    loc = { 195, -4, 2 },
    color = 15,
    text = "Something large and menacing claws at the rocks just ahead.  The scrapes grind with the anticipation of the slaughter soon to come.  Whatever beast lingers ahead knows that it is almost time for it to unleash its fury and serve the master that put it here."
  },
  {
    loc = { 373, 330, 7 },
    color = 15,
    text = "Something large and menacing claws at the rocks just ahead.  The scrapes grind with the anticipation of the slaughter soon to come.  Whatever beast lingers ahead knows that it is almost time for it to unleash its fury and serve the master that put it here."
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
