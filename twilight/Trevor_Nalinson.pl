# Dark Knight's Armor
# items: 4488, 5875, 5876, 5877, 3967, 4493, 5880, 5881, 3969, 4492, 5878, 5879, 3968, 4494, 5882, 5883, 5884, 3970, 5885, 5886, 5887, 3971

sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Can't ya see I'm busy working.  Leave me be."); 

}

if($text=~/what armor/i){

quest::say("Bah, Brodlan should know better than opening his big mouth. Anyway this looks like armor for a dark knight if ye want to trade for it.");

}

if($text=~/what trade/i){

quest::say("Good ya want to trade. I have the mask, cloak, gauntlets, gorget, girdle, and mace. Just tell me what piece you want to trade for and Ill tell ya what I want.")

}

if($text=~/cloak/i){

quest::say("For the darkened knight's cloak you'll have to bring me a cloud jewel, a mark of twisted souls, a chilled brazier, and a gem of blue skies.");

}
 
if($text=~/gauntlets/i){

quest::say("For the darkened knight's gauntlets you'll have bring me a sky jewel, a mark of fright, and a true silver idol");

}

if($text=~/girdle/i){

quest::say("For the darkened knight's girdle you'll have to bring me an astral jewel, a mark of gloom, some gilded beads, and an etched tablet.");

}

if($text=~/girdle/i){

quest::say("For the darkened knigh's gorget you'll have to bring me a meteor jewel, a mark of darkness, a runed stone brazier.");

}

if($text=~/mace/i){

quest::say("For the darkened knight's mace you'll have to bring me a sun jewel, a mark of night, a beaded circlet, and a heating stone.");

}

}

sub EVENT_ITEM {

# Darkened Knight's Cloak
if (plugin::check_handin(\%itemcount, 4488 => 1,5875 => 1,5876 => 1,5877 => 1)){ # cloud jewel, a mark of twisted souls, a chilled brazier, and a gem of blue skies

quest::summonitem(3967); # Darkened Knight's Cloak

}

# Darkened Knight's Gorget
elsif (plugin::check_handin(\%itemcount, 4493 => 1,5880 => 1,5881 => 1)){ # meteor jewel, a mark of darkness, a runed stone brazier

quest::summonitem(3969); # Darkened Knight's Gorget

}
# Darkened Knight's Guantlets
elsif (plugin::check_handin(\%itemcount, 4492 => 1,5878 => 1,5879 => 1)){ # sky jewel, a mark of fright, and a true silver idol

quest::summonitem(3968); # Darkened Knight's Guantlets

}

# Darkened Knight's Girdle
elsif (plugin::check_handin(\%itemcount, 4494 => 1,5882 => 1,5883 => 1,5884 => 1)){ # astral jewel, a mark of gloom, some gilded beads, and an etched tablet

quest::summonitem(3970); # Darkened Knight's Girdle

}

# Darkened Knight's Mace
elsif (plugin::check_handin(\%itemcount, 4488 => 1,5885 => 1,5886 => 1,5887 => 1)){ # sun jewel, a mark of night, a beaded circlet, and a heating stone

quest::summonitem(3971); # Darkened Knight's Mace

}

}

#END of FILE Zone:twilight  ID:170139 -- Trevor_Nalinson.pl


