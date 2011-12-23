sub EVENT_COMBAT {
	if($combat_state == 0) {
		quest::say("You cannot hope defeat a Crusader of Greenmist!!");
	}
}