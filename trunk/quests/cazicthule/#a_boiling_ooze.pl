# respawn acid mass on death

my $x;
my $y;
my $z;
my $h;

sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(48210,0,0,$x,$y,$z,$h);
}
# EOF zone: Cazicthule ID: NPC: #a_boiling_ooze