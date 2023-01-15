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
# items: 4492, 4777, 4778, 3730, 4493, 4779, 4781, 4782, 3731, 4494, 4783, 4784, 3732, 4488, 4785, 4786, 3733, 4489, 4787, 4788, 4789, 3734, 4490, 4790, 4791, 4792, 3735

sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::emote("smiles briefly. ''Greetings to ye. If you be needin' the goods Ive got 'em.'");
 }
 if($text =~ /armor/i) {
	quest::say("Ah yes, I've been trying to get rid of this armor for some time. Do you happen to be a necromancer?");
 }
 if($text =~ /I am a necromancer/i) {
	quest::say("Very good! I have the veil, cloak, gloves, choker, belt, and staff. Which do you want?");
 }
 if($text =~ /veil/i) {
	quest::say("For the veil of pestilence you will have to go retrieve for me a sky jewel, a jeweled rod, and a bronze brazier.");
 }
 if($text =~ /cloak/i) {
	quest::say("For the cloak of pestilence you will have to go retrieve for me a meteor jewel, a hardened agate, a veiled lantern, and a white garnet.");
 }
 if($text =~ /gloves/i) {
	quest::say("For the gloves of pestilence you will have to go retrieve for me an astral jewel, an antique lantern, and a glowing meteor fragment.");
 }
 if($text =~ /choker/i) {
	quest::say("For the choker of pestilence you will have to go retrieve for me a sun jewel, an ancient relic of Tzon, and a fluorescent gem.");
 }
 if($text =~ /belt/i) {
	quest::say("For the belt of pestilence you will have to go retrieve for me a moon jewel, an ancestral statuette, some dark hued wood, and an ocher gem.");
 }
 if($text =~ /staff/i) {
	quest::say("For the staff of pestilence you will have to go retrieve for me a star jewel, some cultured spirits, some golden mushrooms, and a gem of awe.");
 }
}

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 4492 => 1, 4777 => 1, 4778 => 1)) { #veil
    quest::summonitem(3730); # Item: Veil of Pestilence
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4493 => 1, 4779 => 1, 4781 => 1, 4782 => 1)) { #cloak
    quest::summonitem(3731); # Item: Cape of Pestilence
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4494 => 1, 4783 => 1, 4784 => 1)) { #gloves
    quest::summonitem(3732); # Item: Gloves of Pestilence
    quest::exp(10000);
     }
 if (plugin::check_handin(\%itemcount, 4488 => 1, 4785 => 1, 4786 => 1)) { #choker
    quest::summonitem(3733); # Item: Choker of Pestilence
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4489 => 1, 4787 => 1, 4788 => 1, 4789 => 1)) { #belt
    quest::summonitem(3734); # Item: Belt of Pestilence
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4490 => 1, 4790 => 1, 4791 => 1, 4792 => 1)) { #staff
    quest::summonitem(3735); # Item: Staff of Pestilence
    quest::exp(10000);
     } 
    plugin::return_items(\%itemcount);
}

#END of FILE