#BeginFile: causeway\player.pl
#Quest file for Nobles Causeway - Tarlang: Spawn Chest during Necromancer Epic 1.5 (Soulwhisper)
sub EVENT_LOOT {
  if(($looted_id == 55855) && ($corpse eq "#Tarlang") && (defined($qglobals{Soulwhisper}) && ($qglobals{Soulwhisper} == 3))) { #Tarlang's Head
    $x = $client->GetX();
    $y = $client->GetY();
    $z = $client->GetZ();
    quest::spawn2(303120,0,0,$x,$y,$z,0); #a chest (Tarlang)
  }
}
#EndFile: causeway\player.pl