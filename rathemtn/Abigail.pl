###############################################################
#  NPC:  Abigail
#  Zone:  Rathe Mtns
#  Quest:  Breastplate of Ro
#  Author:  Unknown
#  Updated:  Andrew80k
###############################################################
sub EVENT_SAY { 
   if($text=~/Hail/i){
      quest::say("Greetings!  I am the holder of the secret of the [Breastplate of Ro].  You may rest here.  You are quite safe within this camp of paladins.");
   }
   if($text=~/breastplate of ro/i){
      if($faction <= 4) { # requires amiable
         quest::say("The Breastplate of Ro mold will be awarded to you.  First, you will perform a test of strength.  Go to Faydwer.  There you shall seek out and destroy the Teir'Dal who carry the dark cauldrons!!  They have been venturing into our lands and capturing many Koada'Dal and Fier'Dal for cooking purposes!  Bring to me two of their dark cauldrons.");
      } else {
         quest::say("You need to prove your loyalty to my temple.  Go to Felwithe and seek out the Clerics of Tunare.  Prove to them your faith.  Then ask the leader of this church if you are a [honored member]."); 
      }
   }
}
sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount,12309=>2) && $faction <=4) { # A Dark Cauldron
      quest::say("You have earned the mold.  You will now need go and speak with Thomas about [Lord Searfire].");
      quest::summonitem(12299); # Mold of Ro Breastplate 
      quest::faction("43","1");  # Clerics of Tunare
      quest::faction("178","1"); # King Tearis Thex
      quest::faction("8","1"); # Anti-Mage
   } elsif (plugin::check_handin(\%itemcount,12309=>1) && $faction <=4 ) {
      quest::say("I instructed you to return with no less than two dark pots.");
   }
   plugin::return_items(\%itemcount); 
}
#END of FILE Zone:rathemtn  ID:50113 -- Abigail