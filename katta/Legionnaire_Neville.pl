#Zone Katta   Legionnaire_Neville  ID  160263
# items: 31772

sub EVENT_SAY  {

if($text=~/Hail/i){
   quest::emote("coughs a bit and looks up at you with tired, bleary eyes,");
   quest::say("Ugh, I have not had such a cold as this since I was a boy. I have heard of a
[tea-maker] in the city of the Vah Shir that makes a stamina enhancing tea. I would like to try
some and see if it might help.");
}

if($text=~/tea maker/i){
   quest::say("ACHOO! Excuse me. It was some kind of root tea... saucy greyroot... sparkly
 greenroot... something like that I think. The brewer's name was... Adam... Lama... Oh I just cannot
 think straight.");
}
}

sub EVENT_ITEM {




if(plugin::check_handin(\%itemcount,31772=>1)){
   quest::say("Thanks! $name, I hope this does the trick.");
   quest::ding();
   quest::exp(2000);
   quest::faction(1503, 10); # Faction: Validus Custodus
   quest::faction(1502, 10); # Faction: Katta Castellum Citizens
   quest::faction(1504, 10); # Faction: Magus Conlegium
   quest::faction(1506, -10); # Faction: Coterie of the Eternal Night
   quest::faction(1485, -10); # Faction: Eye of Seru
   quest::faction(1541, -10); # Faction: Hand Legionnaries
   quest::faction(1484, -10); # Faction: Hand of Seru
   quest::faction(316, -10); # Faction: Tunare's Scouts
   quest::faction(1505, -10); # Faction: Nathyn Illuminious
}
}

#endoffile  Katta  Legionnaire_Neville  ID  160263 
