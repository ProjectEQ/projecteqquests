sub EVENT_SPAWN {
quest::settimer("elemreset",1800);
}

sub EVENT_TIMER {
if ($timer eq "elemreset") {
quest::depop();
}
 }
