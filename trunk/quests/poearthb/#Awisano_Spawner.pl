sub EVENT_SPAWN 
{
	quest::settimer("depop",60);
}

sub EVENT_TIMER 
{
	if(defined $qglobals{poeb_warlord} || $entity_list->GetMobByNpcTypeID(222002)) { #myrmadon_of_stone 
		quest::stoptimer("depop");
		quest::depop();
	}
    	else {
		quest::spawn2(222016,0,0,$x,$y,$z,$h); 
        	quest::stoptimer("depop");
        	quest::depop();
	}
}
      