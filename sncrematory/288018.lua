-- area emote npc
local TRIGGER_RADIUS = 50 -- from live (message distance is default sayecho 100)
local EMOTE_TIMER_RATE = 2000 -- how often to check for if clients in proximity for emote

-- emotes repeated every 4 minutes in this zone (triggers respawned ~4m10s)
local area_emotes = {
  {
    loc = { -138, -531, -17 },
    repeatable = true,
    text = "You enter a room with a large pool of filthy water.  A malodorous cloud overcomes you, causing you to retch.  Years of rot have soured this place."
  },
  {
    loc = { 192, -1199, -17 },
    repeatable = true,
    text = "As you venture farther into the sewers, the foul fumes in the air become even more intense.  You struggle for each and every breath you take."
  },
  {
    loc = { 915, -1035, -16 },
    repeatable = true,
    text = "The room ahead is in a terrible state of disrepair.  Large chunks of the ceiling have collapsed, revealing a room above.  Some great force shook this part of the sewers apart.  You enter the room cautiously hoping that no more pieces of stone come crashing down on you."
  },
  {
    loc = { 1404, -1142, 7 },
    repeatable = true,
    text = "Small pools swallow the sludge pouring from the stone pipes above.  The creatures of the sewers appear to thrive in the grimy water and scramble for morsels to feed on."
  },
  {
    loc = { 1351, -2413, 20 },
    repeatable = true,
    text = "A thick wave of heat chokes you as you enter a room that holds a device that looks like an incinerator.  The room is disturbingly void of creatures.  A whisper of a voice seems to echo off the walls, making your skin crawl. It hauntingly cries, \"Ceremony...\""
  },
  {
    loc = { 215, -1621, -17 },
    repeatable = true,
    text = "A large pool of sludge spans the room.  You hesitate to enter the murky water, but realize it is the only way to reach your goal.  It looks like the water that once came through here was filtered."
  },
  {
    loc = { 446, -2349, -44 },
    repeatable = true,
    text = "An alluring, glowing crystal floats on its point.  The spirits in the room seem to be drawn to it.  The stone itself seems to whisper with thousands of souls."
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
