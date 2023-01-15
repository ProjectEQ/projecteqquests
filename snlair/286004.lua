-- area emote npc
local TRIGGER_RADIUS = 50 -- from live (message distance is default sayecho 100)
local EMOTE_TIMER_RATE = 2000 -- how often to check for if clients in proximity for emote

-- area emote triggers in this zone didn't respawn after 40 minutes
local area_emotes = {
  {
    loc = { 127, 219, -8 },
    repeatable = false,
    text = "Your senses are overwhelmed by a foul smelling stench. The air appears to be almost palpable as you continue forward into the sewer. The hallways of this area appear withered and broken, probably due to the massive earthquake that occurred only a few short years before."
  },
  { -- this area emote trigger has dynamic/pool of spawn locations
    loc = { 8, 764, -32 },
    repeatable = false,
    text = "The corridor looks hazardous, the walls are crumbling!"
  },
  {
    loc = { -635, 132, -56 },
    repeatable = false,
    text = "You receive an eerie feeling as you enter this room. Cocoons on the ceiling are likely the cause of the over-abundance of insects inhabiting the sewers. This environment in the sewers seems to perpetuate the growth of these slimy creatures. Tread with caution."
  },
  {
    loc = { -19, 979, -16 },
    repeatable = false,
    text = "The water before you seems more viscous compared to clean water, indicative of the lack of maintenance this area has seen in the past few years. The cold sewage water feels slimy to the skin, the sensation sends crawls up your spine. Shall you delve further?"
  },
  {
    loc = { 97, 1336, -96 },
    repeatable = false,
    text = "Apparently the water must have overflowed into this room and surrounding areas. Before you stands a magnificent staircase, sunken, yet towering. This is but another display of some tragic disaster that must have occurred previously. Maybe the top of the stairway will provide some answers to what happened here."
  },
  { -- this area emote trigger has dynamic/pool of spawn locations
    loc = { 318, 1350, -18 },
    repeatable = false,
    text = "This hallway appears unsafe, the ceiling is collapsing!"
  },
  {
    loc = { 1038, 925, 0 },
    repeatable = false,
    text = "An ancient machine churns here with a silent hum. Curiosity sets in as you are entranced by the elegant motion of this machine. What is its purpose? What is it doing here? More than likely it served an important job in the sewers in the past. Now, it is just a silent beast with a forgotten function, much like the rest of this place."
  },
  {
    loc = { 611, 2389, -1 },
    repeatable = false,
    text = "As you approach this room, shrieks and cries of agony echo through your thoughts. There appears to be hanging cots and small beds laid out in this room. Who or what lived down here? Perhaps the workers of this place were trapped and forgotten, just like that mysterious machine. Abandoned by their family and friends, they are merely spirits now, angry because they have been forsaken."
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
