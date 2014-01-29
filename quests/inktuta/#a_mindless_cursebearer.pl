# #a_mindless_cursebearer NPCID 296061
my $new_speed;

sub EVENT_SPAWN {
	my $rClient = $entity_list->GetRandomClient($x,$y,$z, 1500);
	if ($rClient) {
		$rClient->Message(15,"The thoughts of a cursed trusik invade your mind, 'You will share my fate. Do not attempt to resist. I am coming for you.'");
		$npc->AddToHateList($rClient, 100000);
		quest::settimer(1,10); #gradually speed up
	}
}

sub EVENT_TIMER {
	$new_speed = $npc->GetRunspeed();
	$new_speed = ($new_speed * 1.1);
	quest::modifynpcstat("runspeed", $new_speed);
}

sub EVENT_SLAY {
  quest::depop();
}