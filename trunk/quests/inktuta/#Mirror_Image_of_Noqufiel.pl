# #Mirror_Image_of_Noqufiel NPCID 296066
# Need to add banish to entry door

sub EVENT_SPAWN {
	quest::settimer("detonate_check",1);
}

sub EVENT_AGGRO {
	quest::signalwith(296075,1); #tell trigger I'm aggro'd
	quest::say("sent aggro");
}

sub EVENT_SIGNAL {
	if ($signal == 5) { #from trigger saying depop
		quest::depop();
	} elsif ($signal == 3) { #from trigger saying swap
		quest::spawn2(296065,0,0,$x,$y,$z,$h);
		quest::depop();
	}
}

sub EVENT_TIMER {
	if ($timer eq "detonate_check") {
		if ($npc->GetHP() < ($npc->GetMaxHP() - 200)) {
			quest::stoptimer("detonate_check");
			quest::emote("shivers violently, as if about to explode");
			quest::settimer("detonate_now", 6);
		}
	} elsif ($timer eq "detonate_now") {
		$npc->CastSpell(2490,$client);
		quest::depop();
	}
}






##############
=cut old code
sub EVENT_SPAWN {
  quest::settimer(1,20);  #move timer
}

sub EVENT_TIMER {
  if($timer == 1) {
    quest::stoptimer(1);
    quest::settimer(2,20);
    $npc->GMMove(-55,-653,-127,121);  #move loc true
    $npc->WipeHateList();
  }
  elsif($timer == 2) {
    quest::stoptimer(2);
    quest::settimer(1,20);
    $npc->GMMove(-103,-652,-127,125);	#move loc mirror
    $npc->WipeHateList();
  }
}

sub EVENT_ATTACK {
  $npc->CastSpell(2490,$client);  #casts detonation on being attacked
}
=cut old code 
###################