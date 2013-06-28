sub EVENT_SPAWN { 
	quest::settimer("engage", 1200);   # 20 min to engage
}

sub EVENT_AGGRO {
	quest::stoptimer("engage");
	quest::settimer("battle", 2700);   # 45 min to kill
}

sub EVENT_TIMER {
	if ($timer eq "engage") {	# if he was never engaged, respawns fake lord
		quest::stoptimer("engage");

		my $x = $npc->GetX();
		my $y = $npc->GetY();
		my $z = $npc->GetZ();
		my $h = $npc->GetHeading();

		quest::spawn2(210176,0,0,$x,$y,$z,$h);
		quest::depop();
	}
	
	if ($timer eq "battle") {	# if he was not killed in time, despawns
		quest::depop();
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::stoptimer("battle");
}

# End of File  Zone: PoStorms  ID: 210229 -- #Neffiken_Lord_of_Kelek'Vor