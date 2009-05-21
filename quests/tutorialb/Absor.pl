#zone: tutorialb

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello $name. Before the slave revolt, I was forging picks and shovels. Now I'm making weapons so we can fight back. Mainly swords and spears. Simple stuff. If you give me your weapon, I can make you a better one.!");
    quest::updatetaskactivity(22,1);  
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9997 => 1)) {
    quest::summonitem(7021);
    quest::emote("Absor takes the weapon from you and begins to polish and balance it. When he hands it back to you, it scarcely resembles the decayed old thing that you were using.");
    quest::say("There you go. That should work much better."); 
  }
  elsif (plugin::check_handin(\%itemcount, 9998 => 1)) {
    quest::summonitem(5042);
    quest::emote("Absor takes the weapon from you and begins to polish and balance it. When he hands it back to you, it scarcely resembles the decayed old thing that you were using.");
    quest::say("There you go. That should work much better.");
  }
  elsif (plugin::check_handin(\%itemcount, 9999 => 1)) {
    quest::summonitem(6030);
    quest::emote("Absor takes the weapon from you and begins to polish and balance it. When he hands it back to you, it scarcely resembles the decayed old thing that you were using.");
    quest::say("There you go. That should work much better.");
  }
  elsif (plugin::check_handin(\%itemcount, 55623 => 1)) {
    quest::summonitem(5071);
    quest::emote("Absor takes the weapon from you and begins to polish and balance it. When he hands it back to you, it scarcely resembles the decayed old thing that you were using.");
    quest::say("There you go. That should work much better.");
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1)) {
    quest::say("Now let me see... Ah ha! Here ya go! A much better weapon to help fend off those nasties!");
    quest::summonitem(quest::ChooseRandom(54230,54231,54232,54233));
  }
  elsif (plugin::check_handin(\%itemcount, 59954 => 1)) {
    quest::say("Now let me see... Ah ha! Here ya go! A spiffy, new weapon to aid you in your adventures!");
    quest::summonitem(quest::ChooseRandom(54235,54236,54237,54238));
    }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}