# Quest for luclin smithing
# items: 29803, 29807, 29808, 29809

sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("You there. Have you seen the [poachers] out in the thicket? You best not be one of them!");
  }
  if($text=~/poachers/i) {
    quest::say("There has been an outbreak in the thicket of people hunting wild cats for their hides. Their hides!!! People profiting off of that which was never theirs, bringing pain to any that they may overrun with force. I can think of nothing else that turns my stomach so! A former Khala Dun named Ferin is out there heading up the initial investigation into the despicable actions. My apologies if I seemed a bit gruff, but I am not quite myself when discussing such matters as these.");
  }
}

sub EVENT_ITEM {
  # takes repair order from master Barkhem
  if (plugin::check_handin(\%itemcount,29803=>1)) {
    quest::say("Well it's about time Barkhem got around to us, and he couldn't even be bothered to come himself. Please get this back to me as soon as you can... you do know that we are here to guard the city, right?"); 
    quest::summonitem(29807); # Item: Jasir's Dented Shield
  } 
  # You receive Jasir's Dented Shield. Take the dented shield and place it into a forge with your Vah Shir Apprentice Mallet. This creates Jasir's Immaculate Shield (the mallet will be returned). Give this shield back to Jasir to receive Jasir's Work Order. 
  if (plugin::check_handin(\%itemcount,29808=>1)) {
    quest::say("Thank you very much $name, and I must apologize for the way I spoke to you earlier. We just got word of some [poachers] out in the Thicket, they really get me angry. In any case, you have done a fine job, worthy of Barkhem himself.");
    quest::summonitem(29809); # Item: Jasir's work order
  }
  
  # return unused items
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155294 -- Khala_Dun_Jasir