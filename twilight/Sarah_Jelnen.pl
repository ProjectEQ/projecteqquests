

sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Sarah Jelnen closes her eyes and sighs wistfully as if remembering some long forgotten bittersweet memory. 'Hafron must have told you about our dearly missed friend Hadon. Very well, are you a [shaman]?");

}

if($text=~/shaman/i){

quest::say("Aye you have the look of one who communes with spirits. The pieces that I have are the [mask], [cloak], [gauntlets], [talisman], [girdle] and [spear].");

}

if($text=~/what cloak/i){

quest::say("For the cloak you must get me a cloud jewel, mark of auspice, an avatar's tome, and a rockhopper spirit fetish.");

}

if($text=~/what gauntlets/i){

quest::say("For the gauntlets you must get me a sky jewel, a mark of guidance, and a vitality gem.");

}

if($text=~/what girdle/i){

quest::say("For the girdle you must get me an astral jewel, a mark of augury, an aged runic crutch, and a lined towel.");

}

if($text=~/what mask/i){

quest::say("For the mask you must get me a star jewel, the mark of the oracle, and an aged bone fetish.");

}

if($text=~/what spear/i){

quest::say("For the spear you must get me a sun jewel, a mark of premonition, a darkened shaft, and an oracle orb.");

}

if($text=~/what talisman/i){

quest::say("For the talisman you must get me a meteor jewel, a mark of rage, and a spirit marked ornament.");

 }

}


sub EVENT_ITEM { 
# Augur's Cloak
if (plugin::check_handin(\%itemcount, 4491 => 1,4940 => 1,4949 => 1,4950 => 1)){ # cloud jewel, mark of auspice, an avatar's tome, and a rockhopper spirit fetish.

quest::summonitem(3757); # Augur's Cloak

}

# Augur's Gauntlets
elsif (plugin::check_handin(\%itemcount, 4992 => 1,4951 => 1,4952 => 1)){ # sky jewel, a mark of guidance, and a vitality gem

quest::summonitem(3758); # Augur's Gauntlets

}

# Augur's Waistband
elsif (plugin::check_handin(\%itemcount, 4994 => 1,4955 => 1,4956 => 1,4957 => 1)){ # astral jewel, a mark of augury, an aged runic crutch, and a lined towel

quest::summonitem(3760); # Augur's Waistband

}

# Augur's Mask
elsif (plugin::check_handin(\%itemcount, 4490 => 1,4938 => 1,4939 => 1 )){ # star jewel, the mark of the oracle, and an aged bone fetish

quest::summonitem(3756); # Augur's Mask

}

# Augur's Spear
elsif (plugin::check_handin(\%itemcount, 4488 => 1,4959 => 1,4960 => 1)){ # sun jewel, a mark of premonition, a darkened shaft, and an oracle orb.

quest::summonitem(3761); # Augur's Spear

}

# Augur's Talisman
elsif (plugin::check_handin(\%itemcount, 4494 => 1,4953 => 1,4954 => 1)){ # meteor jewel, a mark of rage, and a spirit marked ornament.

quest::summonitem(3759); # Augur's Talisman

}


}


#END of FILE Zone:twilight  ID:170127 -- Sarah_Jelnen.pl 