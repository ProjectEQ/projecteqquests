sub EVENT_SPAWN {
quest::settimer(2,7200);
}

sub EVENT_TIMER {
if($timer == 2) {
quest::depop();
}
}

sub EVENT_DEATH {
quest::spawn2(218068,0,0,$x,$y,$z,$h);
quest::emote("'s corpse groans in agony...");
}