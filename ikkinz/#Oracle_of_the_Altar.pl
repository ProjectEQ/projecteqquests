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
  quest::signalwith(294614, 1, 0); # NPC: #Trigger_Ikkinz_4
  quest::ze(0,"Oracle of the Altar's corpse crumbles to pieces almost instantly.  Whatever is the driving force behind this creature must be siphoning the energy back into itself.");
}
