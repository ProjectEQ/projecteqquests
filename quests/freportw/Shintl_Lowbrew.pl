############################################
# ZONE: West Freeport (freportw)
# LAST EDIT DATE: November 17, 2011
# DEVELOPER: MWMDRAGON
# REVISED BY: robregen
############################################


sub EVENT_SAY { 
	if($text=~/Hail/i) {
		quest::say("Hail. mighty one! What are you doing in the city?  You should be out slaying beasts. There is nothing to find here in the city.");
	}
	if($text=~/Who is Hollish/i) {
		quest::say("I have never heard of this Hollish character you speak of. You must be confusing me for someone else.");
	}
	if($text=~/Who is Opal/i) {
		quest::say("Opal is just a friend I have here in Freeport. She works at the Academy of Arcane Science.");
	}
}

sub EVENT_ATTACK {
	quest::say("I have friends in very high places!!");
}

sub EVENT_DEATH { 
	quest::say("You have no idea what a big mistake you made. Either my fellow rogues shall find you or the Freeport Mi.. Unnnghh");
}

sub EVENT_WAYPOINT_ARRIVE {
	if($wp eq 1 ) {
		quest::creategroundobject(12147, -448, -107, -10.870, 0, 30);
	}
	if($wp eq 7 ) {
		quest::say("Any mail for room number two?");
		quest::signal(9103, 1);
	}
}
