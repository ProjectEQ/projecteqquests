sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello there. adventurer! I am sure you are thirsty after that long boat ride from Qeynos!"); }
}

sub EVENT_SIGNAL {
quest::say("Pipe down, Phloatin! Treat the new clientele with respect.");
}
#END of FILE Zone:erudnext  ID:98065 -- Helia_BlueHawk 

