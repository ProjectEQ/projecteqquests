# Dark Knight's Armor

sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Why hello. I'm in charge of the fishing operations here on Jern's Isle.  [Fish] are my area of expertise.'");

}

if($text=~/what fish/i){

quest::say("We have fish come in here all the time. Sometimes we catch an [oddity] now and again.");

}

if($text=~/what oddity/i){

quest::say("Once we pulled up this ancient chest filled with this [dark plate armor].");

}

if($text=~/what dark plate armor/i){

quest::say("Looked the like kind of armor a dark knight would wear. if ya want it I'm sure we could arrange a [trade] of some sort.");

}

if($text=~/what trade/i){

quest::say("Since Trevor and I are the ones that found it we split it between ourselves. I have a [helm], [breastplate], [vambraces], [greaves], [pauldrons], [bracer], and [boots]. Ask Trevor about the rest of the armor.");

}

if($text=~/what breastplate/i){

quest::say("For the darkened knight's breastplate fetch me a cloud jewel. a mark of fear. a delicate glass sculpture. and a painted ornament.");

}

if($text=~/what vambracers/i){

quest::say("For the darkened knight's vambraces fetch me a sky jewel. a mark of terror. a runed ornamental mace. and an ancient tablet.");

}

if($text=~/what greaves/i){

quest::say("For the darkened knight's greaves fetch me a meteor jewel. a mark of dread. the King's Tome. and a polished ivory idol.");

}

if($text=~/what pauldrons/i){

quest::say("For the darkened knight's pauldrons fetch me an astral jewel. a mark of hatred. and an ancient petrified tulip.");

}

if($text=~/what bracer/i){

quest::say("For the darkened knight's bracer fetch me a sun jewel. a mark of intimidation. and a small rough marble figurine.");

}

if($text=~/what boots/i){

quest::say("For the darkened knight's boots fetch me a moon jewel. a mark of horror. and a fanged talisman.");

 }

}


sub EVENT_ITEM { 
# Darkened Knight's Boots
if (plugin::check_handin(\%itemcount, 4489 => 1,5871 => 1,5872 => 1)){ # moon jewel, a mark of horror, and a fanged talisman

quest::summonitem(3965); # Darkened Knight's Boots

}

# Darkened Knight's Bracer
elsif (plugin::check_handin(\%itemcount, 4488 => 1,5869 => 1,5870 => 1)){ # sun jewel, a mark of intimidation, and a small rough marble figurine

quest::summonitem(3964); # Darkened Knight's Bracer

}

# Darkened Knight's Breastplate
elsif (plugin::check_handin(\%itemcount, 4491 => 1,5857 => 1,5860 => 1,5859 => 1)){ # cloud jewel, a mark of fear, a delicate glass sculpture, and a painted ornament

quest::summonitem(3960); # Darkened Knight's Breastplate

}

# Darkened Knight's Greaves
elsif (plugin::check_handin(\%itemcount, 4494 => 1,5864 => 1,5865 => 1,5866 => 1)){ # meteor jewel, a mark of dread, the Kings Tome, and a polished ivory idol

quest::summonitem(3962); # Darkened Knight's Greaves

}

# Darkened Knight's Helm
elsif (plugin::check_handin(\%itemcount, 4490 => 1,5854 => 1,5855 => 1,5856 => 1)){ # star jewel, a mark of shadows, a primitive totem, and a golden spoon

quest::summonitem(3959); # Darkened Knight's Helm

}

# Darkened Knight's Mask
elsif (plugin::check_handin(\%itemcount, 4490 => 1,5873 => 1,5874 => 1)){ # star jewel, a mark of dark fate, and a crystalline idol

quest::summonitem(3966); # Darkened Knight's Mask

}

# Darkened Knight's Pauldrons
elsif (plugin::check_handin(\%itemcount, 4494 => 1,5867 => 1,5868 => 1)){ # astral jewel, a mark of hatred, and an ancient petrified tulip

quest::summonitem(3963); # Darkened Knight's Pauldrons

}

# Darkened Knight's Vambraces
elsif (plugin::check_handin(\%itemcount, 4492 => 1,5861 => 1,5862 => 1,5863 => 1)){ # sky jewel, a mark of terror, a runed ornamental mace, and an ancient tablet

quest::summonitem(3961); # Darkened Knight's Vambraces

}

}


#END of FILE Zone:twilight  ID:170137 -- Brodlan_Remdo.pl 


