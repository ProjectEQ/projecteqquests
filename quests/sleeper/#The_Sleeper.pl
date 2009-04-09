sub EVENT_SPAWN {
 quest::settimer(1,1);
}

sub EVENT_TIMER {
 if($timer eq "1") {
  $npc->SetAppearance(1);
  quest::stoptimer(1);
 }
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::shout("I AM FREE!");
     quest::depop();
     quest::spawn2(128089,1,0,-1499,-2344.8,-1052.8,0);
 }
}
#Original work by froglok23, additions by Jim Mills