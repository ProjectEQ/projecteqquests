my $bossman = 0;

sub EVENT_SIGNAL {
	$bossman=1;
	quest::signalwith(211081,9,1);
}

sub EVENT_DEATH_COMPLETE {
	quest::signalwith(211081,8,0);
	if($bossman == 1) {
		quest::spawn2(202368,0,0,$x,$y,$z,$h);
		quest::updatespawntimer(44032,259200000); #Alekson Garn 3 days on win
		$bossman=undef;
		quest::depopall(211081); #Alek_Trial_Trigger
	}
}