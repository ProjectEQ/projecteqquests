# give 5th floor mobs a chance to spawn the enraged relative on death
#

srand;

sub EVENT_DEATH {
  $relative = int(rand(100) + 1);
  if ($relative <= 5) {
    $spawnenraged = quest::spawn2(111143,0,0,$x,$y,$z,0);
    $attack = $entity_list->GetMobID($spawnenraged);
    $enragedattack = $attack->CastToNPC();
    $enragedattack->AddToHateList($client, 1);
  }
}

sub EVENT_COMBAT {
	if($combat_state=1) {
		quest::say("Areeeeewwwww");
	}
}

# EOF zone: frozenshadow

