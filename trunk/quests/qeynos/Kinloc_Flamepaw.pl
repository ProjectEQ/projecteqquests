sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Hello."); }
}
sub EVENT_ITEM { 
if ($item1=="18719"){quest::say("Welcome to the Order of Three. I am Kinloc, Guild Master of the Magicians. This tunic of the Order is for you, wear it with honour. Study hard and master your skills, and you will become an important part of our Order. Yestura shall help introduce you to the ways of magic.");
quest::summonitem("13508");
quest::exp("100"); }
}
#END of FILE Zone:qeynos  ID:1130 -- Kinloc_Flamepaw 

