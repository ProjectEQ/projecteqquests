sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 31787 => 2)) {
    quest::summonitem(29879);  
  }
  if (plugin::check_handin(\%itemcount, 31788 => 2, 31966 => 2)) {
    quest::summonitem(29878); 
   }
  if (plugin::check_handin(\%itemcount, 31965 => 2)) {
    quest::summonitem(29876); 
   }
  if (plugin::check_handin(\%itemcount, 31968 => 2)) {
    quest::summonitem(29880); 
   }
  if (plugin::check_handin(\%itemcount, 31967 => 2)) {
    quest::summonitem(29877);
  quest::say("Oh, this is a fine piece of armor I made for ya!");
  quest::exp(25000);
  }
  plugin::return_items(\%itemcount);
}