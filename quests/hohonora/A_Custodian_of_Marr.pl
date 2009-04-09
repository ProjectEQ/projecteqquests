sub EVENT_SPAWN {
quest::say("Fool!");
quest::settimer(1,7200);
}

sub EVENT_DEATH {
quest::spawn2(211074,0,0,$x,$y,$z,$h);
}

sub EVENT_TIMER {
if($timer == 1) {
quest::depop();
}}