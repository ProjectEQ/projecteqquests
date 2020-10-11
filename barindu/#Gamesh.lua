-- Players may receive temporary flags from expeditions requested through Gamesh (live-like)
local sewers = {
  snplant = {
    expedition_info = { "Sewers of Nihilia, The Purifying Plant", 1, 6 },
    dz_info = { "snplant", 0, eq.seconds("6h"), zonein = { 150.00, 127.00, -6.87, 126.00 } }
  },
  sncrematory = {
    expedition_info = { "Sewers of Nihilia, The Crematory", 1, 6 },
    dz_info = { "sncrematory", 0, eq.seconds("6h"), zonein = { 31.00, 175.00, -17.87, 254.00 } }
  },
  snlair = {
    expedition_info = { "Sewers of Nihilia, Lair of the Trapped Ones", 1, 6 },
    dz_info = { "snlair", 0, eq.seconds("6h"), zonein = { 234.00, -70.00, -14.87, 508.00 } }
  },
  snpool = {
    expedition_info = { "Sewers of Nihilia, The Pool of Sludge", 1, 6 },
    dz_info = { "snpool", 0, eq.seconds("6h"), zonein = { 137.00, -5.00, -19.87, 378.00 } }
  }
}

for _, sewer in pairs(sewers) do
  sewer.dz_info.compass = { "barindu", -645.859, -338.502, -118.309 }
  sewer.dz_info.safereturn = { "barindu", -605.0, -337.0, -123.84, 0.0 }
end

local function create_sewer_expedition(e, sewer)
  eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Gamesh leans in closely to whisper, 'Okay, listen closely...'")
  local dz = e.other:CreateExpedition(sewer.dz_info, sewer.expedition_info)
  if dz.valid then
    dz:AddReplayLockout(eq.seconds("5m"))
  end
end

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Gamesh says, 'I don't know why you would want to, but if you want me to tell you the way to one of the different areas of the sewers let me know.  I know how to get to the treatment [" .. eq.say_link("plant") .. "], [" .. eq.say_link("crematory") .. "], [" .. eq.say_link("pools") .. "] of sludge, or the [" .. eq.say_link("lair") .. "] of trapped ones.'")
  elseif e.message:findi("plant") then
    create_sewer_expedition(e, sewers.snplant)
  elseif e.message:findi("crematory") then
    create_sewer_expedition(e, sewers.sncrematory)
  elseif e.message:findi("pool") then
    create_sewer_expedition(e, sewers.snpool)
  elseif e.message:findi("lair") then
    create_sewer_expedition(e, sewers.snlair)
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
