# Animal Skin Armor
# Cougarskin sleeves
# Cougarskin Boots
# Cougarskin Mask
# Direwolf Fur Cloak
# Direwolf Fur Mask
# Created by Gonner


sub EVENT_SAY {

if($text=~/hail/i){

quest::emote("works at skinning and cleaning the raw furs around him."); 
}

if($text=~/what armor/i){

quest::say("Many armors.  All of animal hides from the islands.  If you wanting armor then I can make for you.  All I ask is you do me favor."); 
}

if($text=~/what favor/i){

quest::say("Snowfangs in need of much help lately.  Once we mighty but now weak.  You help us get stronger.  If you want armor of wolves or cougar then I need you bring twice as many materials.  For each thing you wanting I need thing.  Just tell me what furs you have and I tell you what I need."); 
}

if($text=~/medium quality dire wolf fur/i){ 

quest::say("Good wolf fur I make you cloak.  All it take for cloak is fur and skinning rock.  I need two skinning rock though.  I very low on rocks."); 

}

if($text=~/low quality dire wolf fur/i){  

quest::say("Bad fur I make into cap for head.  Keep your small furless skull warm.  You bring me two bark bindings for that.  Bindings for sewing."); 
}

#if($text=~/low quality cougarskin/i){ # Cougarskin Sleeves - Not in DB yet.

#quest::say("More cat skin. You bring more meat but this time bring fatty walrus meat.  Many gnolls need for winter fat.  Keeps gnolls healthy."); 
#}

if($text=~/medium quality cougarskin/i){ 

quest::say("Grrrrr.  More cat.  All I need for this is cutting shells.  We not get them much but I need."); 
}

if($text=~/high quality cougarskin/i){

quest::say("I not like making things of cat fur.  Smells bad, hurts nose.  You want me to work with that you bring food, lots of food.  You bring me mammoth meats."); 

}
}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 30064 => 1, 30065 => 2)) { # Medium Quality Cougarskin,  Cutting Shells
quest::emote("works with the fur for awhile by skinning it and sewing it"); 
quest::summonitem(30020); # Cougarskin Boots
}

if (plugin::check_handin(\%itemcount, 30030 => 1, 13407 => 2)) { # High Quality CougarSkin, Mammoth Meat
quest::emote("works with the fur for awhile by skinning it and sewing it"); 
quest::summonitem(30027); # Cougarskin mask
}

#if (plugin::check_handin(\%itemcount, 30031 => 1, 30097 => 2)) { # low Quality CougarSkin, Fatty Walrus Meat
#quest::emote("works with the fur for awhile by skinning it and sewing it"); 
#quest::summonitem(); # Cougarskin Sleeves - Not In DB yet
#}

if (plugin::check_handin(\%itemcount, 30025 => 1, 30062 => 2)) { # Medium Quality Dire wolf fur, Skinning Rock
quest::emote("works with the fur for awhile by skinning it and sewing it"); 
quest::summonitem(25019); # Dire wolf-hide Cloak
}

if (plugin::check_handin(\%itemcount, 30023 => 1, 30063 => 2)) { # High Quality Dire wolf fur, Bark Bindings
quest::emote("works with the fur for awhile by skinning it and sewing it"); 
quest::summonitem(30029); # Dire wolf-hide hood
}
}


#END of FILE zone:iceclad ID:110010 -- Ergrez_Shortpaw.pl