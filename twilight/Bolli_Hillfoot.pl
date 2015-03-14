sub EVENT_SAY { 

if($text=~/what boots/i){

quest::say("If you want the Boots of Concealment go gather for me a meteor jewel, a mark of silence, and an engraved fire emerald statuette.");

}

if($text=~/what bracer/i){

quest::say("If you want the Bracer of Concealment go gather for me a sky jewel, a mark of cunning, and an engraved black diamond statuette.");

}

if($text=~/what tunic/i){

quest::say("If you want the Tunic of Concealment go gather for me a sun jewel, a mark of stealth, an engraved diamond statuette, and a tethered leash.");

}

if($text=~/what greaves/i){

quest::say("If you want the Greaves of Concealment go gather for me a star jewel, a mark of burglary, an engraved ruby statuette, and a small brass figurine.");

}

if($text=~/what deals/i){

quest::say("Ah $nameyou fancy yerself to be a rogue.  Well I can cut ya a deal on some armor if you be wantin' some.");

}

if($text=~/what coif/i){

quest::say("If you want the Coif of Concealment go gather for me an astral jewel, a mark of thievery, an engraved sapphire statuette, and a brass linked chain.");

}

if($text=~/what mantle/i){

quest::say("If you want the Mantle of Concealment go gather for me a cloud jewel, a mark of forgery, and an engraved star sapphire statuette."); 

}

if($text=~/vambraces/i){

quest::say("If you want the Vambraces of Concealment go gather for me a moon jewel, a mark of robbery, an engraved emerald statuette, and a half melted blade.");


}

}


sub EVENT_ITEM {

  if (plugin::check_handin(\%itemcount, 4493 => 1, 5285 => 1, 5286 => 1)) { # meteor jewel. a mark of silence. and an engraved fire emerald statuette

    quest::summonitem(3794); # boots 
	
}

  elsif (plugin::check_handin(\%itemcount, 4492 => 1, 5283 => 1, 5284 => 1)) { # sky jewel. a mark of cunning. and an engraved black diamond statuette

    quest::summonitem(3793); # bracer

}


  elsif (plugin::check_handin(\%itemcount, 4488 => 1, 5296 => 1,5273 => 1, 5274 => 1)) { # sun jewel. a mark of stealth. an engraved diamond statuette. and a tethered leash.

    quest::summonitem(3789); # tunic

}


  elsif (plugin::check_handin(\%itemcount, 4490 => 1, 5278 => 1, 5279 => 1, 5280 => 1)) { # star jewel. a mark of burglary. an engraved ruby statuette. and a small brass figurine

    quest::summonitem(3791); # Greaves

}


  elsif (plugin::check_handin(\%itemcount, 4494 => 1, 5269 => 1, 5270 => 1, 5271 => 1)) { # astral jewel. a mark of thievery. an engraved sapphire statuette. and a brass linked chain

    quest::summonitem(3788); # Coif

}


  elsif (plugin::check_handin(\%itemcount, 4492 => 1, 5281 => 1, 5282 => 1)) { # cloud jewel. a mark of forgery. and an engraved star sapphire statuette

    quest::summonitem(3792); # mantle
}

  elsif (plugin::check_handin(\%itemcount, 4489 => 1, 5275 => 1, 5276 => 1, 5277 => 1)) { # moon jewel, a mark of robbery, an engraved emerald statuette, and a half melted blade

    quest::summonitem(3790); # Vambraces
}

    plugin::return_items(\%itemcount);


}

#END of FILE Zone:twilight  ID:170144 -- Bolli_Hillfoot.pl 

