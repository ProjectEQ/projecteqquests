# #a_numbed_cursebearer NPCID 296062
my $new_speed;
my $current_target;
my $current_target_name;

sub EVENT_SPAWN {
	$current_target = $entity_list->GetRandomClient($x,$y,$z, 300);	
    $new_speed = 0.3;
	if ($current_target) {
		$current_target_name =$current_target->GetName(); 
		plugin::Debug("Targeting: $current_target_name");
		$npc->AddToHateList($current_target, 100000);
		quest::settimer("runspeed",10); #gradually speed up
		quest::settimer("checkdist",1);
	}
}

sub EVENT_AGGRO {
 $client->Message(15,"The thoughts of a cursed trusik invade your mind, 'You will share my fate. Do not attempt to resist. I am coming for you.'");
}

sub EVENT_TIMER {
  if($timer eq "runspeed") {
	$new_speed = ($new_speed * 1.1);
	quest::modifynpcstat("runspeed", $new_speed);
	if (!$npc->GetTarget()) {
        quest::stopalltimers();
		quest::depop();
	}
  } elsif ($timer eq "checkdist") {
	plugin::Debug("checkdist");
	my $tx=$current_target->GetX();
	my $ty=$current_target->GetY();
	my $tz=$current_target->GetZ();
	if ($current_target->CalculateDistance($x, $y, $z) >300) {
	  $npc->WipeHateList();
	  plugin::Debug("$current_target_name is too far away");
	  $current_target = $entity_list->GetRandomClient($x,$y,$z, 300);
	  $current_target_name =$current_target->GetName();
	  $npc->AddToHateList($current_target, 100000);
	  plugin::Debug("New target: $current_target_name");
	} 
  }
}

sub EVENT_SLAY {
  quest::stopalltimers();
  quest::depop();
}

sub EVENT_NPC_SLAY {
  quest::stopalltimers();
  quest::depop();
}
