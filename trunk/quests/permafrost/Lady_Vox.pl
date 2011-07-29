# Attempt to limit players level 53 and over from engaging nagafen and vox.
# Player will be banished to just outside the permafrost zone in everfrost.
my $SpawnX = 0;
my $SpawnY = 0;
my $SpawnZ = 0;
my $SpawnH = 0;

sub EVENT_SPAWN {
  $SpawnX = $x;
  $SpawnY = $y;
  $SpawnZ = $z;
  $SpawnH = $h;
  my $range = 200;
  my $range2 = 88;
  quest::set_proximity($x - $range, $x + $range, $y - $range2, $y + $range);
  quest::setnexthpevent(96);
}

sub EVENT_HP {
  #if my HP are dropping make certain the timer is running
  #this gets around 100% pet tanking, because the owner is
  #on the aggro list but with 0's and EVENT_AGGRO isn't firing.
  quest::stoptimer(1);
  EVENT_AGGRO();
  #backup safety check
  quest::setnexthpevent(int($npc->GetHPRatio())-9);
}

sub EVENT_ENTER {
  if (($ulevel >= 53) && ($status < 80)) {
    quest::echo(0, "I will not fight you, but I will banish you!");
    $client->MovePC(30,-7024,2020,-60.7,0);
  }
}

sub EVENT_AGGRO {
  # a 1 second leash timer.
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if ($timer == 1) {
    if($x < -431 || $x > -85 || $y < 770 || $y > 1090 || $z < -50) {
      WIPE_AGGRO();
    }
    my @hate_list = $npc->GetHateList();
	my $hate_count = @hate_list;
	if ($hate_count > 0) {
      foreach $ent (@hate_list) {
        my $h_ent = $ent->GetEnt();
	    my $h_dmg = $ent->GetDamage();
	    my $h_hate = $ent->GetHate();
        if ($h_ent->IsClient()) {
          if ($h_ent->GetLevel() > 52) {
            quest::ze(0,"I will not fight you, but I will banish you!");
            $h_ent->CastToClient()->MovePC(30,-7024,2020,-60.7,0);
          }
        }
	  }
    } else {
      WIPE_AGGRO();
	}
  }
}

sub WIPE_AGGRO {
  $npc->BuffFadeAll();
  $npc->WipeHateList();
  $npc->SetHP($npc->GetMaxHP());
  $npc->GMMove($SpawnX,$SpawnY,$SpawnZ,$SpawnH);
  quest::stoptimer(1);
  quest::setnexthpevent(96);
}

# EOF zone: permafrost ID: 73057 NPC: Lady_Vox