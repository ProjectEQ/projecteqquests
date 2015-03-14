sub EVENT_SPAWN {
  quest::setnexthpevent(20);
}
sub EVENT_HP {
  if($hpevent == 20) {
    $target = $npc->GetHateTop();
    $npc->CastSpell(1387,$target->GetID());
  }
}