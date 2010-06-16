#BeginFile: qey2hh1\12183.pl
#Quest file for West Karana - a snarling werewolf (Normal): Necromancer Epic 1.5 (pre)

my $werewolf;
sub EVENT_SPAWN {
  quest::settimer("Werewolf1Depop",1800); #Despawn after 30 minutes
  $werewolf = 0;
}

sub EVENT_DEATH {
  $werewolf++;
  my $bigwolf = $entity_list->GetMobByNpcTypeID(12184);
  if (($werewolf == 4) && !$bigwolf) { #All werewolves dead
    quest::say("Your attack was in vain, fool. The staff was stolen from us by a bandit only hours ago.");
    quest::spawn2(12185,186,0,-11080,-2920,38,0); #Shady Bandit
  }
}

sub EVENT_TIMER {
  quest::stoptimer("Werewolf1Depop");
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
#EndFile: qey2hh1\12183.pl (12183)