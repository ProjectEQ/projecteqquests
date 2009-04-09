#BeginFile: qey2hh1\12183.pl
#Quest file for West Karana - a snarling werewolf (Normal): Necromancer Epic 1.5 (pre)

sub EVENT_SPAWN {
  quest::settimer("Werewolf1Depop",1800); #Despawn after 30 minutes
}

sub EVENT_TIMER {
  quest::stoptimer("Werewolf1Depop");
  quest::depop();
}

#EndFile: qey2hh1\12183.pl (12183)
