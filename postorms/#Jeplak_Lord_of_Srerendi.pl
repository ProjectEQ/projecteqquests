my $x;
my $y;
my $z;
my $h;

sub EVENT_SPAWN { 
	quest::settimer("engage", 1200);   # 20 min to engage
	$x = $npc->GetX();
	$y = $npc->GetY();
	$z = $npc->GetZ();
	$h = $npc->GetHeading();
}

sub EVENT_AGGRO {
	quest::stoptimer("engage");
	quest::settimer("battle", 2700);   # 45 min to kill
}

sub EVENT_SLAY {
	$x = $npc->GetX();
	$y = $npc->GetY();
	$z = $npc->GetZ();
	$h = $npc->GetHeading();

	quest::spawn2(210233,0,0,$x,$y,$z,$h);	# spawn a mangled traveller
	quest::spawn2(210234,0,0,$x,$y,$z,$h);	# spawn a lost soul
}

sub EVENT_TIMER {
	if ($timer eq "engage") {	# if he was never engaged, respawns fake lord
		quest::stoptimer("engage");		
		quest::spawn2(210179,0,0,$x,$y,$z,$h);
		quest::depop();
	}
	
	if ($timer eq "battle") {	# if he was not killed in time, despawns
		quest::depop();
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::stoptimer("battle");
}

# End of File  Zone: PoStorms  ID: 210231 -- #Jeplak_Lord_of_Srerendi