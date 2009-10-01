sub EVENT_SPAWN 
{
	quest::settimer("depop1",59);
}

sub EVENT_TIMER 
{
	if($timer eq "depop" && defined $qglobals{poeb_warlord}) {
		quest::stoptimer("depop1");
		quest::depop();
	}
    	else {
    		$check_boss = $entity_list->GetMobByNpcTypeID(222001);#stonefist_clansman
    		if (!$check_boss) {
			quest::spawn2(222017,0,0,$x,$y,$z,$h);  
        		quest::stoptimer("depop1");
        		quest::depop();
		}
	}
}
