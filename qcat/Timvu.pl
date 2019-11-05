sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("We are only here to finish off any enemies of the Circle who escape the sharks.");
	}
	#:: Missing response to "circle"
}
