#Boiron_Ston.pl
#Willamina's Needles


sub EVENT_SAY {
	if($text=~/Hail/i) {
    quest::say("Welcome to New Tanaan. traveler.  The practice of smithing is a time-honored tradition for my people.  My particular specialty is craftsmanship of plate armor for the larger races of Norrath.  Feel free to search my stock for anything you might need to help aid your pursuit of this skill.");
  }
  if($text=~/like elisha dirtyshoes/i) {
    quest::say("Aye, she's a pretty lass. And I am aware of her feelings toward me. I haven't had the courage to approach her though. My family standard has recently disappeared, and no dwarf is the same when their standard is in jeopardy. Seek out Caden Zharik and demand my standard back, I believe he may have lifted it from me.");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28085 => 1)) {#Boiron's Standard
    quest::emote("seems to perk up. 'Ah, 'tis a beauty, is it not? I thank you for its safe return. Perhaps I shall go and visit Elisha after all. Please take this letter to her, so she may be ready for me when I arrive.'");
    quest::summonitem(28086);#Letter to Elisha
    quest::exp(250);
  }

   plugin::return_items(\%itemcount);
 
    
}#END of FILE Zone:poknowledge  ID:202086 -- Boiron_Ston 

