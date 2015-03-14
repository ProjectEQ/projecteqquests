my $spawn = undef;

sub EVENT_AGGRO {
	quest::settimer(3,30);
	quest::settimer(4,1800);
	quest::setnexthpevent(15);
}


sub EVENT_TIMER {
	if($spawn <= 5) {
		if($timer == 3) {
			quest::ChooseRandom((quest::spawn2(207069,0,0,-32,-95,452,68)),(quest::spawn2(207069,0,0,-32,-135,452,0)),(quest::spawn2(207069,0,0,44,-50,452,0)),(quest::spawn2(207069,0,0,0,-52,452,0)),(quest::spawn2(207069,0,0,-25,-116,460,0)));
			$spawn=$spawn+1;
		}
	}
	if($timer == 4) {
		$spawn=undef;
		quest::stoptimer(3);
		quest::stoptimer(4);
	}
}

sub EVENT_HP {
	if($hpevent == 15) {
		quest::depop_withtimer();
		#set maareq's respawn, without this line he will repop on zone reset
		#commented this out and put it in death event of the #a_twisted_crawler
		#only to allow a failed raid to redo the event without putting in smarter
		#logic to keep the #a_twisted_crawler up through a zone reset/empty.
		#quest::updatespawntimer(42165,43200000);
		quest::spawn2(207070,0,0,$x,$y,$z,$h);
		quest::stoptimer(3);
		quest::stoptimer(4);
	}
}