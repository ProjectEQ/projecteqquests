sub EVENT_SPAWN {
  quest::setnexthpevent(50);
}

sub EVENT_HP {
if($hpevent == 50) {
  $check_named = $entity_list->GetMobByNpcTypeID(294617);
	if ($check_named) {
        $npc->SetHP(750000);
        quest::emote("The Oracle has been sustained by his companions.");
        }
        quest::setnexthpevent(50);
  }
}

sub EVENT_DEATH_COMPLETE {
	quest::signalwith(294631,7); #set lockout
}