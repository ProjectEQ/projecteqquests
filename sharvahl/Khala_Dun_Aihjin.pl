
# Quest for luclin smithing

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Hello there. $name.  Careful around some of the rougher pubs late at night. wouldn't want to see you caught up in a fight like the last one I broke up.  Did you hear about it?"); 
  }
}

sub EVENT_ITEM {
  # takes repair order from master Barkhem
  if (plugin::check_handin(\%itemcount,29803=>1)) {
    quest::say("Well it's about time Barkhem got around to us, and he couldn't even be bothered to come himself. Please get this back to me as soon as you can... you do know that we are here to guard the city, right?"); 
    quest::summonitem(29810);
  } 
  # You receive Aihjin's Dented Shield. Take the dented shield and place it into a forge with your Vah Shir Apprentice Mallet. This creates Aihjin's Immaculate Shield (the mallet will be returned). Give this shield back to Jasir to receive Aihjin's Work Order. 
  if (plugin::check_handin(\%itemcount,29811=>1)) {
    quest::say("Well done, I sure will be ready for next time something tries to cause a disturbance in our city. My thanks to you $name."); 
    quest::summonitem(29812);
  }
  
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:sharvahl  ID:7047 -- Khala_Dun_Aihjin 

