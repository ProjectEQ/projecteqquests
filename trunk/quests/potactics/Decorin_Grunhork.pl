#Spawn Tallon Zek
sub EVENT_DEATH_COMPLETE {
        quest::signalwith(214123, 214057, 0);
}

sub EVENT_SIGNAL {
        #event time expired, depop with respawn timer.
        quest::depop_withtimer();
}

sub EVENT_SPAWN {
    $trigger_up = $entity_list->GetMobByNpcTypeID(214123); 
	
	if (!$trigger_up) {
		quest::depop_withtimer();
	}
}

# End of File  Zone: PoTactics  ID: 214057 -- Decorin_Grunhork