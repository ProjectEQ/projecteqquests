sub EVENT_SAY {
  if ($text=~/hail/i) {
  quest::say("It is a pleasure to meet you, but I do not have time to speak. I am waiting on official word from Shar Vahl. If you have been sent to assist me, please show me the Official Seal of the Khati Sha at this time. If you are not such a person, please carry on with your business and leave me to tend to mine.");
    
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9031 =>1 )) {
    quest::say("Thank you for coming. I am surprised that you were able to find me. I barely know where I am at this point. I followed the vile beast that has been corrupting the spirits, but he eluded me after I followed him to that ridge up there. Fortunately, the spirit that you seek has remained at the site of its transformation. Use levitation to work your way up the falls and return to me with the totem that you will acquire from releasing the spirit.");
    quest::spawn(100220,0,0,-3711,3325,1340);  
    quest::emote("Something glows brightly from high above the falls.");
      }
      
      if (plugin::check_handin(\%itemcount, 9040 =>1 )) {
        quest::say("Great work, friend. Take this totem and place it in the case that you were given in Shar Vahl. Do not unwrap the totem and be quick in your pursuit of the others. Once you have all of the totems, please seal the case and return it to Shar Vahl. I can only hope that you will get to all of the spirits in time. Take care, friend.");
        quest::summonitem(9031);
        quest::summonitem(9041);
      }
      plugin::return_items(\%itemcount);
}