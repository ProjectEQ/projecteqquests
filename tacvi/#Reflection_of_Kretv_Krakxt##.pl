#Venom
sub EVENT_SPAWN {
quest::settimer("Depop", 10);
}

sub EVENT_AGGRO {
plugin::CastOnTarget(751);
quest::depop();
}

sub EVENT_TIMER {

if ($timer eq "Depop") {
quest::stoptimer("Depop");
quest::depop();
}
}
