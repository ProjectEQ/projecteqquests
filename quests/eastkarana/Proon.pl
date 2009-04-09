sub EVENT_SPAWN {
quest::settimer("proon", 10800);
}

sub EVENT_AGGRO {
quest::say("WHAT YOU DONE TO MY KID!?! ME SQUASH YOU!!!!");
}

sub EVENT_DEATH {
quest::say("ARGH!!!... Broon? Broon? That you? What all this bright light? I coming son. argh.. argh.. Don't cry.. Poppa here now.. argh..");
}

sub EVENT_TIMER {
quest::depop();
}