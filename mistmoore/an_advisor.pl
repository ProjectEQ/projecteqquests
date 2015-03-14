sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::attack($name);
	}
}
