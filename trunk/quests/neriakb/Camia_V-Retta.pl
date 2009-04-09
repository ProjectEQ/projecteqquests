sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Hail."); }
}
sub EVENT_ITEM { 
	if ($item1=="18753"){quest::say("Thanks.");
quest::summonitem("13584");
quest::exp("100"); }
}
#END of FILE Zone:neriakb  ID:41052 -- Camia_V`Retta 

