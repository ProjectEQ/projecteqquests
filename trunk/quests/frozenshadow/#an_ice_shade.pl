sub EVENT_DEATH {
  if(!$entity_list->GetMobByNpcTypeID(111144)){
    quest::spawn2(111144,0,0,-398,400,22,125);
    }
}

sub EVENT_COMBAT {
	if($combat_state=1) {
		quest::say("Areeeeewwwww");
	}
}
