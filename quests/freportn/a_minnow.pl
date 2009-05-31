sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13861 =>1 )) {
    quest::faction( 184,-2 );
    quest::faction( 86,1 );
    quest::faction( 105,1 );
    quest::faction( 258,-2 );
    quest::faction( 311,-2 );
    quest::ChooseRandom(13861,13862);
    quest::me("a minnow darts into the jar, or just darted past it!! The Knights of Truth do not tolerate people attempting to catch these fish!!");
  }
 plugin::return_items(\%itemcount); 
}