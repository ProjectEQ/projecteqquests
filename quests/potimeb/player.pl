sub EVENT_ENTERZONE {
	BEGINRAID();
	quest::settimer("player_check", 10);
}

sub EVENT_TIMER {
	if ($timer eq "player_check") {
		if (defined($qglobals{potimeb_finished})) {
			quest::delglobal("potimeLockout");
			quest::setglobal("potimeLockout", 6, 5, "D7");
			quest::delglobal("potime_canzone");
			quest::movepc(202, -55.82, 43.93, -158.81);
		}
	}
}

sub EVENT_CLICKDOOR {
	my $d_id = ($doorid % 256);
	my $instance = quest::GetInstanceID("potimeb", 0);
	
	if ($d_id == 62 && (defined($qglobals{potimeLockout}) && $qglobals{potimeLockout} > 2)) {
		quest::MovePCInstance(223, $instance, -401, 0, 348);
	} elsif($d_id == 24 && (defined($qglobals{potimeLockout}) && $qglobals{potimeLockout} > 3)) {
		quest::MovePCInstance(223, $instance, -419, 0, 3);
	} elsif($d_id == 51 && (defined($qglobals{potimeLockout}) && $qglobals{potimeLockout} > 4)) {
		quest::MovePCInstance(223, $instance, 251, -1124, -1);
	} 
}

sub BEGINRAID {
	if (!defined($qglobals{potimeLockout}) && !defined($qglobals{potime_canzone})) {
		quest::setglobal("potimeLockout", 1, 5, "H24");
		quest::setglobal("potime_canzone", 1, 5, "H24");
	}
}