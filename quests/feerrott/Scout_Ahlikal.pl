sub EVENT_SAY {
  if ($text=~/hail/i) {
  quest::say("It is a pleasure to meet you, but I do not have time to speak. I am waiting on official word from Shar Vahl. If you have been sent to assist me, please show me the Official Seal of the Khati Sha at this time. If you are not such a person, please carry on with your business and leave me to tend to mine.");
    }
    }
    
 sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9031 =>1 )) {
    quest::say("Well met, I'm glad that you made it! This jungle is oppressive, with its dank earth and dark canopy. The sooner you dispatch that spirit, the sooner we can both make our way out of this vile place. Move towards the ruins that lie about two hundred feet from here. The spirit will be there. Release it from its current form and return the totem to me. I will wrap it for you, so that you may place it in the container that you should have been given. Take care and be swift!");
    quest::spawn(47205,0,0,-2750,1065,-2);  
    quest::emote("A large yellow spider drifts down from the jungle canopy. Perhaps it senses the proximity of its next meal.");
      } 
      
      if (plugin::check_handin(\%itemcount, 9032 =>1 )) {
      quest::say("Amazing work, $name! We are all in your debt. I have wrapped the totem to prevent its harmful magic from affecting you. Please keep it in the box until you can return it to Elder Dumul. If you have not found the other spirits, please seek them out. If you have filled the container, please seal it and return to Shar Vahl. Here is your seal. May the spirits watch over you.");
      quest::summonitem(9033);
      quest::summonitem(9031);
        
      }
      plugin::return_items(\%itemcount);
 }