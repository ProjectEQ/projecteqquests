sub EVENT_SAY {
	if(quest::istaskactivityactive(500222,3)) {
		if($text=~/Hail/i) {
			my $npcid = 999100;
			my $location = plugin::GetRatLocation("halloween_ratter_zeus");
			my $x = $npc->GetX();
    			my $y = $npc->GetY();
    			my $z = $npc->GetZ();
    			my $h = $npc->GetHeading();

    			quest::spawn2(999014,0,0,$x,$y,$z,$h); #kos zeus
			quest::signalwith($npcid,1);
			quest::targlobal("halloween_lock_zeus",$location,"M35",0,0,0);
			quest::depop();
		}
	}
	else {
		quest::emote("stands on his hind legs and sniffs you. You are uninteresting to him.");
	}
}