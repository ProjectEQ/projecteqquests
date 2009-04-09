sub EVENT_SPAWN {
quest::settimer("droon", 10800);
}

sub EVENT_DEATH {
quest::say("Ugh.. You beat Droon. You am strong little thing.. Argh..");
quest::spawn2(15160,128,0,829,1982,95,252);
}

sub EVENT_TIMER {
quest::depop();
}