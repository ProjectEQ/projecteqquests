sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Greetings and well met $name. Don't listen to ol' Latrag over there he'll never stop brewin' the best durn ale to be found.");

}

if($text=~/what boots/i){

quest::say("For the boots yer gonna have to get me a sun jewel. a mark of destiny. and a fleshy vine.");

}

if($text=~/what armor/i){

quest::say("Latrag is goin' on 'bout his armor again isn't he. Well friend be ye a paladin?");

}

if($text=~/i am a paladin/i){

quest::say("Of course ya are $name. why would have ya asked me about the armor if ye wasn't eh. I have the [boots], [mask], [cloak], [gauntlets], [gorget], [girdle], and a [sword]. Which do ye want?");

}

if($text=~/what mask/i){

quest::say("For the mask yer gonna have to get me a moon jewel. a mark of blessings. and some crystallized dew.");

}

if($text=~/what cloak/i){

quest::say("For the cloak yer gonna have to get me a star jewel. a mark of the steadfast. a lexicon of the sun. and some glade dew.");

}

if($text=~/what gauntlets/i){

quest::say("For the gauntlets yer gonna have to get me a cloud jewel. a mark of honor. and some naturally formed quartz.");

}

if($text=~/what gorget/i){

quest::say("For the gorget yer gonna have to get me a sky jewel. a mark of gallantry. and a lunar marked stone.");

}

if($text=~/what girdle/i){

quest::say("For the girdle yer gonna have to get me a meteor jewel. a mark of heart. a lexicon of the moon. and a dread leech eye.");

}

if($text=~/what sword/i){

quest::say("For the sword yer gonna have to get me an astral jewel. a mark of the noble. a hardened clay sculpture. and a runic ear plug."); 

}

}

sub EVENT_ITEM {

# Blessed Knight's Boots
if (plugin::check_handin(\%itemcount,4488  => 1, 5904 => 1,5905 => 1)){ # sun jewel, a mark of destiny, and a fleshy vine

quest::summonitem(3978); # Blessed Knight's Boots

}

# Blessed Knight's Cloak
if (plugin::check_handin(\%itemcount, 4490 => 1,5908 => 1,5909 => 1,5910 => 1)){ # star jewel, a mark of the steadfast, a lexicon of the sun, and some glade dew

quest::summonitem(3980); # Blessed Knight's Cloak

}

# Blessed Knight's Gauntles
if (plugin::check_handin(\%itemcount, 4491 => 1,5911 => 1,5912 => 1)){ # cloud jewel, a mark of honor, and some naturally formed quartz

quest::summonitem(3981); # Blessed Knight's Gauntles

}

# Blessed Knight's Girdle
if (plugin::check_handin(\%itemcount, 4493 => 1,5915 => 1,5916 => 1,5917 => 1)){ # meteor jewel, a mark of heart, a lexicon of the moon, and a dread leech eye

quest::summonitem(3983); # Blessed Knight's Girdle

}

# Blessed Knight's Gorget
if (plugin::check_handin(\%itemcount, 4492 => 1,5913 => 1,5914 => 1)){ # sky jewel, a mark of gallantry, and a lunar marked stone

quest::summonitem(3982); # Blessed Knight's Gorget

}

# Blessed Knight's Mask
if (plugin::check_handin(\%itemcount, 4489 => 1,5906 => 1,5907 => 1)){ # moon jewel, a mark of blessings, and some crystallized dew

quest::summonitem(3979); # Blessed Knight's Mask

}

# Blessed Knight's Defender
if (plugin::check_handin(\%itemcount, 4494 => 1,5918 => 1,5919 => 1,5920 => 1)){ # astral jewel, a mark of the noble, a hardened clay sculpture, and a runic ear plug

quest::summonitem(3984); # Blessed Knight's Defender

}

}

#END of FILE Zone:twilight  ID:170108 -- Trallen_Grimhammer.pl


