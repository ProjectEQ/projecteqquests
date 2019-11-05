sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings!! This is no place for a person of your standards. I am but a beggar, that is why I live among the sewer rats. It would be best if you were to leave this dangerous place.");
	}
	elsif ($text=~/rat king/i) {
		quest::say("That is but a child's fairy tale.")
	}
}
