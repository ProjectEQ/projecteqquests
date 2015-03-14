sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 3872 => 1)){ # note from kellari
    quest::say("Of all of the horrid coincidences! Colian just walked by me a few moments ago!  She was heading to the Northeast.  Please run and catch her.  Do not let her escape!  I will go and notify the authorities. Take her back to Governor Unja, if you capture her before help arrives. Good luck!");
    quest::ding();
	quest::spawn2(172159,516093,0,820,743,-61,201);  
    quest::exp(1000);
	quest::depop_withtimer();
  }
  plugin::return_items(\%itemcount);
}  