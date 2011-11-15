sub EVENT_SAY { 
	if(($text=~/Hail/i) && ($x==924) && ($y==958)){
		quest::say("Shhhh....keep your voice down lest you wake Alaria. We can [speak elsewhere] if you wish.");
	}
	if(($text=~/speak elsewhere/i) && ($x==924) && ($y==958)){
		quest::say("Follow me and we shall discuss how you may assist me with my [current research].");
		quest::start(16);
	}
	if(($text=~/current research/i) && ($x==820) && ($y==930)){
		quest::say("Recently patrols have been sent to the Stonebrunt Mountains to investigate rumors of an alliance between the Kejekans and Erudin. There is much spiritual activity in that region of Odus and the patrols have reported encountering massive beasts called Titans. These titans exhibit abilities that lead me to believe they are powerful animal spirits that have somehow taken on a physical form in order to enter and manipulate the realm of the living. I require [samples] of the Titans physiology in order to further my research.");
	}
	if(($text=~/samples/i) && ($x==820) && ($y==930)){
		quest::say("There have been sightings of Titans in many forms. The samples I require are the fangs of the leopard, sabretooth, and gorilla titans, and the rattle of the snake titan.");
	}
}

sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 6957 => 1, 6943 => 1, 6959 => 1, 6948 => 1)) { 
		quest::summonitem(2568); 
		quest::exp(150);
		quest::say("Excellent!! These shall provide valuable information to my research on the spirit realm."); 
    }
	else { 
		plugin::return_items(\%itemcount); 
		quest::say("'I require all four titan samples in order to pursue the research I desire.");
		return 1;
    } 
}