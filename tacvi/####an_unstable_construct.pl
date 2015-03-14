sub EVENT_WAYPOINT_DEPART {
  $npc->SaveGuardSpot(0);
}

sub EVENT_SPAWN {
quest::settimer("Go", 1);
quest::settimer("Depop", 30);
}

sub EVENT_TIMER {

if ($timer eq "Go") {
quest::stoptimer("Go");
$npc->MoveTo(463.8, -170.8, 26.6);
}

if ($timer eq "Depop") {
quest::stoptimer("Depop");
quest::depop();
}
}

sub EVENT_DEATH {
quest::emote ("explodes");
$npc->CastSpell(4661, $userid);
}



