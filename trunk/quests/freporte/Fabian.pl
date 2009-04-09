sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, merry gentlefolk! If you enjoy the music, please feel free to cross my palm with gold.");
  }
  sub EVENT_ITEM {
  if (plugin::check_handin($gold >= 2 )) {
    quest::say("Rat spittle! Busted another string! You seem like a good music loving citizen, could you please run to the Wind Spirit's Song and grab
me a fresh set of lute strings?");
  quest::faction( 192, 30);
  quest::faction( 184, 30);
  quest::faction( 135, 30);
  quest::faction( 273, -30);
  quest::faction( 207, -30);
  }  
  if (plugin::check_handin(\%itemcount, 13709 => 1)) {
    quest::say("Many thanks, merry gentlefolk! Let me cross your palm in gratitude for your kindness.");
  quest::faction( 192, 30);
  quest::faction( 184, 30);
  quest::faction( 135, 30);
  quest::faction( 273, -30);
  quest::faction( 207, -30);
  quest::exp(5000);
  }
  }
}