# items: 58239
sub EVENT_SAY {
	quest::emote("You got my peeps, ^@&*#*@-!?");
}

sub EVENT_ITEM {
	if(quest::istaskactivityactive(222,13)) {
		if (plugin::check_handin(\%itemcount, 58239 => 1)) {
			my $npcid = 999100;
			my $x = $npc->GetX();
    			my $y = $npc->GetY();
    			my $z = $npc->GetZ();
    			my $h = $npc->GetHeading();

    			quest::spawn2(999022,0,0,$x,$y,$z,$h); #kos paulie
			quest::signalwith($npcid,1);
			quest::targlobal("halloween_lock_paulie",$location,"M25",0,0,0);
			quest::depop();
		}
	}
}