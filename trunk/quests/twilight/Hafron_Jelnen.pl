sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Hail and well met friend.  I'm one of master Vornol's four apprentices.  I am being trained to be an expert on all things dealing with the element of fire.'"); 

}
if($text=~/what armor/i){

quest::say("This armor is indeed mighty if you wish to have it you must do some tasks for me. I have the coif, mail, vambraces, greaves, pauldrons, bracer, and boots. My sister, Sarah, has the rest just ask her about armor and she will help you.");

}

if($text=~/what boots/i){

quest::say("To get the boots you must fetch for me a moon jewel, a mark of the seer, and a hewed augury stone.");

}

if($text=~/what bracer/i){

quest::say("To get the bracer you must fetch for me a sun jewel, a mark of soul, and a spirit gem.");

}

if($text=~/what coif/i){

quest::say("To get the coif you must fetch for me a star jewel, a mark of sight, an ancient sun fetish, and the tablet of spirits.");

}

if($text=~/what greaves/i){

quest::say("To get the greaves you must fetch for me a meteor jewel, a mark of omens, a pouch of false gems, and an adorned cap");

}

if($text=~/what mail/i){

quest::say("To get the mail you must fetch for me a cloud jewel, a mark of vision, a writ of safid, and some throwing bones.");

}

if($text=~/what pauldrons/i){

quest::say("To get the pauldrons you must fetch for me a astral jewel, a mark of spirit, and Genalan's Chronicle.");

}

if($text=~/what vambraces/i){

quest::say("To get the vambraces you must fetch for me a sky jewel, a mark of prophecy, a polished stone fetish, and a woven anklet.");

}

}

sub EVENT_ITEM { 
# Augur's Boots
if (plugin::check_handin(\%itemcount, 4489 => 1,4936 => 1,4937 => 1)){ # moon jewel, a mark of seers, and a hewed augury stone.

quest::summonitem(3755); # Augur's Boots

}

# Augur's Bracer
elsif (plugin::check_handin(\%itemcount, 4488 => 1,4934 => 1,4935 => 1)){ # sun jewel, a mark of soul, and a spirit gem

quest::summonitem(3754); # Augur's Bracer

}

# Augur's Coif
elsif (plugin::check_handin(\%itemcount, 4490 => 1,4898 => 1,4899 => 1,4900 => 1)){ # star jewel, a mark of sight, an ancient sun fetish, and the tablet of spirits.

quest::summonitem(3749); # Augur's Coif

}

# Augur's Greaves
elsif (plugin::check_handin(\%itemcount, 4494 => 1,4929 => 1,4930 => 1,4931 => 1)){ # meteor jewel, a mark of omens, a pouch of false gems, and an adorned cap

quest::summonitem(3752); # Augur's Greaves

}

# Augur's Mail
elsif (plugin::check_handin(\%itemcount, 4491 => 1,4908 => 1, 4909=> 1,4910 => 1)){ # cloud jewel, a mark of vision, a writ of safid, and some throwing bones.

quest::summonitem(3750); # Augur's Mail

}

# Augur's Mantle
elsif (plugin::check_handin(\%itemcount, 4494 => 1,4932 => 1,4933 => 1)){ # astral jewel, a mark of spirit, and Genalan's Chronicle

quest::summonitem(3753); # Augur's Mantle

}

# Augur's Vambraces
elsif (plugin::check_handin(\%itemcount, 4492 => 1,4918 => 1,4927 => 1, 4928 => 1)){ # sky jewel, a mark of prophecy, a polished stone fetish, and a woven anklet

quest::summonitem(3751); # Augur's Vambraces

}

}


#END of FILE Zone:twilight  ID:170128 -- Hafron_Jelnen.pl 



