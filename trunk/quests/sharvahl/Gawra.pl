sub EVENT_SPAWN {
	quest::settimer(1,80);
	}
	
sub EVENT_TIMER {
	quest::say("Hey there! Come take a look at my torches. It beats hunting in the dark. I have food and bandages.");
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail wanderer. I have basic supplies available if you are interested. Have a look."); }
}
#END of FILE Zone:sharvahl  ID:155179 -- Gawra 

