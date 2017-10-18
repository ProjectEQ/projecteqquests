sub EVENT_SAY {
	if(quest::istaskactivityactive(222,7)) {
		if($text=~/Hail/i) {
			my $npcid = 999100;
			my $location = plugin::GetRatLocation("halloween_ratter_toby");
			my $x = $npc->GetX();
    			my $y = $npc->GetY();
    			my $z = $npc->GetZ();
    			my $h = $npc->GetHeading();

    			quest::spawn2(999017,0,0,$x,$y,$z,$h); #kos toby
			quest::signalwith($npcid,1);
			quest::targlobal("halloween_lock_toby",$location,"M25",0,0,0);
			quest::depop();
		}
	}
	else {
		quest::emote("stands on his hind legs and sniffs you. You are uninteresting to him.");
	}
}