# items: 4493, 4691, 4692, 3703, 4494, 4693, 4694, 3704, 4488, 4695, 4696, 4697, 3705, 4489, 4698, 4699, 3706, 4490, 4701, 4702, 3707, 4491, 4703, 4704, 4705, 3708, 4706, 4707, 4708, 3709
sub EVENT_SAY {

 if($text =~ /Hail/i) {

   quest::say("Hey there!");

 }

 if($text =~ /armor/i) {

   quest::say("Oh, youve decided your going to help Lara out with her visions? If so I can reward you with armor if you happen to be an enchanter.");

 }

 if($text =~ /I am an enchanter/i) {

   quest::say("I have the sandals, mask, cloak, gloves, choker, belt, and staff. ");

 }

 if($text =~ /sandals/i) {

   quest::say("For the sandals you must get for me a meteor jewel, a mark of refinement, and a hope onyx.");

 }

 if($text =~ /mask/i) {

   quest::say("For the mask you must get for me an astral jewel, a mark of charm, and a hope pearl.");

 }

 if($text =~ /cloak/i) {

   quest::say("For the cloak you must get for me a sun jewel, a mark of desire, a hope diamond, and a tarnished silver nugget.");

 }

 if($text =~ /gloves/i) {

   quest::say("For the gloves you must get for me a moon jewel, a mark of intellect, and a tarnished gold nugget.");

 }

 if($text =~ /choker/i) {

   quest::say("For the choker you must get for me a star jewel, a mark of thought, and a tarnished platinum nugget.");

 }

 if($text =~ /belt/i) {

   quest::say("For the belt you must get for me a cloud jewel, a mark of reason, a tarnished electrum nugget, and a friendship bracelet.");

 }

if($text =~ /staff/i) {

   quest::say("For the staff you must get for me a sky jewel, a mark of mind, an enchanted bundle of wood, and a shadow crystal.");

 }

}



sub EVENT_ITEM {

  if (plugin::check_handin(\%itemcount, 4493 => 1, 4691 => 1, 4692 => 1)) { #sandals

    quest::summonitem(3703); # Item: Sandals of Enrapturement

    quest::exp(10000);   

  }

  if(plugin::check_handin(\%itemcount, 4494 => 1, 4693 => 1, 4694 => 1)) { #mask

    quest::summonitem(3704); # Item: Veil of Enrapturement

    quest::exp(10000);

  }

  if (plugin::check_handin(\%itemcount, 4488 => 1, 4695 => 1, 4696 => 1, 4697 => 1)) { #cloak

    quest::summonitem(3705); # Item: Cape of Enrapturement

    quest::exp(10000);

  }

  if (plugin::check_handin(\%itemcount, 4489 => 1, 4698 => 1, 4699 => 1)) { #gloves

    quest::summonitem(3706); # Item: Gloves of Enrapturement

    quest::exp(10000);

  }

  if (plugin::check_handin(\%itemcount, 4490 => 1, 4701 => 1, 4702 => 1)) { #choker

    quest::summonitem(3707); # Item: Choker of Enrapturement

    quest::exp(10000);

  }

  if (plugin::check_handin(\%itemcount, 4491 => 1, 4703 => 1, 4704 => 1, 4705 => 1)) { #belt

    quest::summonitem(3708); # Item: Belt of Enrapturement

    quest::exp(10000);

  }
  
    if (plugin::check_handin(\%itemcount, 4491 => 1, 4706 => 1, 4707 => 1, 4708 => 1)) { #staff 

    quest::summonitem(3709); # Item: Staff of Enrapturement

    quest::exp(10000);

  }

  plugin::return_items(\%itemcount);

}
#END of FILE zone:twilight  ID:170145 -- Xavier_Sendorn.pl

