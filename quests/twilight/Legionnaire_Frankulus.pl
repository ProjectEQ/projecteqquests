# warrior Twilight armor

sub EVENT_SAY { 

if($text=~/hail/i) {

quest::say("Another traveler to our fair city of Katta Castellum, you be careful now.");

}

if($text=~/what armor/i){

quest::say("Yes I am one of the keepers of the soldier's armor. The pieces I have are the helm, breastplate, vambraces, greaves, pauldrons, bracer, and boots. Eandalion keeps the other pieces just ask him about armor.");

}

if($text=~/what boots/i){

quest::say("For the boots you will have to bring to me a cloud jewel, a mark of the martial, and a hope ruby.");

}

if($text=~/what bracer/i){

quest::say("For the bracer you will have to bring to me a star jewel, a mark of the siege, and a blue egg.");

}

if($text=~/what breastplate/i){

quest::say("For the breastplate you will have to bring to me a meteor jewel, a mark of war, a weathered yew wand, and some dew of dawn.");

}

if($text=~/what greaves/i){

quest::say("For the greaves you will have to bring to me a sun jewel, a mark of archery, a golden torch, and a small meteor fragment.");

}

if($text=~/what helm/i){

quest::say("For the helm you will have to bring to me a sky jewel, a mark of battle, some petrified toes, and a fire blossom.");

}

if($text=~/what pauldrons/i){

quest::say("For the pauldrons you will have to bring to me a moon jewel, a mark of swordsmanship, and a water blossom."); 

}

if($text=~/vambraces/i){

quest::say("For the vambraces you will have to bring to me an astral jewel, a mark of arms, a small sponge, and a scorched rock.");


}

}


sub EVENT_ITEM {

  if (plugin::check_handin(\%itemcount, 4491 => 1, 5496 => 1, 5497 => 1)) { # cloud jewel, a mark of the martial, and a hope ruby

    quest::summonitem(3939); # boots 
	
}

  elsif (plugin::check_handin(\%itemcount, 4490 => 1, 5494 => 1, 5495 => 1)) { # star jewel, a mark of the siege, and a blue egg

    quest::summonitem(3938); # bracer

}


  elsif (plugin::check_handin(\%itemcount, 4493 => 1, 5483 => 1, 5484 => 1, 5485 => 1)) { # meteor jewel, a mark of war, a weathered yew wand, and some dew of dawn

    quest::summonitem(3934); # breastplate

}


  elsif (plugin::check_handin(\%itemcount, 4488 => 1, 5489 => 1, 5490 => 1, 5491 => 1)) { # sun jewel, a mark of archery, a golden torch, and a small meteor fragment

    quest::summonitem(3936); # Greaves

}


  elsif (plugin::check_handin(\%itemcount, 4492 => 1, 5480 => 1, 5481 => 1, 5482 => 1)) { # sky jewel, a mark of battle, some petrified toes, and a fire blossom

    quest::summonitem(3788); # helm

}


  elsif (plugin::check_handin(\%itemcount, 4489 => 1, 5492 => 1, 5493 => 1)) { # moon jewel, a mark of swordsmanship, and a water blossom

    quest::summonitem(3933); # pauldrons
}

  elsif (plugin::check_handin(\%itemcount, 4494 => 1, 5486 => 1, 5487 => 1, 5488 => 1)) { # astral jewel, a mark of arms, a small sponge, and a scorched rock

    quest::summonitem(3935); # Vambraces
}

  else{ 

    quest::say("I have no use for this.");

    plugin::return_items(\%itemcount);

    return 1;

}


}

#END of FILE zone:twilight ID:170136 -- Legionnaire_Frankulus.pl

