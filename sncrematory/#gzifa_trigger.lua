local essence_counter = 0
local event_started = false
local chars_with_flag_inside = {}
local chars_with_items_inside = {}

function event_spawn(e)
  local x = e.self:GetX()
  local y = e.self:GetY()
  eq.set_proximity(x - 70, x + 120, y - 130, y + 30) -- enclosing middle area
end

function event_exit(e)
  if not event_started then
    chars_with_flag_inside[e.other:CharacterID()] = nil
    chars_with_items_inside[e.other:CharacterID()] = nil
    eq.debug(string.format("(exit) flagged inside: [%s] items inside: [%s]", tostring(next(chars_with_flag_inside) ~= nil), tostring(next(chars_with_items_inside) ~= nil)))
  end
end

function event_enter(e)
  -- a character on the progression step is required to be in area to trigger
  -- spawns but anyone can have the skulls. live seems to just poll the area.
  -- skulls cannot be spread between characters, one character must have them all
  if not event_started then
    local sewers_flag = tonumber(eq.get_data(e.other:CharacterID() .. "-god_sewers")) or 0

    if sewers_flag == 2 then
      chars_with_flag_inside[e.other:CharacterID()] = true
    end

    -- Items: Ngozi's Remains, Mabiki's Remains, Talakoi's Remains, Yogundi's Remains
    if e.other:HasItem(55608) and e.other:HasItem(55609) and e.other:HasItem(55610) and e.other:HasItem(55611) then
      chars_with_items_inside[e.other:CharacterID()] = true
    end

    local has_flag_inside = (next(chars_with_flag_inside) ~= nil)
    local has_items_inside = (next(chars_with_items_inside) ~= nil)
    eq.debug(string.format("(enter) flagged inside: [%s] items inside: [%s]", tostring(has_flag_inside), tostring(has_items_inside)))

    if has_flag_inside and has_items_inside then
      eq.zone_emote(15, "The spirits of those long past arise from the fiery furnace, sensing that their remains are nearby.  A ghostly voice yells out, 'Let it be known that until the Ceremony of Kiruatuk is complete, we will haunt these halls, destroying all those who dare to enter.'")
      eq.spawn2(288084, 0, 0, 1318, -2553, 15, 178) -- NPC: #Talakoi
      eq.spawn2(288083, 0, 0, 1317, -2644, 15, 49)  -- NPC: #Ngozi
      eq.spawn2(288082, 0, 0, 1430, -2644, 15, 419) -- NPC: #Mabiki
      eq.spawn2(288085, 0, 0, 1432, -2554, 15, 292) -- NPC: #Yogundi
      event_started = true
    end
  end
end

function event_signal(e)
  if e.signal == 1 then -- on each ghostly essence reaching blue crystal room (should take ~7m30s)
    essence_counter = essence_counter + 1
    if essence_counter == 4 then
      eq.set_timer("spawn_gzifa", 10000) -- give them time to move to pylon
    end
  end
end

function event_timer(e)
  if e.timer == "spawn_gzifa" then
    eq.stop_timer("spawn_gzifa")
    eq.spawn2(288087, 0, 0, 570, -2354, -59.87, 122) -- NPC: #Gzifa_the_Pure_One
  end
end
