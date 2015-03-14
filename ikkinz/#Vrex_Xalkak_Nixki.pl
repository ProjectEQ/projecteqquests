sub EVENT_SPAWN {
  quest::settimer(1,6);
}

sub EVENT_AGGRO {
  quest::stoptimer(1);
  quest::stoptimer(3);
  quest::settimer(2,1);
}

sub EVENT_TIMER {
  if(($timer == 2) && ($x < 190)) {
    $npc->GMMove(453,-142,6,192);
  }
  if($timer == 1) {
  $npc->SetHP(71250);
  quest::stoptimer(1);
  quest::settimer(3,6);
  }
  if($timer == 3) {
  $npc->SetHP(1425000);
  quest::stoptimer(3);
  quest::settimer(1,6);
  }
}
sub EVENT_DEATH_COMPLETE {
  quest::spawn2(294596,0,0,519,-247,-50,35);
  quest::spawn2(294596,0,0,521,-156,-50,85);
  quest::spawn2(294596,0,0,556,-266,-50,243);
  quest::spawn2(294596,0,0,618,-232,-50,2);
  quest::signalwith(294631,6); #set lockout
}