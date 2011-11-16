sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Grrrrrr!!"); 
	}
	if(($text=~/megan/i) && ($faction < 5) && ($x==-1161) && ($y==2022)) {
		quest::say("Ruff... ruff... woof!");
		quest::start(195);
	}
	if(($text=~/megan/i) && ($faction == 5)) {
		quest::emote("apparently responds only to one who follows the Wolves of the North.");
	}
	if(($text=~/megan/i) && ($faction > 5)) {
		quest::emote("growls at you. It can sense you are an enemy of the Wolves of the North.");
	}
}
