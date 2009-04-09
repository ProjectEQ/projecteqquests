###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Vornal Transon 
## ID: 170124
## ZONE: twilight
##
############################################

sub EVENT_SAY {
 if($text =~ /hail/i) {
	quest::emote("pauses for a second staring off into the distance. 'Ah welcome friend. I am Vornol, a summoner of sorts, and master of this tower.'");
	quest::say("Most excellent what I have is some armor, if you will do few errands for me it is yours. The pieces I have are the cap, robe, sleeves, pants, shawl, and bracer. My apprentice, the lady Galdara, has the rest. Just ask her about armor and she will tell you what you need to do.");
 }
 if($text =~ /cap/i) {
	quest::say("For the cap you will have to bring back to me a sun jewel, a fire idol, a fire marked scroll and a runed ring of fire.");
 }
 if($text =~ /robe/i) {
	quest::say("For the robe you will have to bring back to me a moon jewel, a vial of purified fire, a vial of purified water, and a vial of purified air.");
 }
 if($text =~ /sleeves/i) {
	quest::say("For the sleeves you will have to bring back to me a star jewel, an air idol, an air marked scroll and a runed ring of air.");
 }
 if($text =~ /pants/i) {
	quest::say("For the pants you will have to bring back to me a cloud jewel, an earth idol, an earth marked scroll, and a runed ring of earth.");
 }
 if($text =~ /shawl/i) {
	quest::say("For the shawl you will have to bring back to me a sky jewel, a talisman of burning earth, and a vial of purified earth.");
 }
 if($text =~ /bracer/i) {
	quest::say("For the bracer you will have to bring back to me a meteor jewel, talisman of moisture, and a vial of aqua waters.");
 }
}



sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 4488 => 1, 4495 => 1, 4496 => 1, 4497 => 1)) { #cap
    quest::summonitem(3684);
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4489 => 1, 4498 => 1, 4499 => 1, 4506 => 1)) { #robe
    quest::summonitem(3685);
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4490 => 1, 4507 => 1, 4508 => 1, 4509 => 1)) { #sleeves
    quest::summonitem(3686);
    quest::exp(10000);
     }
 if (plugin::check_handin(\%itemcount, 4491 => 1, 4510 => 1, 4511 => 1, 4512 => 1)) { #pants
    quest::summonitem(3687);
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4492 => 1, 4513 => 1, 4514 => 1)) { #shawl
    quest::summonitem(3688);
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4493 => 1, 4584 => 1, 4585 => 1)) { #bracer
    quest::summonitem(3689);
    quest::exp(10000);
     } 
 else{
     plugin::return_items(\%itemcount);
    }
}

#END of FILE