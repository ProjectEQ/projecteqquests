#This script is intended to pop 8 Arachnae Malevelers upon Aramin's death.

sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(205154,0,0,$x,$y,$z,$h);
  quest::spawn2(205154,0,0,$x,$y,$z,$h);
  quest::spawn2(205154,0,0,$x,$y,$z,$h);
  quest::spawn2(205154,0,0,$x,$y,$z,$h);
  quest::spawn2(205154,0,0,$x,$y,$z,$h);
  quest::spawn2(205154,0,0,$x,$y,$z,$h);
  quest::spawn2(205154,0,0,$x,$y,$z,$h);
  quest::spawn2(205154,0,0,$x,$y,$z,$h);
}

#Submitted by Jim Mills