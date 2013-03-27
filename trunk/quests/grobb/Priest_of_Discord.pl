sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name. Are you a child of Order? If you have come seeking the path of Discord, I require only that you give me your [Tome of Order and Discord] and I shall show you the way. Only then will you be freed from Order's confining restraints.");
  }
  if ($text=~/tome/i) {
    quest::say("The Tome of Order and Discord was penned by the seventh member of the Tribunal and has become the key to a life of Discord, in spite of the author's pitiful warnings. Do you not have one, child of Order? Would you [like to read] it?");
  }
  if ($text=~/read/i) {
    quest::say("Very well. Here you go. Simply return it to me to be released from the chains of Order. Your PvP has been disabled.");
    quest::pvp("off");
    quest::summonitem(18700);
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18700 => 1)) {
    quest::say("I see you wish to join us in Discord! Welcome! By turning your back on the protection of Order you are now open to many more opportunities for glory and power. Remember that you can now be harmed by those who have also heard the call of Discord.");
    quest::pvp("on");
  }
  plugin::return_items(\%itemcount);
}