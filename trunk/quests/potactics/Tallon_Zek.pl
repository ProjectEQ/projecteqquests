my $x_max = -445;
my $x_min = -770;
my $y_max = -1761;
my $y_min = -2158;
my $z_const = 207.7;

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::settimer("shadowstep", 20);
    quest::stoptimer("reset");
  }
  else {
    quest::stoptimer("shadowstep");
    quest::settimer("reset", 30);
  }
}

sub EVENT_TIMER {
  if ($timer eq "shadowstep") {
    my $new_x = int(rand(1) * ($x_max - $x_min + 1)) + $x_min;
    my $new_y = int(rand(1) * ($y_max - $y_min + 1)) + $y_min;
    my $new_z = $z_const;

    quest::emote("steps into the shadows.");
    $npc->GMMove($new_x, $new_y, $new_z);
  }
  else {
    quest::stoptimer("reset");
    $npc->GMMove(-620, -1959, 207.7);
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::stoptimer("shadowstep");
  quest::spawn2(218068,0,0,$x,$y,$z,$h);
}