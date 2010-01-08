sub EVENT_SPAWN 
{
	quest::settimer("depop",60);
}

sub EVENT_TIMER 
{
	if($timer eq "depop" && defined $qglobals{poeb_warlord}) {
		quest::stoptimer("depop");
		quest::depop();
	}
    	else {
    		$check_boss = $entity_list->GetMobByNpcTypeID(222002);#myrmadon_of_stone
    		if (!$check_boss && !defined $qglobals{poeb_Awisano}) {
			quest::spawn2(222016,0,0,$x,$y,$z,$h); 
        		quest::stoptimer("depop");
        		quest::depop();
		}
	}
}
      