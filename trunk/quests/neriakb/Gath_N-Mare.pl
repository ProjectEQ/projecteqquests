sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Hail."); }
}
sub EVENT_ITEM { 
	if ($item1=="18755"){quest::say("Thanks.");
quest::summonitem("13582");
quest::exp("100"); }
}
#END of FILE Zone:neriakb  ID:41053 -- Gath_N`Mare 

