# spawn 3 A Freed Soul on death
# enchanter epic - Test of Charm

my $x;
my $y;
my $z;
my $h;
my $mob1;
my $mob2;
my $mob3;
my $mobid1;
my $mobid2;
my $mobid3;
my $mobattack1;
my $mobattack2;
my $mobattack3;

sub EVENT_DEATH_COMPLETE {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  $h = $npc->GetHeading();
  $mob1 = quest::spawn2(88093,0,0,$x,$y,$z,$h);
  $mob2 = quest::spawn2(88093,0,0,$x+5,$y+5,$z,$h);
  $mob3 = quest::spawn2(88093,0,0,$x-5,$y-5,$z,$h);
  $mobid1 = $entity_list->GetMobID($mob1);
  $mobid2 = $entity_list->GetMobID($mob2);
  $mobid3 = $entity_list->GetMobID($mob3);
  $mobattack1 = $mobid1->CastToNPC();
  $mobattack2 = $mobid2->CastToNPC();
  $mobattack3 = $mobid3->CastToNPC();
  $mobattack1->AddToHateList($npc->GetHateTop(),1);
  $mobattack2->AddToHateList($npc->GetHateTop(),1);
  $mobattack3->AddToHateList($npc->GetHateTop(),1);
}

# EOF zone: kaesora ID: 88087 NPC: enraged_spectral_librarian

