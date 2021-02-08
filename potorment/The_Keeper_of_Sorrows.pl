sub EVENT_COMBAT {
    if ($combat_state == 1) {
    quest::settimer(1,6);
    } elsif ($combat_state == 0) {
    quest::stoptimer(1);
    }
}

sub EVENT_TIMER {
    if($timer == 1) {
        if($z < -975) {
            $npc->GMMove(-175,354,-759.13,503);
        }
    }
}

sub EVENT_DEATH_COMPLETE {
    quest::signal(207014,0); # NPC: Tylis_Newleaf
    quest::spawn2(207066,0,0,$x,$y,$z,$h); # NPC: #Tylis_Newleaf
}
