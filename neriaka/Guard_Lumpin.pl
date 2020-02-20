sub EVENT_AGGRO {
	quest::say("Die, like the fool you are!");
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hullo citizen. Me am here to guard you so puts away any wepuns.");
	}
	elsif ($text=~/happy love bracers/i) {
		quest::say("Hmm... Me seen green bracers on troll named [Ratraz].");
	}
	elsif ($text=~/ratraz/i) {
		quest::say("Ratraz is dumb troll who werk in dark elf bar. Him tink he smart because dark elves raise him. Tink he know everyting. Him just as stewpid as all us trolls is!");
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::say("My comrades will avenge my death.");
}
