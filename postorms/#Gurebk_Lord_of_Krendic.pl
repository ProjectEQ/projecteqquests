my $x;
my $y;
my $z;
my $h;

sub EVENT_SPAWN { 
	quest::settimer("engage", 1200);   # 20 min to engage
}

sub EVENT_AGGRO {
	quest::stoptimer("engage");
	quest::settimer("battle", 2700);   # 45 min to kill
	quest::settimer("ScorpAdds", 30);
}

sub EVENT_TIMER {
	if ($timer eq "engage") {	# if he was never engaged, respawns fake lord
		quest::stoptimer("engage");
		quest::spawn2(210178,0,0,$x,$y,$z,$h);
		quest::depop();
	}
	
	if ($timer eq "battle") {	# if he was not killed in time, despawns
		quest::depop();
	}
	
	if ($timer eq "ScorpAdds") {
	
		if($npc->IsEngaged()) {
			$x = $npc->GetX();
			$y = $npc->GetY();
			$z = $npc->GetZ();
			$h = $npc->GetHeading();
			quest::spawn2(210249,0,0,$x,$y,$z,$h);
			quest::spawn2(210249,0,0,$x,$y,$z,$h);
			quest::spawn2(210249,0,0,$x,$y,$z,$h);
			quest::spawn2(210249,0,0,$x,$y,$z,$h);
			quest::spawn2(210249,0,0,$x,$y,$z,$h);
			quest::spawn2(210249,0,0,$x,$y,$z,$h);
			} else {
			quest::stoptimer("ScorpAdds");
			}		
	}		
}

sub EVENT_DEATH_COMPLETE {
	quest::stoptimer("battle");
}

# End of File  Zone: PoStorms  ID: 210230 -- #Gurebk_Lord_of_Krendic
