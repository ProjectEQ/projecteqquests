# Quest for luclin smithing


sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Welcome to North Gate side of the Merchant's Corridor."); 
  }
}

sub EVENT_ITEM {
  # takes repair order from master Barkhem
  if (plugin::check_handin(\%itemcount,29803=>1)) {
    quest::say("Well it's about time Barkhem got around to us, and he couldn't even be bothered to come himself. Please get this back to me as soon as you can... you do know that we are here to guard the city, right?"); 
    quest::summonitem(29807);
  } 
  # You receive Jasir's Dented Shield. Take the dented shield and place it into a forge with your Vah Shir Apprentice Mallet. This creates Jasir's Immaculate Shield (the mallet will be returned). Give this shield back to Jasir to receive Jasir's Work Order. 
  if (plugin::check_handin(\%itemcount,29808=>1)) {
    quest::say("Thank you very much $name, and I must apologize for the way I spoke to you earlier. We just got word of some [poachers] out in the Thicket, they really get me angry. In any case, you have done a fine job, worthy of Barkhem himself.");
    quest::summonitem(29809); 
  }
  
  # return unused items
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:sharvahl  ID:155294 -- Khala_Dun_Jasir

