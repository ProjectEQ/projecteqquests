#  Skyfall Seeker


sub EVENT_SAY {

   if($text=~/Hail/i) {

   quest::say("Hail, traveler! Would you have a moment? I'm in need of some [assistance].");

   }

   if($text=~/assistance/i) {

   quest::say("Thank you! I'll make it worth your while. I recently discovered the remains of an odd little map that may detail the distant Gulf of Gunthak. The map itself, however, is in a horrible state... a suspiciously horrible state if you ask me. Much of it is [missing].");

   }

   if($text=~/missing/i) {

   quest::say("The pirates of Broken Skull Rock have purposefully destroyed any accurate maps to protect the secrecy of their base. Three key parts are damaged. The compass notation, the legend and the coordinate label are all gone. Take this Cartography Binder. Use it to [collect] the fragments.");

   quest::summonitem("17710"); # Cartography Binder
   
   }

    if($text=~/collect/i) {

   quest::say("No doubt the pirates will have some of the fragments. Search Broken Skull Rock, paying careful attention to Gunthak and Dulak Harbor. An accurate map must be made. It is the first step in breaking the pirates' hold on the region. Good luck. The three pieces needed are A Coordinate Label, A Compass Notation, and A Map Legend.");
   }


}


sub EVENT_ITEM {

   if($itemcount{63005} == 1) { # Completed Cartography Binder 

   quest::say("Incredible! With a little work, I will be able to create a finished map of the Gulf of Gunthak. No longer will the pirates be able to keep their lair a secret. Thank you! Please take this as a reward for your efforts.");
   quest::exp("200");
   quest::ding();
   quest::summonitem("63048"); # Skyfall Seeker 
   }

}


#END of FILE Zone:freporte  ID:10115 -- Cartographer_Piri.pl


