sub EVENT_DEATH_COMPLETE {
  my $num = plugin::RandomRange(5, 6);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();

  for (my $i = 1; $i <= $num; $i++) {
    my $xoff = plugin::RandomRange(5, 15);
    my $yoff = plugin::RandomRange(5, 15);
    my $adj = plugin::RandomRange(1, 2);

    if ($adj == 1) {
      quest::spawn2(24110, 15, 0, $x + $xoff, $y + $yoff, $z, $h);
    }
    else {
      quest::spawn2(24110, 15, 0, $x - $xoff, $y - $yoff, $z, $h);
    }
  }
}