sub EVENT_SPAWN {
	quest::settimer(1,2400);
}



sub EVENT_TIMER { 
	quest::say("Guys, can I get down now please?"); 
}