# reserve militia tunic
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail!! If you be a new reserve member then show me your Militia Armory Token. If you are not yet initiated then I suggest you head to the Toll Gate in the Commonlands and speak with Guard Valon.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12273 => 1)) {
    quest::say("Welcome to the Freeport Militia. As a reserve member we require you to wear this tunic and fight when, who and wherever Sir Lucan commands, no questions asked!! There is no turning back!! Remember to keep clear of North Freeport. You have made a wise decision. Hail Sir Lucan!!");
    quest::summonitem(3097);
    quest::faction(105,10); #freeport militia
    quest::faction(48,10); #coalition of tradefolk underground
    quest::faction(184,-30); #knights of truth
    quest::faction(258,-30); #priests of marr
    quest::exp(10000);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: freportw ID: 9007 NPC: Armorer_Dellin

