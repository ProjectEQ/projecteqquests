####################################
# NPC:  #Gash Flockwalker.pl
# zone: qeynos
# Quest: Nitrates and the Assassin
# Author:  Andrew80k
####################################
sub EVENT_SPAWN {
   quest::signal(1138);
}
sub EVENT_SAY { 

   if($text=~/Hail/i){

       quest::say("Good day to you. Your city of stone walls is quite magnificent. Still, the glory of Surefall Glade puts this city to shame."); 
   }
   if ($text=~/an assassin has been sent to kill you/) {
       quest::say("What!!?  Must be an Unkempt Druid Assassin nearby!!  Find him and slay him.  I am sure he stands to make a FORTUNE!  I believe the assassin may be carrying some sort of [black wood chip].");
       quest::spawn2(1179,0,0,-100,222,2.3,127.1);
   }
   if ($text=~/black wood chip/i){
       quest::say("That is the mark of an Unkempt Druid.  Long ago there was a tree in Norrath we called the Great Tunarbos.  Legend says it spawned all the woodlands of Norrath.  Many centuries ago, long before the Combine Era, the Great Tunarbos was burned to the ground by unknown means.  The ancient rangers kept what little of the great tree they could find.  To make it short, all Unkempt Druids now carry burned wood chips to represent the great tree.  They are not real.  Take any black wood chips to Gerael Woodone in Surefall Glade.");
       quest::spawn2(1138,39,0,-86.88,368.88,3.4,75.5);
       quest::depop();
   }
}

#END of FILE Zone:qeynos  ID:1138 -- Gash_Flockwalker