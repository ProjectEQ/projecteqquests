###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Valana Broms
## ID: 170125
## ZONE: twilight
##
############################################


sub EVENT_SAY {
 if($text =~ /hail/i) {
	quest::say("'The armor that I have to reward you is a headband, gi, arm wraps, leggings, shawl, wrist wraps, and sandals. My friend and guard Allise has the rest if you wish to speak with her, just ask about armor.");
 } # This hail text is current coppied from the mage version of twilight armor as i could not find the monk hail texts
 if($text =~ /headband/i) {
	quest::say("For the headband you must retrieve for me a sun jewel, a mark of peace, an oblong clay bowl, and a great gem.");
 }
 if($text =~ /gi/i) {
	quest::say("For the gi you must retrieve for me a moon jewel, a mark of tranquility, sharpened rock hopper claws, and some etched steel shavings.");
 }
 if($text =~ /arm wraps/i) {
	quest::say("For the arm wraps you must retrieve for me a star jewel, a mark of harmony, a triple beaded circlet, and some fresh spring water.");
 }
 if($text =~ /leggings/i) {
	quest::say("For the leggings you must retrieve for me a cloud jewel, a mark of meditation, Ralcom's Writ, and a jar of ointment.");
 }
 if($text =~ /shawl/i) {
	quest::say("For the shawl you must retrieve for me a sky jewel, a mark of unity and a pewter figurine.");
 }
 if($text =~ /wrist wraps/i) {
	quest::say("For the wrist wraps you must retrieve for me a meteor jewel, a mark of true self, and a coiled steel wire.");
 }
 if($text =~ /sandals/i) {
	quest::say("For the sandals you must retrieve for me an astral jewel, a mark of form, and some spire spirit dust.");
 }
}



sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 5194 => 1, 5192 => 1, 5193 => 1, 4488 => 1)) { #headband
    quest::summonitem(3775);
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 5197 => 1, 5195 => 1, 4489 => 1, 5196 => 1)) { #gi
    quest::summonitem(3776);
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 5244 => 1, 5198 => 1, 4490 => 1, 5199 => 1)) { #arm wraps
    quest::summonitem(3777);
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4491 => 1, 5247 => 1, 5245 => 1, 5246 => 1)) { #leggings
    quest::summonitem(3778);
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 5248 => 1, 5249 => 1, 4492 => 1)) { #shawl
    quest::summonitem(3779);
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 5251 => 1, 5250 => 1, 4493 => 1)) { #wrist wraps
    quest::summonitem(3780);
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4494 => 1, 5252 => 1, 5253 => 1)) { #sandals
    quest::summonitem(3781);
    quest::exp(10000);
     } 
  plugin::return_items(\%itemcount);
}


#END of FILE