# items: 4494, 5902, 5903, 3977, 4490, 5891, 5892, 5983, 3973, 4492, 5897, 5898, 5899, 3975, 4489, 5888, 5889, 5890, 3972, 5900, 5901, 3976, 4488, 5894, 5895, 5896, 3974


sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Har there lad! Ye be sure 'nuff to tell em all that Brewmaster Latrag is [retiring].");

}

if($text=~/retiring/i){

quest::say("Ya got that right. I'm goin' to concentrate more on me devotion to Brell as a [holy knight]!");

}

if($text=~/holy knoght/i){

quest::say("I be a paladin of Brell thar Daias . Might ye be a [paladin] yerself?");

}

if($text=~/paladin/i){

quest::say("That's good. Ya know I have some armor ye might be interested in.");

}

if($text=~/what armor/i){

quest::say("Yar! I have me a [helm], [breastplate], [vambraces], [greaves], [pauldrons], and a [bracer]. If ye want the rest talk to the mighty holy warrior Trallen over there about armor.");

}

if($text=~/what breastplate/i){

quest::say("For the breastplate ye gotta bring me a star jewel, a mark of courage, a white marble bowl, and a jagged reed.");

}

if($text=~/what vambracers/i){

quest::say("For the vambraces ye gotta bring me a cloud jewel, a mark of righteousness, a runed card, and a pristine ebony idol");

}

if($text=~/what greaves/i){

quest::say("For the greaves ye gotta bring me a sky jewel, a mark of bravery, a sunflower fruit, and a weathered bundle of wood");

}

if($text=~/what pauldrons/i){

quest::say("For the pauldrons ye gotta bring me a meteor jewel, a mark of daring, and a life gem.");

}

if($text=~/what bracer/i){

quest::say("For the bracer ye gotta bring me an astral jewel, a mark of reliance, and some blessed water");

}

if($text=~/what helm/i){

quest::say("For the helm ye gotta bring me a moon jewel, a mark of valor, a withered branch, and a pale pearl.");

 }

}


sub EVENT_ITEM { 
# Blessed Knight's Bracer
if (plugin::check_handin(\%itemcount, 4494 => 1,5902 => 1,5903 => 1)){ # astral jewel, a mark of reliance, and some blessed water

quest::summonitem(3977); # Blessed Knight's Bracer

}

# Blessed Knight's Breastplate
elsif (plugin::check_handin(\%itemcount, 4490 => 1,5891 => 1,5892 => 1,5983 => 1)){ # star jewel, a mark of courage, a white marble bowl, and a jagged reed

quest::summonitem(3973); # Blessed Knight's Breastplate

}

# Blessed Knight's Greaves
elsif (plugin::check_handin(\%itemcount, 4492 => 1,5897 => 1,5898 => 1,5899 => 1)){ # sky jewel, a mark of bravery, a sunflower fruit, and a weathered bundle of wood

quest::summonitem(3975); # Blessed Knight's Greaves

}

# Blessed Knight's Helm
elsif (plugin::check_handin(\%itemcount, 4489 => 1,5888 => 1,5889 => 1,5890 => 1)){ # moon jewel, a mark of valor, a withered branch, and a pale pearl

quest::summonitem(3972); # Blessed Knight's Helm

}

# Blessed Knight's Pauldrons
elsif (plugin::check_handin(\%itemcount, 4494 => 1,5900 => 1,5901 => 1)){ # meteor jewel, a mark of daring, and a life gem

quest::summonitem(3976); # Blessed Knight's Pauldrons

}

# Blessed Knight's Vambraces
elsif (plugin::check_handin(\%itemcount, 4488 => 1,5894 => 1,5895 => 1,5896 => 1)){ # cloud jewel, a mark of righteousness, a runed card, and a pristine ebony idol

quest::summonitem(3974); # Blessed Knight's Vambraces

}

}


#END of FILE Zone:twilight  ID:170143 -- Latrag_Darkaxe.pl 


