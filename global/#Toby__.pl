sub EVENT_SPAWN {
	quest::settimer(1,1200);
}

sub EVENT_DEATH {
	my $x = $npc->GetX();
    	my $y = $npc->GetY();
    	my $z = $npc->GetZ();
    	my $h = $npc->GetHeading();

    	quest::spawn2(999027,0,0,$x,$y,$z,$h); #final toby
	quest::depop();
}

sub EVENT_TIMER {
	quest::stoptimer(1);
	quest::say("You fight like Roosevelt!");
	my $newzone_toby = plugin::GetRandomFreeLocation(0,30);
	my $npcid = 999100;
	quest::signalwith($npcid,2);
	quest::targlobal("halloween_ratter_toby",$newzone_toby,"F",0,0,0);
	quest::delglobal("halloween_lock_toby");
	quest::depop();
}

