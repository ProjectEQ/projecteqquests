sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Hello."); }
}
sub EVENT_ITEM { 
if ($item1=="18718"){quest::say("Greetings, I am Gahlith, Master of the Wizard's Order of the Hall of Sorcery. Here, we have devoted our lives and souls to the study of the arcane. My apprentice Kazlo Naedra shall tutor you and teach you the foundations and fundamentals of sorcery.");
quest::summonitem("13508");
quest::exp("100"); }
}
#END of FILE Zone:qeynos  ID:1064 -- Gahlith_Wrannstad 

