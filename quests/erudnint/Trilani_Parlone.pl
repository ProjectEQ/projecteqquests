# Tunare Warden
# Missing The Mystic Cloak

sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Hail. good adventurer!  Do you bring word from my [husband]?");

}

if($text=~/husband/i){

quest::say("Tolkar is his name. My beloved husband. He still lives in Felwithe while I study here. It must be hard on him."); 

}

}
sub EVENT_ITEM { 

if (plugin::check_handin(\%itemcount, 1598 => 1)){ # Black Stone Candlestick

quest::say("I sense a great evil power in this candlestick. I will need you to concoct a divinatory aid for me before I can discern more. Take this suspension and brew it in a brew barrel with one white hellebore, a pouch of the red dust created by the Fire Peak Goblin Wizards, and the caustic substance used by the werebats in Unrest.");

quest::summonitem(1596); # Magical Suspension Fluid
}

if (plugin::check_handin(\%itemcount, 1597 => 1)){ # Divinatory Concoction 

quest::say("This is a powerful evil indeed. The smoke from special candles crafted by the Teir'Dal and burned in this candlestick allows the creation of undead of unordinary might. The Ghasts are only one of its many possible creations. I will concoct a powder for you to take back to Yeolarn that will assist in defeating the monstrosities the candle has produced. The candlestick itself will remain here within the High Tower of Erudin for the time being.");

quest::summonitem(1599); # Powder of Unanimation


}

  if(plugin::check_handin(\%itemcount, 1056 => 1)) { #Faded Cloak
    quest::say("This looks like that cloak Tolkar used to wear?! Where did you get this? He gave it to you? You rescued Linara! Oh my heaven's thank you! Here I will restore the cloaks original power. There you are just like new, may it serve you as well as it did my husband!");
    quest::summonitem(1057); #Mystic Cloak
    quest::faction(99,10);
    quest::faction(170,10);
    quest::faction(178,10);
    quest::faction(322,-30);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:erudnint  ID:23020 -- Trilani_Parlone.pl 

