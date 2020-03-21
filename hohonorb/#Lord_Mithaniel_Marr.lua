sub EVENT_DEATH_COMPLETE {
quest::spawn2(202368,0,0,$x,$y,$z,$h); # NPC: A_Planar_Projection
}

function event_death_complete(e)
eq.spawn2(202368,0,0,2380,-2,444,387); --NPC: A_Planar_Projection pops in middle of room
eq.depop_with_timer(220016); -- depop the trigger
end
