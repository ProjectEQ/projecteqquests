-- Players may receive temporary flags from expeditions requested through Gamesh (live-like)
local sewers = {
  snplant = {
    expedition = { name="Sewers of Nihilia, The Purifying Plant", min_players=1, max_players=6 },
    instance   = { zone="snplant", version=0, duration=eq.seconds("6h") },
    zonein     = { x=150.00, y=127.00, z=-6.87, h=126.00 }
  },
  sncrematory = {
    expedition = { name="Sewers of Nihilia, The Crematory", min_players=1, max_players=6 },
    instance   = { zone="sncrematory", version=0, duration=eq.seconds("6h") },
    zonein     = { x=31.00, y=175.00, z=-17.87, h=254.00 }
  },
  snlair = {
    expedition = { name="Sewers of Nihilia, Lair of the Trapped Ones", min_players=1, max_players=6 },
    instance   = { zone="snlair", version=0, duration=eq.seconds("6h") },
    zonein     = { x=234.00, y=-70.00, z=-14.87, h=508.00 }
  },
  snpool = {
    expedition = { name="Sewers of Nihilia, The Pool of Sludge", min_players=1, max_players=6 },
    instance   = { zone="snpool", version=0, duration=eq.seconds("6h") },
    zonein     = { x=137.00, y=-5.00, z=-19.87, h=378.00 }
  }
}

for _, sewer in pairs(sewers) do
  sewer.compass    = { zone="barindu", x=-645.859, y=-338.502, z=-118.309 }
  sewer.safereturn = { zone="barindu", x=-605.0, y=-337.0, z=-123.84, h=0.0 }
end

local function create_sewer_expedition(e, sewer)
  eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Gamesh leans in closely to whisper, 'Okay, listen closely...'")
  local dz = e.other:CreateExpedition(sewer)
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
