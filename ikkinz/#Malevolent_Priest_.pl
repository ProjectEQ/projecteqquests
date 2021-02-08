my $leash_x = 0;
my $leash_y = 0;
my $leash_z = 0;
my $leash_h = 0;
my $servitor_up = 1;

sub EVENT_SPAWN {
  #save spawn point
  $leash_x = $x;
  $leash_y = $y;
  $leash_z = $z;
  $leash_h = $h;
  #proximity = aggro range * 2
  my $aggro = 55 * 2;
  quest::set_proximity($x-$aggro,$x+$aggro,$y-$aggro,$y+$aggro);
  #make priests non aggro, etc.
  quest::modifynpcstat("special_attacks",ABfHG);
  	my @nlist = $entity_list->GetClientList();
	foreach my $n (@nlist){
		$n->SendMarqueeMessage(10,510,1,1,6000,"The Malevolent Priests have been defeated! Congratulations!");
	}
}

sub EVENT_ENTER {
  #timer to cast PBAE and servitor check
  if($servitor_up == 1) {
    quest::settimer(2,6);
  }
}

sub EVENT_AGGRO {
  #timer for leash 
  quest::settimer(1,1);
  #turn off timer PBAE once aggro happens. Mob AI will handle it now.
  quest::stoptimer(2);
}

sub EVENT_TIMER {
  if($timer == 1) {
    #leash boundaries
    if($x > 80 || $x < -35 || $y > -110 || $y < -300) {
      $npc->GMMove($leash_x,$leash_y,$leash_z,$leash_h);
    }
  } elsif($timer == 2) {
    my $rClient = $entity_list->GetRandomClient($x,$y,$z, 55);
    if ($rClient) { $npc->CastSpell(4991,$rClient->GetID()); }
    my $servitor = 0;
    if($entity_list->GetMobByNpcTypeID(294086)) { $servitor += 4; }
    if($entity_list->GetMobByNpcTypeID(294087)) { $servitor += 2; }
    if($entity_list->GetMobByNpcTypeID(294088)) { $servitor++; }
    if($entity_list->GetMobByNpcTypeID(294089)) { $servitor++; }
    if($entity_list->GetMobByNpcTypeID(294090)) { $servitor++; }
    #reduce HP by 10% per servitor killed ($npc->GetMaxHP() / 10) * (9-$servitor)
    $npc->SetHP($npc->GetMaxHP()-($npc->GetMaxHP() / 10) * (9-$servitor));
    #if no Constrained Servitors then activate aggro
    if($servitor == 0) {
      #set special attacks back to normal.
	  quest::modifynpcstat("special_attacks",TUMCNIDf);
	  $servitor_up = 0;
      quest::stoptimer(2);
	  quest::ze(0,"With the death of the final servitor, the two Malevolent Priests must fend for themselves!");
    }
  }
}

sub EVENT_DEATH_COMPLETE {
  if(!$entity_list->GetMobByNpcTypeID(294138)) { 
    INSTANCE_WIN(); 
  }
}

sub INSTANCE_WIN {
  #loot & advancement pieces
  my $expedition = quest::get_expedition();
  if ($expedition) {
    $expedition->SetLocked(true, ExpeditionLockMessage::Close);
    $expedition->AddReplayLockoutDuration(57600); # add 16 hours to lockout
    quest::spawn2(294140,0,0,-18,-139,-2,384); # NPC: a_pile_of_bones
    quest::spawn2(294139,0,0,-18,-271,-2,128); # NPC: a_pile_of_bones
    quest::ze(0,"The Malevolent Priests have been defeated! Though the legion may send replacements, you have finished what you sought out to do and delayed their progress for a time! Congratulations!");
    #plugin::ZoneMarquee(10,510,1,1,6000,"The Malevolent Priests have been defeated! Congratulations!");
  }
}
