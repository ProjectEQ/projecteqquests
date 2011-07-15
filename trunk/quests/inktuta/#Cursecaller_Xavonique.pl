#Cursecaller_Xavonique
my $cursebearer = 296064; #an_unfeeling_cursebearer

sub EVENT_SPAWN {
  #spawn my the first cursebearer when I spawn.
  SUMMON_CURSEBEAER();
  #tiemr to check if I need a new cursebearer
  quest::settimer(1,15);
}

sub EVENT_TIMER {
  #if the curserbearer is not up, summon a new one.
  if($timer == 1 && $entity_list->GetMobByNpcTypeID($cursebearer)) { SUMMON_CURSEBEAER(); }
}

sub SUMMON_CURSEBEARER {
  quest::spawn2($cursebearer,0,0,$x+15,$y+15,$z,$h);
}

sub EVENT_DEATH {
  quest::depopall($cursebearer);
}