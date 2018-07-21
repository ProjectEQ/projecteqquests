my $villager = 0;
my $badguys = 0;

sub EVENT_SPAWN {
	quest::settimer(1,1);
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		$villager=$villager+1;
		quest::stoptimer(2);
		quest::settimer(2,1200);
	} 

	if($signal == 2) {
		$badguys=$badguys+1;
		quest::stoptimer(2);
		quest::settimer(2,1200);
	}
}

sub EVENT_TIMER {
	if($timer == 1 && $villager == 4) {
		quest::updatespawntimer(44016,86400000); #Rhaliq Trell 24 hours on fail
		$villager=undef;
		$badguys=undef;
		quest::stoptimer(2);
		quest::signal(211089);
		quest::signal(211090);
		quest::signal(211091);
		quest::signal(211092);
		quest::signal(211093);
		quest::signal(211094);
		quest::signal(211095);
		quest::signal(211096);
		quest::signal(211097);
		quest::signal(211098);
		quest::signal(211099);
		quest::signal(211100);
		quest::signal(211101);
		quest::signal(211102);
		quest::signal(211103);
		quest::signal(211104);
		quest::signal(211107);
		quest::signal(211108);
		quest::signal(211109);
		
	}
	if($timer == 1 && $badguys == 12) {
		quest::spawn2(211105,0,0,456,1374,-113,131); #hail version of Rhaliq
		quest::updatespawntimer(44016,259200000); #Rhaliq Trell 3 days on win
		$villager=undef;
		$badguys=undef;
		quest::stoptimer(2);
		quest::signal(211089);
		quest::signal(211090);
		quest::signal(211091);
		quest::signal(211092);
		quest::signal(211093);
		quest::signal(211094);
		quest::signal(211095);
		quest::signal(211096);
		quest::signal(211097);
		quest::signal(211098);
		quest::signal(211099);
		quest::signal(211100);
		quest::signal(211101);
		quest::signal(211102);
		quest::signal(211103);
		quest::signal(211104);
		quest::signal(211107);
		quest::signal(211108);
		quest::signal(211109);
		
	}
	if($timer == 2) {
		quest::updatespawntimer(44016,86400000); #Rhaliq Trell 24 hours on fail
		$villager=undef;
		$badguys=undef;
		quest::signal(211089);
		quest::signal(211090);
		quest::signal(211091);
		quest::signal(211092);
		quest::signal(211093);
		quest::signal(211094);
		quest::signal(211095);
		quest::signal(211096);
		quest::signal(211097);
		quest::signal(211098);
		quest::signal(211099);
		quest::signal(211100);
		quest::signal(211101);
		quest::signal(211102);
		quest::signal(211103);
		quest::signal(211104);
		quest::signal(211107);
		quest::signal(211108);
		quest::signal(211109);
		
	}
}
