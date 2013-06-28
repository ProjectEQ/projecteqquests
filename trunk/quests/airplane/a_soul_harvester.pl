# on death of soul harvester one a_soul tamer spawn
#

my $x;
my $y;
my $z;
my $h;
my $entid1;
my $mob1;
my $mobnpc1;

sub EVENT_DEATH_COMPLETE {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  $h = $npc->GetHeading();
  $entid1 = quest::spawn2(71100,0,0,$x,$y,$z,$h);
  $mob1 = $entity_list->GetMobID($entid1);
  $mobnpc1 = $mob1->CastToNPC();
  $mobnpc1->AddToHateList($npc->GetHateTop());
}
