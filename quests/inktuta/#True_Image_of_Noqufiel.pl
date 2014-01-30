# #True_Image_of_Noqufiel (296065)
# Need to add banish to entry door

my $current_hp;
my $instid;

sub EVENT_SPAWN {
	quest::signalwith(296075,2); #ask trigger what my hp should be
}


sub EVENT_AGGRO {
	$instid = quest::GetInstanceID("inktuta",0);
	quest::signalwith(296075,1); #tell trigger I'm aggro'd
}

sub EVENT_SIGNAL {
	if ($signal == 5) { #from trigger saying depop
		#remember HP at depop
		#10hp safety net to make sure signal doesn't land in normal signal range
		$current_hp = ($npc->GetHP() + 10); 
		quest::signalwith(296075, $current_hp); #tell trigger my HP
		quest::depop();
	} elsif ($signal == 3) { #from trigger saying swap
		quest::say("got swap signal");
		$current_hp = ($npc->GetHP() + 10); #remember HP at depop
		quest::signalwith(296075, $current_hp); #tell trigger my HP
		quest::spawn2(296066,0,0,$x,$y,$z,$h);
		quest::depop();
	} elsif ($signal == 4) { #from trigger saying banish
		my $TopHate = $npc->GetHateTop();
		quest::say("Begone " . $TopHate->GetName());
		$entity_list->HalveAggro($TopHate);
		my $MoveName = $entity_list->GetClientByName($TopHate->GetName());
		$MoveName->MovePCInstance(296, $instid, -62, -826, -126, 0);
	} else { #no defined signal means I'm receiving my HP from trigger
		$npc->SetHP($signal);
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::say("This is but a temporary setback. I will return.");
	quest::signalwith(296070,296065); #tell zone_status I died
}




##########
=cut old code
my $instid = 0;

sub EVENT_SPAWN {
  quest::settimer(1,20);  #move timer
}

sub EVENT_AGGRO {
  quest::spawn2(quest::ChooseRandom(296059,296060,296061,296062,296063,296064),0,0,-80,-670,-127,121);
  quest::settimer(3,60);
  $instid = quest::GetInstanceID("inktuta",0);
}

sub EVENT_TIMER {
  if($timer == 1) {
    quest::stoptimer(1);
    quest::settimer(2,20);
    $npc->GMMove(-103,-652,-127,125);	#move loc mirror
    $npc->WipeHateList();
  }
  elsif($timer == 2) {
    quest::stoptimer(2);
    quest::settimer(1,20);
    $npc->GMMove(-55,-653,-127,121);  #move loc true
    $npc->WipeHateList();
  }
  elsif($timer == 3) {
    #random cursebearer
    quest::spawn2(quest::ChooseRandom(296059,296060,296061,296062,296063,296064),0,0,-75,-653,-127,121);
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("This is but a temporary setback. I will return.");
  quest::depop(296066);
  quest::spawn2(296071,0,0,-55, -653, -127, $h); #Jomica_the_Unforgiven
  quest::spawn2(296068,0,0,-127,-652,-127, 121); #bones (loot)
  quest::setglobal($instid.'_inktuta_status',10,3,"H6");
}
=cut old code
##############