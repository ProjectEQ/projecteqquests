-- player.lua for Hollowshade Moor

function event_enter_zone(e)
    eq.signal(166257, 999) -- let controller know that player entered zone in case war is in idle mode
end