# items: 4494, 5287, 5288, 3795, 4488, 5289, 5290, 5291, 3796, 4489, 5292, 5293, 3797, 4490, 5294, 5295, 3798, 4491, 5285, 5297, 5298, 3799, 4492, 5299, 5326, 5327, 3800
sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("looks up and smiles.  'Hiya. I just love fishing don't you?'");

}

if($text=~/What armor/i){

quest::say("Oh! Tolli sent you over here didn't he. If you're a rogue and want some armor just let me know.");

}

if($text=~/I am a rogue/i){

quest::say("This stuff isn't free no sir! I have a mask. cloak. gauntlets. gorget. waistband. and a dirk.  Just ask and I'll tell ya what ya have to do to get it.");

}

if($text=~/What mask/i){

quest::say("For the mask of concealment you're going to have to go get me an astral jewel, a mark of deceit, and an engraved fire opal statuette.");

}

if($text=~/What cloak/i){

quest::say("For the cloak of concealment you're going to have to go get me a sun jewel, a mark of secrecy, an engraved ivory statuette, and a polished gemstone.");

}

if($text=~/What gauntlets/i){

quest::say("For the gauntlets of concealment you're going to have to go get me a moon jewel, a mark of deception, and an engraved gold statuette.");

}

if($text=~/What gorget/i){

quest::say("For the gorget of concealment you're going to have to go get me a star jewel, a mark of trickery, and an engraved wooden statuette.");

}

if($text=~/What waistband/i){

quest::say("For the waistband of concealment you're going to have to go get me a cloud jewel, a mark of silence, an engraved platinum statuette, and a true silver needle.");

}

if($text=~/What dirk/i){

quest::say("For the dirk of concealment you're going to have to go get me a sky jewel, a mark of greed, an engraved mithril statuette, and a dread hilt."); 

}

}

sub EVENT_ITEM {

  if (plugin::check_handin(\%itemcount, 4494 => 1, 5287 => 1, 5288 => 1)) { # astral jewel. a mark of deceit. and an engraved fire opal statuette

    quest::summonitem(3795); # Mask
	
}

  elsif (plugin::check_handin(\%itemcount, 4488 => 1, 5289 => 1, 5290 => 1, 5291 => 1)) { # sun jewel. a mark of secrecy. an engraved ivory statuette. and a polished gemstone.

    quest::summonitem(3796); # cloak

}


  elsif (plugin::check_handin(\%itemcount, 4489 => 1, 5292 => 1, 5293 => 1)) { # moon jewel. a mark of deception. and an engraved gold statuette

    quest::summonitem(3797); # guantlets

}


  elsif (plugin::check_handin(\%itemcount, 4490 => 1, 5294 => 1, 5295 => 1)) { # star jewel. a mark of trickery. and an engraved wooden statuette

    quest::summonitem(3798); # gorget

}


  elsif (plugin::check_handin(\%itemcount, 4491 => 1, 5285 => 1, 5297 => 1, 5298 => 1)) { # cloud jewel. a mark of silence. an engraved platinum statuette. and a true silver needle

    quest::summonitem(3799); # waistband

}


  elsif (plugin::check_handin(\%itemcount, 4492 => 1, 5299 => 1, 5326 => 1, 5327 => 1)) { # sky jewel. a mark of greed. an engraved mithril statuette. and a dread hilt.

    quest::summonitem(3800); # Dirk
}

    plugin::return_items(\%itemcount);

}


#END of FILE Zone:twilight  ID:170140 -- Liteema_Agner.pl


