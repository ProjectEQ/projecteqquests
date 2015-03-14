#BeginFile: qey2hh1\12184.pl
#Quest file for West Karana - a snarling werewolf (High): Necromancer Epic 1.5 (pre)

sub EVENT_SPAWN {
  quest::settimer("Werewolf2Depop",1800); #Despawn after 30 minutes
  quest::setnexthpevent(75);
}

sub EVENT_DEATH_COMPLETE {
  my $werewolf = $entity_list->GetMobByNpcTypeID(12183);
  if (!$werewolf) { #All werewolves dead
    quest::say("Your attack was in vain, fool. The staff was stolen from us by a bandit only hours ago.");
    quest::spawn2(12185,186,0,-11080,-2920,38,0); #Shady Bandit
  }
}

sub EVENT_TIMER {
  quest::stoptimer("Werewolf2Depop");
  quest::depop();
}

sub EVENT_COMBAT {
  if ($combat_state == 0) {
    quest::moveto($x,$y,$z,$h,1);
  }
  else {
    quest::emote("moves to attack.");
  }
}

sub EVENT_HP {
  if ($hpevent == 75) {
    quest::modifynpcstat("max_hit",1400);
    quest::setnexthpevent(50);
  }
  if ($hpevent == 50) {
    quest::modifynpcstat("max_hit",1600);
    quest::setnexthpevent(25);
  }
  if ($hpevent == 25) {
    quest::modifynpcstat("max_hit",1800);
  }
}
#EndFile: qey2hh1\12184.pl (12184)