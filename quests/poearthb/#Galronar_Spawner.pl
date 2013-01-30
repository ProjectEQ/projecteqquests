sub EVENT_SPAWN {
	quest::settimer("depop",61);
}

sub EVENT_TIMER {
    $check_boss = $entity_list->GetMobByNpcTypeID(222000);#rock_studded_champ
	
    if (!$check_boss && !defined $qglobals{poeb_Galronar} && !defined $qglobals{poeb_warlord}) {
			quest::spawn2(222018,0,0,$x,$y,$z,$h);  
        	quest::stoptimer("depop");
        	quest::depop_withtimer();
	}
}
