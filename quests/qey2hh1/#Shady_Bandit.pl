#BeginFile: qey2hh1\#Shady_Bandit.pl
#Quest file for West Karana - Shady Bandit: Necromancer Epic 1.5 (pre)

sub EVENT_SPAWN {
  quest::settimer("ShadyDepop",1800); #Depop after 30 minutes
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::attack($name);
  }
}

sub EVENT_ITEM {
  quest::say("I have no use for this, $name.");
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
  quest::stoptimer("ShadyDepop");
  quest::depop();
}

#EndFile: qey2hh1\#Shady_Bandit.pl (00000)