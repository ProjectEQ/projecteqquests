sub EVENT_CLICKDOOR
{
	my $d_id = ($doorid % 256);
	if($d_id == 59)
	{
		if(defined $qglobals{pop_pon_construct} && defined $qglobals{pop_pon_hedge_jezith})
		{
			if(quest::has_zone_flag(221) != 1)
			{
				quest::set_zone_flag(221);
				$client->Message(15, "You have received a character flag!");
			}
		}
	}
}