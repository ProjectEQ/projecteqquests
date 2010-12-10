my $x_max = -445;
my $x_min = -770;
my $y_max = -1761;
my $y_min = -2158;
my $z_const = 207.7;

sub EVENT_SIGNAL {
  my $new_x = int(rand(1) * ($x_max - $x_min + 1)) + $x_min;
  my $new_y = int(rand(1) * ($y_max - $y_min + 1)) + $y_min;
  my $new_z = $z_const;

  quest::emote("steps into the shadows.");
  $npc->GMMove($new_x, $new_y, $new_z);
}

sub EVENT_DEATH {
  quest::spawn2(218068,0,0,$x,$y,$z,$h);
}