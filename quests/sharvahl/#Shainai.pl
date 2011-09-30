sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 17) {
    quest::emote("stops skipping and looks around, 'Uh oh'");
	}
	if($wp == 43) {
    quest::emote("glances about, looking a bit lost. 'Well this doesn't look like a place I belong in at all'");
	}
	if($wp == 49) {
    quest::say("Uh oh? this looks dangerous, I don't think I am allowed to be here.");
	}
	if($wp == 51) {
    quest::emote("notices the pile of bones next to her and shudders, 'Eeep! I wonder what happened to him.");
	}
	if($wp == 57) {
    quest::say("Hi, how do I get outside, huh?");
	}
	if($wp == 58) {
    quest::emote("smiles at the sight of daylight, 'Ahhh yes, this is the way!'");
	}
	if($wp == 66) {
    quest::emote("squints around, thinking hard, 'Hrmmm, this does look familiar. I think i came from this-a-way.'");
	}
	if($wp == 68) {
    quest::say("Oh look, there it is!");
	}
	if($wp == 80) {
    quest::emote("Yawns tiredly and says, 'That was fun. Time for me to go to sleep though.' She crawls under the blanket and falls sound asleep.");
	}
}
