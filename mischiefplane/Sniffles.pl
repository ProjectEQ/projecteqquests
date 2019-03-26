sub EVENT_DEATH_COMPLETE {
         my $x = $npc->GetX();
	 my $y = $npc->GetY();
	 my $z = $npc->GetZ();
	 my $h = $npc->GetHeading();
         quest::spawn2(126366,0,0,$x,$y,$z,$h); # NPC: Stomples
}         
