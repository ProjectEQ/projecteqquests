my $x;
my $y;
my $z;
my $h;

sub EVENT_ITEM {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
    if (plugin::check_handin(\%itemcount, 67053 => 1)){
      quest::spawn2(123150,0,0,$x,$y,$z,$h);
      quest::depop();

}
  }