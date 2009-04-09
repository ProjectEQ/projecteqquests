sub EVENT_SIGNAL {
if($signal == 1) {
quest::settimer(3,26);
quest::settimer(5,14400);
}
if($signal == 2) {
quest::stoptimer(3);
quest::settimer(4,300);
 }
}

sub EVENT_TIMER {
{
quest::stoptimer(3);
quest::settimer(3,26);
}

if($timer == 3) {
$npc->CastSpell(1037,209033);
quest::spawn2(209107,0,0,$x,$y,$z,$h);
quest::stoptimer(3);
quest::settimer(3,30);
 }
if($timer == 5) {
quest::stoptimer(3);
quest::stoptimer(5);
quest::depopall(209107);
}

if ($timer == 4) {
  quest::stoptimer(3);
  quest::stoptimer(4);
  quest::depopall(209107);
}

}

