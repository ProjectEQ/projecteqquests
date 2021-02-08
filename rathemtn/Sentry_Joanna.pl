#########################################################
# Sentry Joanna
# Zone:  Rathe Mountains
# Quest: Gauntlets of Ro
# Author: Unknown
# Updated:  Andrew80k
#########################################################
# items: 12312, 12302
sub EVENT_SAY { 
   if($text=~/Hail/i){
      quest::say("Love and passion to you. my friend.  Seek you the [Gauntlets of Ro]?  If not. then I offer you the safety of this camp.");
   }
   if($text=~/gauntlets of ro/i){
      if ($faction <=4) {
         quest::say("I will give you the mold. but first you will complete a task in the name of Erollisi Marr.  My fellow Sentry. Alechin. was bitten by a wolf while he journeyed to Qeynos.  He now turns into a werewolf at night. forced to kill innocent travelers.  Go toward Qeynos.  Release him from life and his curse and return his locket to me.");
      } else {
         quest::say("Erollisi would not approve of our alliance. not yet at least.  Go to Freeport and serve the Temple of Marr.  When you can ask Gygus Remnara if you are an [honored member] and have him answer yes. then we can join forces."); 
      }
   }
}

sub EVENT_ITEM { 
   if(plugin::check_handin(\%itemcount,12312 => 1) && $faction <=4 ){
      quest::say("Thank you my friend.  It is good to see him free at last.  I shall miss him.  Here now is the mold of gauntlets as promised. Go and speak with Thomas for information about [Lord Searfire].");
      quest::summonitem("12302");
      quest::faction("281","1"); #Knights of Truth
      quest::faction("330","-1"); #Freeport Militia
      quest::faction("362","1"); #Priests of Marr
   }
   plugin::return_items(\%itemcount);
}


#END of FILE Zone:rathemtn  ID:50111 -- Sentry_Joanna
