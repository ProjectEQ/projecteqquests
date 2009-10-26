$tic;
sub EVENT_SPAWN
{
	$tic = 0;
}

sub EVENT_WAYPOINT
{
	$tic++;
	if($tic == 14)
	{
		my $rand_say = int(rand(5)) + 1;
		if($rand_say == 1)
		{
			quest::say("So much carnage.");
		}
		elsif($rand_say == 2)
		{
			quest::say("Our soldiers can only take so much.");
		}
		elsif($rand_say == 3)
		{
			quest::say("Hang in there.");
		}
		elsif($rand_say == 4)
		{
			quest::say("These soldiers are exhausted, we must must get help soon.");
		}
		elsif($rand_say == 5)
		{
			quest::say("Hopefully these soldiers make it to see tomorrow.");
		}
		$tic = 0;
	}
}