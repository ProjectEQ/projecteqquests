sub EVENT_DEATH_COMPLETE {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::spawn2(174220,0,0,$x,$y,$z,$h);
}