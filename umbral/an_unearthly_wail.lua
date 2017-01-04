function event_spawn(e)
eq.zone_emote(10, "an unearthly wail fills the air as the Dark Masters begin chanting for the coming of doom.");
eq.set_timer("emote", 10800000);
end

function event_timer(e)
eq.zone_emote(10, "an unearthly wail fills the air as the Dark Masters begin chanting for the coming of doom.");
end
