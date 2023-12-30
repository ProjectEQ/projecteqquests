sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("We must be ever watchful of the spirits, $name. They not only guide us and give us strength, they protect us and must be protected. That is the Spirit Watchers' way.");
  }
}

sub EVENT_ITEM {
  if (($class eq "Shaman") && (plugin::check_handin(\%itemcount, 58660 => 1))) { #Crescent Reach Guild Summons
    quest::say("Vasha, $name. As you may well know, as shamans we can heal as much as we can harm and we have to know which to use and when. I expect you to learn this distinction as a member of the Spirit Watchers.  Take this tunic for your travels and return to me when you need further training. See Innkeeper Fathus and Initiate Dakkan as well so you can get some work done for the city.");
    quest::faction(1129, 100); #Circle of the Crystalwing
    quest::summonitem(58764); #Spirit Watchers Apprentice Tunic*
  }
  plugin::return_items(\%itemcount);
}