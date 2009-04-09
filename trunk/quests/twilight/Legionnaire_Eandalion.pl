
sub EVENT_SAY { 

if($text=~/hail/i) {

quest::say("Salutations to you and your own. On your way to Katta are ya?");

}

if($text=~/what armor/i) {

quest::say("Frank must have told ya about the soldier's armor that we both keep to give to those worthy of wearing it. I have the mask, cloak, gauntlets, gorget, girdle, and swords.");

}

if($text=~/what cloak/i){

quest::say("To get the cloak you will need to get me a meteor jewel, a mark of glory, a ring of wit, and some twilight fish scales.");

}

if($text=~/what Gauntlets/i){

quest::say("To get the gauntlets you will need to get me an astral jewel, a mark of opposition, and a hope quartz.");

}

if($text=~/what girdle/i){

quest::say("To get the girdle you will need to get me a moon jewel, a mark of contention, a fire scorched stick, and a hope star ruby.");

}

if($text=~/what gorget/i){

quest::say("To get the gorget you will need to get me a sun jewel, a mark of pride, and some star dust.");

}


if($text=~/what mask/i){

quest::say("To get the mask you will need to get me a sky jewel, a mark of defiance, and a bag of scarlet sand.");

}

if($text=~/what sword/i){

quest::say("To get the sword you will need to get me a star jewel, a mark of warfare, a hope fire opal, and some fire powder."); 

}

}


sub EVENT_ITEM {

  if (plugin::check_handin(\%itemcount, 4493 => 1, 5530 => 1, 5584 => 1, 5585 =>1)) { # meteor jewel, a mark of glory, a ring of wit, and some twilight fish scales

    quest::summonitem(3941); # cloak 
	
}

  elsif (plugin::check_handin(\%itemcount, 4494 => 1, 5586 => 1, 5587 => 1)) { # astral jewel, a mark of opposition, and a hope quartz

    quest::summonitem(3942); # guantlets

}


  elsif (plugin::check_handin(\%itemcount, 4489 => 1, 5590 => 1, 5591 => 1, 5592 => 1)) {  # moon jewel, a mark of contention, a fire scorched stick, and a hope star ruby.

    quest::summonitem(3944); # girdle

}


  elsif (plugin::check_handin(\%itemcount, 4488 => 1, 5588 => 1, 5589 => 1)) { # sun jewel, a mark of pride, and some star dust.

    quest::summonitem(3943); # gorget

}


  elsif (plugin::check_handin(\%itemcount, 4492 => 1, 5528 => 1, 5529 => 1)) { # sky jewel, a mark of defiance, and a bag of scarlet sand

    quest::summonitem(3940); # mask

}


  elsif (plugin::check_handin(\%itemcount, 4490 => 1, 5668 => 1, 5669 => 1, 5677 => 1)) { # star jewel, a mark of warfare, a hope fire opal, and some fire powder.

    quest::summonitem(3945); # sword
}


  else{ 

    quest::say("I have no use for this.");

    plugin::return_items(\%itemcount);

    return 1;

}


}
#END of FILE Zone:twilight  ID:170135 -- Legionnaire_Eandalion.pl

