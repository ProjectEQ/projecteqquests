sub EVENT_SPAWN {
	plugin::RandomRoam(250, 250);
	quest::settimer(1,1);
	quest::settimer(2,1200);
	quest::SetRunning(1);
	quest::say("You're not getting my food, -!%+*@('[\!");
}

sub EVENT_DEATH {
	my $x = $npc->GetX();
    	my $y = $npc->GetY();
    	my $z = $npc->GetZ();
    	my $h = $npc->GetHeading();

    	quest::spawn2(999032,0,0,$x,$y,$z,$h); #final paulie
	quest::depop();
}

sub EVENT_TIMER {
	if($timer == 1){
		plugin::RandomRoam(250, 250);
	}
	if($timer == 2){
		quest::stoptimer(2);
		quest::say("I'm getting the ^@%)*& out of here!");
		my $newzone_paulie = plugin::GetRandomFreeLocation(1,40);
		my $npcid = 999100;
		quest::signalwith($npcid,2);
		quest::targlobal("halloween_ratter_paulie",$newzone_paulie,"F",0,0,0);
		quest::delglobal("halloween_lock_paulie");
		quest::depop();
	}
}

sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::stoptimer(1);
	}
}