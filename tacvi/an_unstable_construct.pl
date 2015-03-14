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
my $KK = quest::ChooseRandom(-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10);
$npc->MoveTo(198 + $KK, -587 + $KK, -6.5);
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



