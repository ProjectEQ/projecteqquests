# EPIC CLERIC -skyfire-

sub EVENT_DEATH_COMPLETE {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
  quest::spawn2(91090,0,0,$x,$y,$z,$h); # Zordakalicus_Ragefire
}


#End of File, Zone:skyfire  NPC:32038 -- Zordak Ragefire
