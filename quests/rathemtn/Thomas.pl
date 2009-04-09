###############################################################
#  NPC:  Thomas
#  Zone:  Rathe Mtns
#  Quest:  Helm of Ro
#  Author:  Unknown
#  Updated:  Andrew80k
###############################################################
sub EVENT_SAY { 
   if($text=~/Hail/i){
      quest::say("Welcome to our camp.  We are paladins gathered from many lands. We have been called to this land by our deities.  Ours is a crusade of righteousness.  Have you happened upon us by chance or do you [seek the sacred molds]?");
   }
   if ($faction <= 4) {
      if($text=~/helm of ro/i){
         quest::say("To receive the mold of the Helm of Ro you must first demonstrate your strength.  Go to the plains of thunder.  There you shall hunt down the most vile creatures I have ever encountered.  Seek the undead cyclopes.  I have spied them in the most dangerous portions of my realm. Fetch me two of their skulls.");
      }
      if($text=~/seek the sacred molds/i){
         quest::say("Many of us carry the sacred molds of the holy paladin armor.  We will release it only to those who have proven themselves to each of our deities.  If you seek it, speak up!! Tell us which part you seek.  I carry the secret of the [Helm of Ro].  The others carry those of vambraces, breastplates, bracers, gauntlets, greaves and boots of Ro."); 
      }
      if($text=~/Lord Searfire/i) {
         quest::say("Lord Searfire is a great forge master.  He was called forth to the land of fire lakes.  It is said that he now toils in the name of Solusek Ro within a hidden temple of that land.  He and he alone knows how to obtain [ronium], a needed component for forging the sacred Armor of Ro.");
      }
      if($text=~/ronium/i) {
         quest::say("It is an alloy created from two rare metals.  Only [Lord Searfire] knows the formula.");
      }
   }
}
sub EVENT_ITEM { 
   if ($faction <= 4) {  # amiable or better to get mold
      if(plugin::check_handin(\%itemcount,12308 => 2)){
         quest::say("You have proven yourself to Karana.  I grant you the mold of the Ro Helm.  May the winds of Karana blow in your favor.  Now you must seek out [Lord Searfire] and  ask him for [ronium] to complete the second and only other component needed to be fashioned by a master blacksmith.");
         quest::summonitem("12298");
         quest::faction(183,2); #Knights of Thunder
         quest::faction(21,-3); #Bloodsabers
         quest::faction(257,3); #Priests of Life
         quest::faction(135,2); #Guards of Qeynos
      } elsif(plugin::check_handin(\%itemcount,12308 => 1)){
         quest::say("I called for two cyclops skulls.");
      }
   }
   plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
   plugin::return_items(\%itemcount);
}

#END of FILE Zone:rathemtn  ID:50112 -- Thomas

