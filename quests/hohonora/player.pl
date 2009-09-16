sub EVENT_CLICKDOOR
{
	my $d_id = ($doorid % 256);
	if($d_id == 19 || $d_id == 20)
	{
		if(defined $qglobals{pop_poj_mavuin} && defined $qglobals{pop_poj_tribunal} && defined $qglobals{pop_poj_valor_storms} && defined $qglobals{pop_pov_aerin_dar} && defined $qglobals{pop_hoh_faye} && defined $qglobals{pop_hoh_trell} && defined $qglobals{pop_hoh_garn})
		{
			if(quest::has_zone_flag(220) != 1)
			{
				quest::set_zone_flag(220);
				$client->Message(15, "You have received a character flag!");
			}
		}
	}
}