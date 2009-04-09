#
#

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 7, $x + 7, $y - 7, $y + 7);
}

sub EVENT_ENTER {
  $cheater = $entity_list->GetMobByNpcTypeID(123011);
  if ($cheater) {
    $addcheater = $cheater->CastToNPC();
    $addcheater->AddToHateList($client, 1);
  }
}

# EOF NPC: A_Guardian_of_the_Shrine

