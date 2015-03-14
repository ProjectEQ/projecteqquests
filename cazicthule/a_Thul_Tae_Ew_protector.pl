sub EVENT_DEATH_COMPLETE {
   my $a = 48215;
    
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
   
   #Spawns my mob at the location that just died
   quest::spawn2($a,0,0,$x,$y,$z,$h);
} 