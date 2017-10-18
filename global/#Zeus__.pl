sub EVENT_SPAWN {
	quest::settimer(1,1800);
}

sub EVENT_DEATH {
	my $x = $npc->GetX();
    	my $y = $npc->GetY();
    	my $z = $npc->GetZ();
    	my $h = $npc->GetHeading();

    	quest::spawn2(999024,0,0,$x,$y,$z,$h); #final zeus
	quest::depop();
}

sub EVENT_TIMER {
	quest::stoptimer(1);
	quest::say("Haha! Too slow!");
	my $newzone_zeus = plugin::GetRandomFreeLocation(0,20);
	my $npcid = 999100;
	quest::signalwith($npcid,2);
	quest::targlobal("halloween_ratter_zeus",$newzone_zeus,"F",0,0,0);
	quest::delglobal("halloween_lock_zeus");
	quest::depop();
}