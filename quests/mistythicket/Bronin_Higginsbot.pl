sub EVENT_SAY {
   if ($text=~/hail/i) {
      quest::say("Hello. It is dangerous out in the woods. You should go to Rivervale. It's at the end of the path. You will find good times there. Travel safely, my friend!");
   }
}

sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 13110 => 1 )) {
      quest::say("AHH!! You have been sent by the Highkeep Guards!! You will never take Bronin Higginsbot alive!!");
      quest::faction(77, -25);
      quest::faction(33, -25);
      quest::faction(218, 25);
      quest::faction(48, -25);
      quest::faction(31, -25);
      quest::attack($name);
	}
	plugin::return_items(\%itemcount);
}
