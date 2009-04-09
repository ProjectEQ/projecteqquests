sub EVENT_SPAWN {
	quest::shout("Oh, someone got past Jack? Impressive. Well, come and get me, mortals!");
}

sub EVENT_DEATH {
	quest::shout("Nooo! I cannot be defeated! Its imp-ossible!");
	quest::spawn2(63101,0,0,17,579,3.1,154);
}