sub EVENT_DEATH {
  @spawnChance = (1,2,3,4,5);
  my $a = $spawnChance[int(rand(scalar @spawnChance))];
  if ($a == 1) {
    quest::spawn(179165,0,0,$x,$y,$z);
  }
}

#End of File, Zone:akheva  NPC:179025 -- Sacrificed_Remains