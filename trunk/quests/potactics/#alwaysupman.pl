sub EVENT_SPAWN {
          quest::settimer("stampedecheck",180);
}

sub EVENT_TIMER {
     my $rallos = $entity_list->GetMobByNpcTypeID(214113);
          if(defined $qglobals{potac_stampede} || $rallos){
	}
          else {
          quest::unique_spawn(214124,189,0,1213,-639,-290);
        }
}
