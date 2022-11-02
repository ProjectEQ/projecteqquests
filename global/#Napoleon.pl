sub EVENT_SAY {
	if(quest::istaskactivityactive(500222,10)) {
		if($text=~/Hail/i) {
			my $npcid = 999100;
			my $location = plugin::GetRatLocation("halloween_ratter_napoleon");
			my $x = $npc->GetX();
    			my $y = $npc->GetY();
    			my $z = $npc->GetZ();
    			my $h = $npc->GetHeading();

    			quest::spawn2(999019,0,0,$x,$y,$z,$h); #kos napoleon
			quest::signalwith($npcid,1);
			quest::targlobal("halloween_lock_napoleon",$location,"M25",0,0,0);
			quest::depop();
		}
	}
	else {
		quest::emote("stands on his hind legs and sniffs you. You are uninteresting to him.");
	}
}