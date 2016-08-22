-- part of bard 1.5
-- no pre-reqs to trigger spawn

function event_death_complete(e)
    -- there may be some sort of emote over there, no idea, wasn't in range
    eq.spawn2(123164, 0, 0, -531, 1514, 9, 43) -- #Tarn_Macklin
    eq.spawn2(123159, 0, 0, -559, 1510, 9, 2) -- a_mercenary_excavator
    eq.spawn2(123159, 0, 0, -546, 1544, 9, 436) -- a_mercenary_excavator
    eq.spawn2(123159, 0, 0, -517, 1550, 9, 241) -- a_mercenary_excavator
    eq.spawn2(123165, 0, 0, -580, 1417, 7, 390) -- a_mercenary_guard
    eq.spawn2(123165, 0, 0, -553, 1452, 6, 125) -- a_mercenary_guard
    eq.spawn2(123165, 0, 0, -503, 1463, 2, 75) -- a_mercenary_guard
end
