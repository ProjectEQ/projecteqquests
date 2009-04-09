sub EVENT_SIGNAL {
 if($signal == 0) {
  quest::say("Such is the will of Cazic-Thule!");
 }
}

sub EVENT_DEATH

{
$spawn=int(rand(100));
if($spawn > 88) {
quest::spawn2(72108,0,0,$x,$y,$z,0);
}
}


#Submitted by: Jim Mills
#add on sub EVENT_DEATH for berserker epic spawn, 12% chance on death.