sub EVENT_SPAWN {
	my $count = 0;
	quest::settimer("kill",660);
}

sub EVENT_SIGNAL {
	$count++;
	if($count == 8){
		quest::signalwith(172032,1,0); # NPC: #Johanius_Barleou
		quest::depop();
	}
}

sub EVENT_TIMER {
	if($timer eq "kill") {
		quest::signalwith(172032,2,0); # NPC: #Johanius_Barleou
		quest::signalwith(172074,2,0); # NPC: #Aellana_Barleou
		quest::signalwith(172073,2,0); # NPC: #Lyrra_Rutledge
		quest::depop();
	}
}

