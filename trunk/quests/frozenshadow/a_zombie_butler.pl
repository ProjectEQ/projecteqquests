# give some 3rd  floor mobs a chance to spawn #an_enraged_shadow_beast on death
#
#Angelox

srand;

sub EVENT_DEATH {
  $enrag2 = int(rand(100) + 1);
  if ($enrag2 <= 5) {
    $spawnenrag2 = quest::spawn2(111141,0,0,$x,$y,$z,0);
    $attack = $entity_list->GetMobID($spawnenrag2);
    $enrag2attack = $attack->CastToNPC();
    $enrag2attack->AddToHateList($client, 1);
  }
}

# EOF zone: frozenshadow

