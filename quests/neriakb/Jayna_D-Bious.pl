sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Hail."); }
}
sub EVENT_ITEM { 
	if ($item1=="18754"){quest::say("Thanks.");
quest::summonitem("13583");
quest::exp("100"); }
}
#END of FILE Zone:neriakb  ID:41054 -- Jayna_D`Bious 

