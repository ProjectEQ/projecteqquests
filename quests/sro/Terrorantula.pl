sub EVENT_DEATH { 
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::spawn2(35069,15,0,$x + 5,$y,$z,$h);
    quest::spawn2(35069,15,0,$x - 5,$y,$z,$h);
    quest::spawn2(35069,15,0,$x,$y + 5,$z,$h);
    quest::spawn2(35069,15,0,$x,$y - 5,$z,$h);
}
