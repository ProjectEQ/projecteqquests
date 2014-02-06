# ##Noqufiel (296074)

sub EVENT_AGGRO {
	quest::signalwith(296075,1); #tell trigger I'm aggro'd
}



=cut
sub EVENT_AGGRO {
	quest::signalwith(296075,1); #tell trigger I'm aggro'd
}

sub EVENT_SIGNAL {
	if ($signal == 5) { #from trigger saying depop
		quest::depop();
	}
}