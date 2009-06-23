sub EVENT_SPAWN {
          quest::settimer("stampedecheck",60);
}

sub EVENT_TIMER {
     my $rallos = $entity_list->GetMobByNpcTypeID(214113);
          if(defined $qglobals{potac_stampede} || $rallos){
	}
          else {
          quest::unique_spawn(214124,0,0,0,0,0);
        }
}
