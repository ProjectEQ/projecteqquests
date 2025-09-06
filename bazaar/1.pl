# quests/<zone_short>/1.pl

# Fixed NPC position
my $TX = -181.42;
my $TY = -806;
my $TZ = -4.10;

sub EVENT_SPAWN {
  # Ensure exact spot
  $npc->GMMove($TX, $TY, $TZ, 0);

  # Very small proximity: ~1.5 units radius horizontally, ±0.10 vertically
  my $R = 1.5;      # horizontal half-size
  my $Z_PAD = 0.10; # vertical tolerance (tight!)

  my $nx = $npc->GetX();
  my $ny = $npc->GetY();
  my $nz = $npc->GetZ();

  quest::set_proximity(
    $nx - $R, $nx + $R,
    $ny - $R, $ny + $R,
    $nz - $Z_PAD, $nz + $Z_PAD,
    0
  );
}

sub EVENT_ENTER {
  # Require both: close horizontally AND nearly same Z
  my $dx = $client->GetX() - $npc->GetX();
  my $dy = $client->GetY() - $npc->GetY();
  my $dz = $client->GetZ() - $npc->GetZ();

  my $horiz = sqrt($dx*$dx + $dy*$dy);
  my $absdz = abs($dz);

  if ($horiz <= 1.5 && $absdz <= 0.10) {
    $client->MovePC(80, 7, 260, 2, 0);   # zone, x, y, z, heading
  }
  # else: do nothing (prevents triggering from below stairs)
}
