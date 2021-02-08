function event_combat(e)
if (e.joined == true) then
e.self:Emote("croon of banshees fills the room...");
eq.spawn2(201287,0,0,223,-494,-26,176); --wraith_of_retribution (201287)
eq.depop_with_timer();
end
end
