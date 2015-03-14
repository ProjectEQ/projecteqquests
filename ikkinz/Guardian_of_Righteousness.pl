#Hate list script from Trevius

sub EVENT_SPAWN {
  quest::setnexthpevent(75);
}

sub EVENT_HP {
  if($hpevent == 75) {
  quest::signalwith(294344,1,0);
  quest::setnexthpevent(47);
  quest::emote("motions for one of the Crumbling Monuments to come forth and aid in the attack!");
  quest::settimer(1,3);    
  }
  if($hpevent == 47) {
  quest::signalwith(294345,1,0);
  quest::setnexthpevent(26);
  quest::emote("motions for one of the Crumbling Monuments to come forth and aid in the attack!");
  quest::settimer(1,3);
  }
  if($hpevent == 26) {
  quest::signalwith(294346,1,0);
  quest::emote("motions for one of the Crumbling Monuments to come forth and aid in the attack!");
  quest::settimer(1,3);
  }
}
sub EVENT_COMBAT {
  if($combat_state == 0) {
    quest::settimer(2,120);
    }
}    
sub EVENT_TIMER {
if($timer == 1) {
  quest::stoptimer(1);
  my $NPCToRespond = 294578; # NPCID to call in to assist
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
if ($timer == 2) {
  quest::stoptimer(2);
  quest::depopall(294578);
  quest::setnexthpevent(75);
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::depopall(294578);
  quest::spawn2(294344,0,0,309,-595,2,154);
  quest::spawn2(294344,0,0,355,-644,2,181);
  quest::spawn2(294344,0,0,348,-714,2,203);
  quest::spawn2(294344,0,0,205,-589,2,97);
  quest::spawn2(294345,0,0,153,-643,2,73);
  quest::spawn2(294346,0,0,316,-778,2,224);
  quest::spawn2(294346,0,0,201,-776,2,29);
  quest::spawn2(294346,0,0,161,-717,2,52);
  quest::signalwith(294342,1,0);
  quest::signalwith(294631,1); #set lockout
  $entity_list->FindDoor(11)->SetLockPick(0);
}
