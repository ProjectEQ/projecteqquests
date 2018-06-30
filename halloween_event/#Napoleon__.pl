sub EVENT_SPAWN {
	quest::settimer(1,1200);
}

sub EVENT_DEATH {
	my $x = $npc->GetX();
    	my $y = $npc->GetY();
    	my $z = $npc->GetZ();
    	my $h = $npc->GetHeading();

    	quest::spawn2(999029,0,0,$x,$y,$z,$h); #final napoleon
	quest::depop();
}

sub EVENT_TIMER {
	quest::stoptimer(1);
	quest::say("I guess you were never properly trained to fight.");
	my $newzone_napoleon = plugin::GetRandomFreeLocation(0,40);
	my $npcid = 999100;
	quest::signalwith($npcid,2);
	quest::targlobal("halloween_ratter_napoleon",$newzone_napoleon,"F",0,0,0);
	quest::delglobal("halloween_lock_napoleon");
	quest::depop();
}