sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Ahh, yes $name.  I always have time for one of my loyal subjects.  Oh... wait, the Court Sage is signaling me that there is an important matter that needs my immediate attention.  Please come back a little later on and I should have some more time for you."); 
	}
}

