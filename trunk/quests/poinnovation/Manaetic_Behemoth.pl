my $spawn = 0;

sub EVENT_SPAWN {

	quest::settimer(7,120);
	}

sub EVENT_SIGNAL {

if($signal == 1)
	{
	$spawn=$spawn += 1;
	}
}

sub EVENT_TIMER {

if($timer == 7 && !defined $spawn)
	{
		quest::spawn2(206074,0,0,$x,$y,$z,0);
		quest::depop();
		#update spawn timer after depop or mob will repop when zone resets
		#quest::updatespawntimer(spawn2.id,(int(rand(DB_Variance))+DB_Respawn-(DB_Variance/2))*1000); #variance setting
		quest::updatespawntimer(42135,(int(rand(25920))+129600-(25920/2))*1000); #respawn with variance
	}
if($timer == 7 && defined $spawn)
	{
	$spawn=undef;
	quest::stoptimer(7);
	quest::settimer(7,120);
	}
}
