# respawn bubbling on death

my $x;
my $y;
my $z;
my $h;

sub EVENT_DEATH_COMPLETE {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(48212,0,0,$x,$y,$z,$h); # NPC: #a_bubbling_ooze
}
# EOF zone: Cazicthule ID: NPC: #a_swirling_ooze 