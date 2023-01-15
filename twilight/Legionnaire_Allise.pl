###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Legionnaire Allise
## ID: 170131
## ZONE: twilight
##
############################################
# items: 4488, 5254, 5255, 3782, 4489, 5256, 5257, 5258, 3783, 4490, 5529, 5260, 3784, 4491, 5261, 5262, 3785, 4492, 5263, 5264, 5266, 3786, 4493, 5265, 5267, 5268, 3787

sub EVENT_SAY {
 if($text =~ /armor/i) {
	quest::say("Valana must have sent you here. Tell me are you a monk?");
 }
 if($text =~ /i am a monk/i) {
	quest::say("Good the pieces I have are the veil, cloak, hand wraps, choker, belt, and a bo stick.");
 }
 if($text =~ /veil/i) {
	quest::say("To receive the veil you must retrieve for me a sun jewel, a mark of discipline, and some oiled scales.");
 }
 if($text =~ /cloak/i) {
	quest::say("To receive the cloak you must retrieve for me a moon jewel, a mark of training, a scorched idol, and a gem of longevity.");
 }
 if($text =~ /hand wraps/i) {
	quest::say("To receive the hand wraps you must retrieve for me a star jewel, a mark of rank, and a golden gem.");
 }
 if($text =~ /choker/i) {
	quest::say("To receive the choker you must retrieve for me a cloud jewel, a mark of aggression, and some sun fiend bones.");
 }
 if($text =~ /belt/i) {
	quest::say("To receive the belt you must retrieve for me a sky jewel, a mark of defense, a protector gem, and an indigo sapphire.");
 }
 if($text =~ /bo stick/i) {
	quest::say("To receive the bo stick you must retrieve for me a meteor jewel, a mark of the dragon, an embedded gravel tablet, and a gilded wrist chain.");
 }
}

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 4488 => 1, 5254 => 1, 5255 => 1)) { #veil
    quest::summonitem(3782); # Item: Steel Threaded Veil
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4489 => 1, 5256 => 1, 5257 => 1, 5258 => 1)) { #cloak
    quest::summonitem(3783); # Item: Steel Threaded Cloak
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4490 => 1, 5529 => 1, 5260 => 1)) { #hand wraps
    quest::summonitem(3784); # Item: Steel Threaded Hand Wraps
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4491 => 1, 5261 => 1, 5262 => 1)) { #choker
    quest::summonitem(3785); # Item: Steel Threaded Choker
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4492 => 1, 5263 => 1, 5264 => 1, 5266 => 1)) { #belt
    quest::summonitem(3786); # Item: Steel Threaded Belt
    quest::exp(10000);
     } 
 if (plugin::check_handin(\%itemcount, 4493 => 1, 5265 => 1, 5267 => 1, 5268 => 1)) { #bo stick
    quest::summonitem(3787); # Item: Steel Tipped Bo Stick
    quest::exp(10000);
     } 
     plugin::return_items(\%itemcount);
}

#END of FILE