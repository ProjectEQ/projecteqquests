#Tunat Event

sub EVENT_COMBAT {

  if ($combat_state == 1) {
quest::settimer("DT",1); 
}

if ($combat_state == 0) {
$npc->SetHP($npc->GetMaxHP() * 1);
quest::stoptimer("DT"); 
$npc->WipeHateList();
#quest::shout("reset");
}
}

sub EVENT_TIMER {

	if ($timer eq "DT")
	{
		quest::settimer("DT",10);
		quest::stoptimer("DT");
		my $b = $npc->GetTarget();
		if ($b)
		{
			my $a = 0; if ($b) { $a = $b->GetID(); }
			plugin::CastOnTarget(982);
		}
		$npc->WipeHateList();
	}

if ($timer eq "Heal") {
quest::stoptimer("Heal");
$DragonCheck = $entity_list->GetMobByNpcTypeID(298114);
$DragonID = $DragonCheck->GetID();
quest::doanim(44);
$npc->CastSpell(13, $DragonID);
  }
}


sub EVENT_SIGNAL {

#Clear to attack him
if ($signal == 1) {
quest::settimer("Heal",1);

}
}

