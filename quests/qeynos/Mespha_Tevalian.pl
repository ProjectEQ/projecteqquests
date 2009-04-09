sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Hello."); }
}
sub EVENT_ITEM { 
	if ($item1=="18720"){quest::say("Greetings $name. Welcome to the Hall of Sorcery. You have much to learn. Wear this tunic and represent us well. See my apprentice, Unsar Koldhagon, he will get you started and help you with your studies.");
quest::summonitem("13508");
quest::exp("100"); }
}
#END of FILE Zone:qeynos  ID:1068 -- Mespha_Tevalian 

