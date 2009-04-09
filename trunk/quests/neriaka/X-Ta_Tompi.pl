#############
#Quest Name: Necromancer Words - X`Ta Tompi
#Author: Blaz
#NPCs Involved: 1
#Items Involved: 16 = (12 quest turn in items, 4 rewards)
#################
sub EVENT_SAY { 
if($text=~/hail/i){
quest::say("We three are the [Sisters Dark] - [Necromancy] is our Art - Bonded dead, they serve our will - No beat of heart, yet faithful still.");
}

if($text=~/sisters dark/i){
quest::say("We three are the Sisters Dark - Keepers of the shadowed Dread - [Lore of Death]. we research now - Join with us and serve [the Dead].");
}

if($text=~/lore of death/i){
quest::say("The Lore of Death is shadow bound - Its [words] are [hid]. yet shall be found - Through our research into the dark - Old hexes found and parchment marked.");
}

if($text=~/the dead/i){
quest::say("The Dead are the shadowknights and necromancers of Neriak. They were formed by Queen Cristanos herself. Even among the Teir'Dal they are feared and they keep to themselves within the Lodge of the Dead in the Third Gate. I have heard they take orders only from the queen.");
}

if($text=~/necromancy/i){
quest::say("Necromancy - Art of the Dead - Binding bones to serve your will - We research now the [Lore of Death] - Ancient spells with power still."); 
}
if($text=~/hid/i){
quest::say("The Words are hid in tomes of old - Their yielded lore worth more than gold - Though we search both 'fore and 'hind - [Components] we can not yet find."); 
}
if($text=~/components/i){
quest::say("We need components for research - These are things that you could find - In return for [tasks] that you perform - Words of [reward] we have in mind."); 
}
if($text=~/tasks/i){
quest::say("Bring us components for our research - We give [Word]s by tasks performed - [Possession], [Detachment], [Allure], [Haunting], [Rupturing], [Dark Paths], [Suffering], [Collection], [Obligation], [Requisition] and [Acquisition]."); 
}
#same as 'tasks'
if($text=~/reward/i){
quest::say("Bring us components for our research - We give [Word]s by tasks performed - [Possession], [Detachment], [Allure], [Haunting], [Rupturing], [Dark Paths], [Suffering], [Collection], [Obligation], [Requisition] and [Acquisition]."); 
}
if($text=~/words of allure/i){
quest::say("From the Estate of Unrest, bring a Charred Pearl - From Castle Mistmoore, a wand charred - From a merchant bring a stone of blood and a ruby - Words of Allure will be your reward."); 
}
if($text=~/words of dark paths/i){
quest::say("From the Estate of Unrest, bring an globe of darkness - From Guk, an Eye of Urd - From a merchant bring a Star Rose Quartz - Then Words of Dark Paths will to you be given."); 
}
if($text=~/words of acquisition/i){
quest::say("From the Plane of Fear, bring Fetid Skin, Scare Straw and a Turmoil Wart - From a merchant bring a pearl - Then Words of Acquisition will to you be given."); 
}
if($text=~/words of obligation/i){
quest::say("From Guk, bring an Eye of Jin - From spectres, bring a Globe of Fear - From a merchant bring a jade stone - Then Words of Obligation will to you be given."); 
}
if($text=~/words of possession/i){
quest::say("The answer to that question is held by another - Ask again of my sister..."); 
}
if($text=~/words of detachment/i){
quest::say("The answer to that question is held by another - Ask again of my sister..."); 
}
if($text=~/words of rupturing/i){
quest::say("The answer to that question is held by another - Ask again of my sister..."); 
}
if($text=~/words of haunting/i){
quest::say("The answer to that question is held by another - Ask again of my sister..."); 
}
if($text=~/words of suffering/i){
quest::say("The answer to that question is held by another - Ask again of my sister..."); 
}
if($text=~/words of collection/i){
quest::say("The answer to that question is held by another - Ask again of my sister..."); 
}
if($text=~/words of requisition/i){
quest::say("The answer to that question is held by another - Ask again of my sister..."); 
}
}

sub EVENT_ITEM 
{
 #Words of Allure
 #Requires: 1 Charred Pearl, 1 Ruby, 1 A Wand (Charred Wood Wand?), 1 Bloodstone 
   if(plugin::check_handin(\%itemcount, 10083 => 1, 10035 => 1, 14160 => 1, 10019 => 1)){
   quest::say("You have quested well - With spell and sword - Accept our thanks - And this reward.");
   quest::summonitem(11829);
   # The Dead
   quest::faction("322","10");
   # Queen Cristanos Thex 
   quest::faction("268","10");
   # King Naythox Thex 
   quest::faction("177","-10");
   # Keepers of the Art 
   quest::faction("170","-10");
   # Eldritch Collective
   quest::faction("91","-10");
   # Primordial Malice
   quest::faction("260","-10");
   #Approx half a blue at level 31
   quest::exp(62000);

 }
  #Words of Dark Paths
  #Requires: 1 Sphere of Unrest, 1 Eye of Urd, 1 Star Rose Quartz 
   elsif(plugin::check_handin(\%itemcount, 10520 => 1, 10523 => 1, 10021 => 1)){
   quest::say("You have quested well - With spell and sword - Accept our thanks - And this reward.");
   quest::summonitem(11850);
   # The Dead
   quest::faction("322","10");
   # Queen Cristanos Thex 
   quest::faction("268","10");
   # King Naythox Thex 
   quest::faction("177","-10");
   # Keepers of the Art 
   quest::faction("170","-10");
   # Eldritch Collective
   quest::faction("91","-10");
   # Primordial Malice
   quest::faction("260","-10");
   #Approx half a blue at level 31
   quest::exp(62000);

 }
  #Words of Acquisition (Beza)
  #Requires: 1 Fetid Skin, 1 Scare Straw, 1 Turmoil Warts, 1 Pearl 
   elsif(plugin::check_handin(\%itemcount, 13150 => 1, 13152 => 1, 8331 => 1, 10024 => 1)){
   quest::say("You have quested well - With spell and sword - Accept our thanks - And this reward.");
   quest::summonitem(11866);
   # The Dead
   quest::faction("322","10");
   # Queen Cristanos Thex 
   quest::faction("268","10");
   # King Naythox Thex 
   quest::faction("177","-10");
   # Keepers of the Art 
   quest::faction("170","-10");
   # Eldritch Collective
   quest::faction("91","-10");
   # Primordial Malice
   quest::faction("260","-10");
   #Approx half a blue at level 31
   quest::exp(62000);
 }
   #Words of Obligation
   #Requires: 1 Globe of Fear, 1 Eye of Jin, 1 Jade 
   elsif(plugin::check_handin(\%itemcount, 10521 => 1, 10525 => 1, 10023 => 1)){
   quest::say("You have quested well - With spell and sword - Accept our thanks - And this reward.");
   quest::summonitem(11863);
   # The Dead
   quest::faction("322","10");
   # Queen Cristanos Thex 
   quest::faction("268","10");
   # King Naythox Thex 
   quest::faction("177","-10");
   # Keepers of the Art 
   quest::faction("170","-10");
   # Eldritch Collective
   quest::faction("91","-10");
   # Primordial Malice
   quest::faction("260","-10");
   #Approx half a blue at level 31
   quest::exp(62000);
 }
else{
  #do all other handins first with plugin
  plugin::return_items(\%itemcount);
  quest::say("Thanks, but I do not need this...");
}

}

#END of FILE Zone:neriaka -- X`Ta_Tompi