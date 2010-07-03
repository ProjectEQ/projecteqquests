#BeginFile: barindu\player.pl
#Quest file for Barindu - Viarglug: Spawn Chest during Necromancer Epic 1.5 (Soulwhisper)

sub EVENT_LOOT {
  if(($looted_id == 11174) && ($corpse eq "#Viarglug") && (defined($qglobals{Soulwhisper}) && ($qglobals{Soulwhisper} == 2))) { #Whiahdi's Earthly Possessions
    $x = $client->GetX();
    $y = $client->GetY();
    $z = $client->GetZ();
    quest::spawn2(283157,0,0,$x,$y,$z,0); #a chest (Viarglug)
  }
}
#EndFile: barindu\player.pl