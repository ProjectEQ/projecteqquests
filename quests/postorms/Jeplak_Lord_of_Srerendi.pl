sub EVENT_SPAWN {	
	my $x = $npc->GetX();
	my $y = $npc->GetY();
	my $z = $npc->GetZ();
	my $h = $npc->GetHeading();
}

sub EVENT_SIGNAL {
	quest::spawn2(210231,0,0,$x,$y,$z,$h);
	quest::depop();
}

# End of File  Zone: PoStorms ID: 210179 -- Jeplak_Lord_of_Srerendi