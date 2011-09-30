sub EVENT_SIGNAL {
    quest::say("Yes, sir!");
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Um, sorry, $name. I don't wish to be rude, but I must not be distracted while I am at my post. Commander Bayle trusted me with this watch and I will not let him down."); }
}
#END of FILE Zone:qeynos  ID:1012 -- Guard_Jerith 

