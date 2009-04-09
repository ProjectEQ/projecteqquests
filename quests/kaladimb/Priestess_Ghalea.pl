#####################################################################
#  NPC:  Priestess Ghalea
#  Zone: North Kaladim
#  Quests: Multiple --> Soil of Underfoot
#  Author:  Unknown
#  Updated:  Andrew80k
#####################################################################
sub EVENT_SAY { 
   if($text=~/Hail/i){
      quest::say("Welcome to the Church of Underfoot.  Please open your soul to the greatness of Brell Serilis.  May he guide you in all your future endeavors. And may your soles long for the [Soil of Underfoot].");
   }
   if($text=~/soil of underfoot/i){
      if ($faction >=5 ) { # amiable or better to get quest.
         quest::say("The Clerics of Underfoot have yet to see your faith directed towards our wills.  Perhaps you should assist Master Gunlok Jure in the crusade against the undead.");
      } else { 
         quest::say("I can trust you with the soil of Underfoot, but first you must obtain four portions of fairy dust.  Return them to me and I shall mix it and pray over it. Then I shall give you a pouch of soil of Underfoot.");
      } 
   }
}
sub EVENT_ITEM { 
   if(plugin::check_handin(\%itemcount,18765=> 1)){
      quest::say("Welcome to the Underfoot Cathedral. I am High Priestess Ghalea. Here is your guild tunic. Now. let's get you started helping us spread the will of Brell.");
      quest::summonitem("13514");
      quest::faction(44,2); # Clerics of Underfoot
      quest::faction(169,2);
      quest::faction(219,2); 
   } elsif (plugin::check_handin(\%itemcount,12106=>4) && ($faction < 5)) {  # Fairy Dust -- NOT Fairy Princess Dust
      quest::say("May the mighty power of Brell saturate this soil with his divinity.  Here you are, my noble friend.  You may have a pouch of the soil of Underfoot.");
      quest::summonitem(12282);  # Soil of Underfoot
      quest::faction(44,2); # Clerics of Underfoot
      quest::faction(169,2); #Kazon Stormhammer
      quest::faction(219,2); #Miner's guild 249
   } else {
       quest::say("I do not need this, friend.");
       plugin::return_items(\%itemcount);
   }   
}
#END of FILE Zone:kaladimb  ID:67024 -- Priestess_Ghalea
