#BeginFile: lakerathe\#Man-eating_Freshwater_Shark.pl
#Quest file for Lake Rathetear - Man-eating Freshwater Shark: Necromancer Epic 1.5 (pre)

sub EVENT_SPAWN {
  quest::settimer("SharkDepop",1800); #Despawn after 30 minutes
  quest::setnexthpevent(75);
}

sub EVENT_DEATH_COMPLETE {
  quest::stoptimer("SharkDepop");
}

sub EVENT_TIMER {
  quest::stoptimer("SharkDepop");
  quest::depop();
}

sub EVENT_HP {
  if ($hpevent == 75) {
    quest::modifynpcstat("max_hit",1000);
    quest::setnexthpevent(50);
  }
  if ($hpevent == 50) {
    quest::modifynpcstat("max_hit",1250);
    quest::setnexthpevent(25);
  }
  if ($hpevent == 25) {
    quest::modifynpcstat("max_hit",1300);
  }
}
#EndFile: lakerathe\Man-eating_Freshwater_Shark.pl (51158)