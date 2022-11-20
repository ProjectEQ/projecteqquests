# items: 1002, 58239
sub EVENT_SAY {
	if($text=~/Hail/i) {
		quest::say("Hello! I like to collect things for my nest! If one of my brothers give you something during the hunt you don't want, I'll take it off your hands!");
	}
	if(quest::istaskactivityactive(500222,0)) {
		quest::say("Once Kai finds a place he likes, he may stay there for a while.");
	}
	if(quest::istaskactivityactive(500222,1)) {
		quest::say("Brutus moves from area to area often, but stays in one place once there.");
	}
	if(quest::istaskactivityactive(500222,2)) {
		quest::say("Aristotle does not move between areas often, but he does tend to roam a bit which may confuse your tracking tool.");
	}
	if(quest::istaskactivityactive(500222,3)) {
		quest::say("Zeus is the boss of the first clan. He may become aggressive with you over his territory.");
	}
	if(quest::istaskactivityactive(500222,5)) {
		quest::say("Sherlock likes to make himself squeeze through tight spaces.");
	}
	if(quest::istaskactivityactive(500222,6)) {
		quest::say("Ocho likes to tinker with mechanical devices.");
	}		
	if(quest::istaskactivityactive(500222,7)) {
		quest::say("Toby is the boss of the second clan. He's a big boy, watch out!");
	}
	if(quest::istaskactivityactive(500222,9)) {
		quest::say("Gustave may use trickery to decieve you.");
	}
	if(quest::istaskactivityactive(500222,10)) {
		quest::say("Napoleon likes to hide, and he is fiercely territorial.");
	}
	if(quest::istaskactivityactive(500222,11)) {
		quest::say("Keep an eye on your tracking tool around Sprocket.");
	}
	if(quest::istaskactivityactive(500222,12)) {
		quest::say("Tracking Mortimer in an area may prove to be very difficult.");
	}
	if(quest::istaskactivityactive(500222,13)) {
		quest::say("Paulie is the largest of Rattus, and the boss of the elder clan. He enjoys food!");
	}
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 1002 => 1)) {
		quest::say("Great! I can use this for my nest! Here take some food in exchange.");
		quest::summonitem(58239); # Item: Small Wedge of Cheese
	}
}
