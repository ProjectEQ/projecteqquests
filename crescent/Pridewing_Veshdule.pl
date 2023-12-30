sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Vasha, fair $name. Mysaphar, my mother, has granted me the wisdom to know what's right and to act upon it.  In fact, all paladins of the Wings of Virtue are the same. A true heart you must have.");
  }
}

sub EVENT_ITEM {
  if (($class eq "Paladin") && (plugin::check_handin(\%itemcount, 58651 => 1))) { #Crescent Reach Guild Summons
    quest::say("Karui, friend. I was hoping you would be one to join the Wings of Virtue. We are the paladins of Crescent Reach who seek truth and justice in all we do. You are expected to seek the same in all of your travels. I can train your skills, but not your heart. Take this tunic of our guild and hopefully it will guard you in your travels. I suggest you visit Innkeeper Fathus and Initiate Dakkan as they will have jobs for younglings. Udra, $name.");
    quest::faction(1129, 100); #Circle of the Crystalwing
    quest::summonitem(58755); #Wings of Virtue Apprentice Tunic*
  }
  plugin::return_items(\%itemcount);
}