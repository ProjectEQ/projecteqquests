# items: 4492, 4850, 4858, 4859, 3744, 4493, 4860, 4868, 3745, 4488, 4878, 4879, 4880, 3747, 4489, 4888, 4889, 4890, 3748, 4491, 4848, 4849, 3743, 4494, 4869, 4870, 3746
sub EVENT_SAY {
 if ($text=~/Hail/i) {
        quest::say("You must have been speaking to Derron, a mightier cleric ye couldnt find. Except for Donal the Wise of course. So tell me are ye also a cleric like Derron?");
 }
 if($text =~ /I am a cleric/i) {
	quest::say("Ah then you must want the mask, cloak, gauntlets, talisman, girdle, and hammer that I be holdin'.");
 }
 if($text =~ /cloak/i) {
	quest::say("To get the cloak you must bring me a sky jewel, a mark of credence, a light etched fire opal, and a polished stone statuette.");
 }
 if($text =~ /gauntlets/i) {
	quest::say("To get the gauntlets you must bring me a meteor jewel, a mark of piety, and a light etched opal.");
 }
 if($text =~ /girdle/i) {
	quest::say("To get the girdle you must bring me a sun jewel, a mark of grace, a light etched diamond, and a dark eyed iris.");
 }
 if($text =~ /hammer/i) {
	quest::say("To get the hammer you must bring me a moon jewel, a mark of salvation, a light etched emerald, and the writ of distance.");
 }
 if($text =~ /mask/i) {
	quest::say("To get the mask you must bring me a cloud jewel, a mark of hope, and a light etched star ruby.");
 }
 if($text =~ /talisman/i) {
	quest::say("To get the talisman you must bring me an astral jewel, a mark of affirmation, and a light etched peridot.");
 }
}



sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 4492 => 1, 4850 => 1, 4858 => 1, 4859 => 1)) { #cloak
     quest::summonitem(3744); # Item: Cloak of the Holy Rite
     quest::exp(10000);    
  }
   if (plugin::check_handin(\%itemcount, 4493 => 1, 4860 => 1, 4868 => 1)) { #gaunts
     quest::summonitem(3745); # Item: Gauntlets of the Holy Rite
     quest::exp(10000);    
  }
   if (plugin::check_handin(\%itemcount, 4488 => 1, 4878 => 1, 4879 => 1, 4880 => 1)) { #girdle
     quest::summonitem(3747); # Item: Girdle of the Holy Rite
     quest::exp(10000);    
  }
   if (plugin::check_handin(\%itemcount, 4489 => 1, 4888 => 1, 4889 => 1, 4890 => 1)) { #hammer
     quest::summonitem(3748); # Item: Grand Hammer of the Holy Rite
     quest::exp(10000);    
  }
   if (plugin::check_handin(\%itemcount, 4491 => 1, 4848 => 1, 4849 => 1)) { #mask
     quest::summonitem(3743); # Item: Mask of the Holy Rite
     quest::exp(10000);    
  }
   if (plugin::check_handin(\%itemcount, 4494 => 1, 4869 => 1, 4870 => 1)) { #talisman
     quest::summonitem(3746); # Item: Talisman of the Holy Rite
     quest::exp(10000);    
  }
  plugin::return_items(\%itemcount);
} 
