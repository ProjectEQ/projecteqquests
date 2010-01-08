sub EVENT_SPAWN 
{
	quest::settimer("depop2",61);
}

sub EVENT_TIMER 
{
	if($timer eq "depop" && defined $qglobals{poeb_warlord}) {
		quest::stoptimer("depop2");
		quest::depop();
	}
    	else {
    		$check_boss = $entity_list->GetMobByNpcTypeID(222000);#rock_studded_champ
    		if (!$check_boss && !defined $qglobals{poeb_Galronor}) {
			quest::spawn2(222018,0,0,$x,$y,$z,$h);  
        		quest::stoptimer("depop2");
        		quest::depop();
		}
	}
}
