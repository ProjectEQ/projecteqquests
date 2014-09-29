my $rage = 0;

sub EVENT_DEATH_COMPLETE {
  quest::signalwith(295130,1);
}

==Begin Test Chop - This doesn't error on my server, but going to try on PEQ
sub EVENT_ATTACK {
  #a pet does not trigger EVENT_AGGRO but does trigger EVENT_ATTACK
  AGGRO_ALL($userid);
}

sub EVENT_AGGRO {
  #a pet does not trigger EVENT_AGGRO but does trigger EVENT_ATTACK
  AGGRO_ALL($userid);
}

sub AGGRO_ALL {
  my $pc = $entity_list->GetMobByID($_[0]);
  if (!$pc->IsClient()) {
    #if the $pc is not a client, assume it is a pet and get the owner
	$pc = $entity_list->GetClientByID($pc->GetOwnerID());
  }
  #add $pc to everyone's hate list (including my own in case it was a pet)
  $entity_list->GetMobByNpcTypeID(295131)->AddToHateList($pc,1,0);
  $entity_list->GetMobByNpcTypeID(295132)->AddToHateList($pc,1,0);
  $entity_list->GetMobByNpcTypeID(295133)->AddToHateList($pc,1,0);
}
=cut

sub EVENT_SIGNAL {
	# signals from Iqthinxa Karnkvi
	# 2 - The ravs are not all within 10% of each other, get harder and add AE Ramp
	# 3 - You aren't the lowest HP so you need to emote as well
	# 1 - Back within threshold, get easier again
	if ($signal >= 2) {
		quest::modifynpcstat("max_hit",2250);
		quest::modifynpcstat("special_attacks","rFQfi");
		if ($signal == 3 && $rage == 0) {
			quest::emote("goes into a frenzy to protect its wounded pack mate");
			$rage = 1;
		}
	} elsif ($signal == 1) {
		quest::modifynpcstat("max_hit",2000);
		quest::modifynpcstat("special_attacks","RFQf");
		$rage = 0
	}
}