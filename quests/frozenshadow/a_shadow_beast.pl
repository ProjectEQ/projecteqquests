# give 1st floorshadow beast, shadowbone a chance to spawn an undead gnoll on death
#
#Angelox

sub EVENT_DEATH {
  my $gnoll = int(rand(100) + 1);
  if ($gnoll <= 10) {
    quest::spawn2(111158,0,0,$x,$y,$z,0);
    my $keyspawn = $entity_list->GetMobByNpcTypeID(111158);
    $keyspawn->AddToHateList($client, 1);
  }
}

sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("More souls for the mistress.");
	}
}

# EOF zone: frozenshadow

