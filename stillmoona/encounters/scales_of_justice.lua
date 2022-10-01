local usurper_locs = { -- possibly incomplete list
  { x = 250.0, y = 860.0, z = 6.125,  h = 161.0 }, -- northeast room
  { x = 380.0, y = 445.0, z = 6.125,  h = 322.0 }, -- southeast room
  { x = 655.0, y = 850.0, z = 16.625, h = 222.0 }, -- north water room
}

local delivered_small_sack = false

local function master_death(e)
  eq.zone_emote(MT.Yellow, "You let the Goblin die!  Now we'll never accomplish our goals!  Mission FAILED!")
  eq.end_dz_task()
end

local function master_trade(e)
  local item_lib = require("items")
  if not delivered_small_sack and item_lib.check_turn_in(e.trade, { item1 = 36215 }) then -- Small Sack of Koi Food
    -- on live master does the emote on hand in also
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "A Stillmoon koi master says, 'You let him get away with my precious gift!  Quickly, find him before he is able to escape the temple walls!  Wounded as he was, he could not have gotten far away.'")
    eq.spawn2(338423, 0, 0, 930, 375, 16, 94):AddToHateList(e.self)  -- a_drake_usurper
    eq.spawn2(338424, 0, 0, 924, 413, 16, 106):AddToHateList(e.self) -- a_drake_conspirator
    eq.spawn2(338424, 0, 0, 950, 375, 16, 85):AddToHateList(e.self)  -- a_drake_conspirator
    delivered_small_sack = true
  elseif item_lib.check_turn_in(e.trade, { item1 = 36216 }) then -- Torn Bag of Koi Food
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "A Stillmoon koi master says, 'Ah, very good.  Thank you for returning my gift.  I shall use it to create the most beautiful koi the world has ever seen!  Perhaps outsiders aren't worthless after all.'")
  end
  item_lib.return_items(e.self, e.other, e.trade)
end

local function master_signal(e)
  eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "A Stillmoon koi master says, 'You let him get away with my precious gift!  Quickly, find him before he is able to escape the temple walls!  Wounded as he was, he could not have gotten far away.'")
end

local function usurper_spawn(e)
  eq.set_next_hp_event(75)
end

local function usurper_hp(e)
  local loc = usurper_locs[math.random(#usurper_locs)]
  for i=1,3 do -- CastSpell doesn't work here with multiple
    e.self:SendBeginCast(3230, 0)
    e.self:SpellFinished(3230, e.self) -- Spell: Balance of the Nameless
  end
  e.self:GMMove(loc.x, loc.y, loc.z, loc.h)
  e.self:WipeHateList()
  eq.get_entity_list():RemoveFromHateLists(e.self)
  eq.signal(338351, 1) -- signal koi master to emote
end

function event_encounter_load(e)
  eq.register_npc_event(Event.death_complete, 338351, master_death) -- a_Stillmoon_koi_master
  eq.register_npc_event(Event.trade,          338351, master_trade)
  eq.register_npc_event(Event.signal,         338351, master_signal)
  eq.register_npc_event(Event.spawn,          338423, usurper_spawn) -- a_drake_usurper
  eq.register_npc_event(Event.hp,             338423, usurper_hp)
end
