#This version of Shei is a simple non-aggro merchant. When aggro'd, 4 adds will spawn. When killed, the true version of Shei will spawn. If anyone is killed by this mob, a random mob (of 4 possible) will spawn.

sub EVENT_AGGRO {
 quest::spawn2(179161,0,0,-1714,1128,19.7,128);
 quest::spawn2(179147,0,0,-1715,1034,19.7,0);
 quest::spawn2(179160,0,0,-1771,1126,18.2,82);
 quest::spawn2(179142,0,0,-1769,1035,18.2,45);
}

sub EVENT_DEATH {
 quest::spawn2(179032,0,0,-1736,1082,22.6,63);
}

sub EVENT_SLAY {
  my $a = quest::ChooseRandom(179161,179147,179160,179142);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
}

#Submitted by Jim Mills