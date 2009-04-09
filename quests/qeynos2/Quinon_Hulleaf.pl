  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18020 =>1 )) {
    quest::say("Ah, hello there, $name. It's such a fine day out, wouldn't you say? Ah, reports are due in. Very well, here you go. Say hello to the fellows back at the Wind Spirit's Song for me. May you have many safe travels, my friend.");
    quest::summonitem(18025);
    quest::faction( 192,2);
   quest::faction( 184,2);
   quest::faction( 135,2);
   quest::faction( 273,-2);
   quest::faction( 207,-2);
   quest::exp(200);
  }
  plugin::return_items(\%itemcount);
}