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
# items: 4488, 4495, 4496, 4497, 3684, 4489, 4498, 4499, 4506, 3685, 4490, 4507, 4508, 4509, 3686, 4491, 4510, 4511, 4512, 3687, 4492, 4513, 4514, 3688, 4493, 4584, 4585, 3689, 19441

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
    quest::summonitem(3684); # Item: Cap of Matter
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4489 => 1, 4498 => 1, 4499 => 1, 4506 => 1)) { #robe
    quest::summonitem(3685); # Item: Robe of Matter
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4490 => 1, 4507 => 1, 4508 => 1, 4509 => 1)) { #sleeves
    quest::summonitem(3686); # Item: Sleeves of Matter
    quest::exp(10000);
     }
 if (plugin::check_handin(\%itemcount, 4491 => 1, 4510 => 1, 4511 => 1, 4512 => 1)) { #pants
    quest::summonitem(3687); # Item: Pants of Matter
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4492 => 1, 4513 => 1, 4514 => 1)) { #shawl
    quest::summonitem(3688); # Item: Shawl of Matter
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4493 => 1, 4584 => 1, 4585 => 1)) { #bracer
    quest::summonitem(3689); # Item: Bracer of Matter
    quest::exp(10000);
     }
 if (plugin::check_handin(\%itemcount, 19441 => 1)) { #small pouch of riftseeker essence
	quest::emote("furrows his brow for a little bit as he mixes the powder in a small flask. 'This is most intriguing. There is nothing here that represents elemental magic as we understand it. These beings seem to use different means to channel their power. Let's see. . . Chaos represents fire, Order corresponds to Water, Air is channeled by Spirit, and. . . hmmm. . . Yes! There it is! Earth ties with Body. There you are, Chaos, Order, Spirit, and Body, those are the primal elements, and I suspect they are the key to unlocking the full potential of your new staff there. Which is quite nice if I do say so myself. If you find essences of the Primal elements you may want to speak with Bantil again. He should have some insight on how to complete your journey. Iilivina has been in Discord long enough, she may have some insight as to where these essences can be located.");
	quest::setglobal('mage_epic', 9, 5, 'F' );
 } 
  plugin::return_items(\%itemcount);
}

#END of FILE