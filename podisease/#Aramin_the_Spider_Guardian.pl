#This script is intended to pop 8 Arachnae Malevelers upon Aramin's death.

sub EVENT_DEATH_COMPLETE {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(205154,0,0,$x + 15,$y,$z,$h); # NPC: An_Arachnae_Maleveler
  quest::spawn2(205154,0,0,$x - 15,$y,$z,$h); # NPC: An_Arachnae_Maleveler
  quest::spawn2(205154,0,0,$x,$y + 15,$z,$h); # NPC: An_Arachnae_Maleveler
  quest::spawn2(205154,0,0,$x +15,$y + 15,$z,$h); # NPC: An_Arachnae_Maleveler
  quest::spawn2(205154,0,0,$x - 15,$y + 15,$z,$h); # NPC: An_Arachnae_Maleveler
  quest::spawn2(205154,0,0,$x,$y,$z,$h); # NPC: An_Arachnae_Maleveler
  quest::spawn2(205154,0,0,$x,$y,$z,$h); # NPC: An_Arachnae_Maleveler
  quest::spawn2(205154,0,0,$x,$y,$z,$h); # NPC: An_Arachnae_Maleveler
}

#Submitted by Jim Mills
