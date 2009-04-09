#BeginFile: qey2hh1\12184.pl
#Quest file for West Karana - a snarling werewolf (High): Necromancer Epic 1.5 (pre)

sub EVENT_SPAWN {
  quest::settimer("Werewolf2Depop",1800); #Despawn after 30 minutes
}

sub EVENT_DEATH {
  quest::say("Your attack was in vain, fool. The staff was stolen from us by a bandit only hours ago.");
  quest::spawn2(12185,0,0,-11080,-2920,0,0); #Shady Bandit
}

sub EVENT_TIMER {
  quest::stoptimer("Werewolf2Depop");
  quest::depop();
}

#EndFile: qey2hh1\12184.pl (12184)
