my @players = ();
my $raid;
my $instance;

sub EVENT_SAY {
	if ($text=~/ready/i) {
		CREATEINSTANCE();	
	} elsif ($text=~/hail/i) {
		quest::say("Hello $name, I am here to assist you in freeing Zebuxoruk.");
		quest::say("When you have gathered a large enough force of adventureers ready to free him I will show you how to begin. Let me know when you are [ready]");
	}
}

sub CREATEINSTANCE {
	$running = quest::GetInstanceID("potimeb", 0);
	$raid = $client->GetRaid();
	
	if ($raid) {
		if (defined($qglobals{potimeLockout}) || defined($qglobals{potime_canzone})) {
			$client->Message(13, "You are not ready yet to start a new raid");
		} elsif ($running == 0 && !(defined($qglobals{potimeLockout}) || defined($qglobals{potime_canzone}))) {
			$instance = quest::CreateInstance("potimeb", 0, 232000);
			quest::AssignRaidToInstance($instance);
			quest::say("Instance created");
			quest::say("You will find several sun dials spread throughout this zone. These shall lead you in to the lair of the gods. Please hurry, Zebuxoruk needs you.");
		} else {
			$client->Message(13, "You are already in an instance!");
		}
	} else {
		$client->Message(13, "You are not in a raid!");
	}
}

