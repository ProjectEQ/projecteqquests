sub EVENT_CLICKDOOR 
{
	my $d_id = ($doorid % 256);
	if($d_id == 7)
	{
		if(defined $qglobals{pop_poi_dragon}) 
		{
            		$client->Message(15,"You remember Nitram's words - 'three small turns to the right on the bottommost rivet should open the door'.");
            		quest::forcedooropen(7);
      		}
   	}
   	$qglobals{pop_poi_dragon}=undef;
}