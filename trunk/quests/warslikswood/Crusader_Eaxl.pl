sub EVENT_COMBAT {
	if($combat_state == 1) {
		quest::say("You cannot hope defeat a Crusader of Greenmist!!");
	}
}