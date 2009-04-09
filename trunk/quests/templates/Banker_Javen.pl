
sub EVENT_SPAWN {
	my $min = 10;
	quest::settimer("kill$mname", $min*60);
	quest::say("$mname at your service, for $min minutes.");
}

sub EVENT_TIMER {
	quest::say("Goodbye.");
	quest::depop();
	quest::stoptimer("kill$mname");
}

sub EVENT_SAY {
	if($text =~ /bye/i) {
		quest::say("Goodbye.");
		quest::depop();
		quest::stoptimer("kill$mname");
	} elsif($text =~ /attack/i) {
		quest::attack($name);
	} else {
		quest::say("Tell me 'bye' to make me go away.");
	}
}
