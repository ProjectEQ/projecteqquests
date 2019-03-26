sub EVENT_SPAWN {
  quest::setnexthpevent(84);
}

sub EVENT_HP {
  if($hpevent == 84) {
  quest::signalwith(294605,1,0); # NPC: Altar_Monument
  quest::setnexthpevent(51);
  quest::emote("motions for one of the Altar Monuments to come forth to its aid.");
  quest::settimer(1,3);
  }
  if($hpevent == 51) {
  quest::signalwith(294606,1,0); # NPC: Altar_Monument
  quest::setnexthpevent(23);
  quest::emote("motions for one of the Altar Monuments to come forth to its aid.");
  quest::settimer(1,3);  
  }
  if($hpevent == 23) {
  quest::signalwith(294607,1,0); # NPC: Altar_Monument
  quest::emote("motions for one of the Altar Monuments to come forth to its aid.");
  quest::settimer(1,3);  
  }
}
sub EVENT_TIMER {
  quest::stoptimer(1);
  my $NPCToRespond = 294608; # NPCID to call in to assist
	my @hatelist = $npc->GetHateList();	# Get the NPC's current Hate List
	my $HateCount = @hatelist;	# Total mobs on the NPC's hate list
	my @npclist = $entity_list->GetNPCList();	# Get the full NPC list for the zone
	foreach $ent (@npclist)
	{
		if($ent->GetNPCTypeID() == $NPCToRespond)	# Verify that the current NPC being checked is the NPCID we want
		{
			my $RandomHateNum = plugin::RandomRange(0, $HateCount);	# Choose a random mob in the Hate List array
			my $RandomHateEnt = $hatelist[$RandomHateNum];	# Get the Hate list entry for the selected number of the array
			if ($RandomHateEnt && $RandomHateEnt->GetEnt())	# Verify that the hate entry exists and that we can get the entity
			{
				my $HateEnt = $RandomHateEnt->GetEnt();	# Get the hated entity
				$ent->AddToHateList($HateEnt, 1);	# Tell the current NPC to attack the random mob on the boss' hate list.
			}
		}
	}
}
sub EVENT_DEATH_COMPLETE {
  quest::depopall(294608);
  quest::spawn2(294607,0,0,309,-595,2,308); # NPC: Altar_Monument
  quest::spawn2(294607,0,0,355,-644,2,362); # NPC: Altar_Monument
  quest::spawn2(294607,0,0,348,-714,2,406); # NPC: Altar_Monument
  quest::spawn2(294607,0,0,205,-589,2,194); # NPC: Altar_Monument
  quest::spawn2(294605,0,0,153,-643,2,146); # NPC: Altar_Monument
  quest::spawn2(294606,0,0,316,-778,2,448); # NPC: Altar_Monument
  quest::spawn2(294606,0,0,201,-776,2,58); # NPC: Altar_Monument
  quest::spawn2(294606,0,0,161,-717,2,104); # NPC: Altar_Monument

  quest::signalwith(294614, 1, 0); # NPC: #Trigger_Ikkinz_4
  quest::ze(0,"Alter Overseer's corpse crumbles to pieces almost instantly.  Whatever is the driving force behind this creature must be siphoning the energy back into itself.");
}
