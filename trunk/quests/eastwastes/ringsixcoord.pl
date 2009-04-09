# Coordinator mob for Coldain Ring 6 quest
 
my $entid1;
my $entid2;
my $entid3;
my $entid4;
my $entid5;
 
sub EVENT_SIGNAL {
  # made these locs up, but they work
  $entid1 = quest::spawn2(116566, 0, 0, -4446, -3350, 150, 74);
  $entid2 = quest::spawn2(116544, 0, 0, -4423, -3332, 150, 131);
  $entid3 = quest::spawn2(116544, 0, 0, -4391, -3353, 150, 191);
  $entid4 = quest::spawn2(116544, 0, 0, -4413, -3380, 150, 240);
  $entid5 = quest::spawn2(116544, 0, 0, -4443, -3371, 150, 36);
 
  quest::settimer("depop", 600);
}
 
sub EVENT_TIMER {
 
  my $mob1 = $entity_list->GetMobID($entid1);
  my $mob2 = $entity_list->GetMobID($entid2);
  my $mob3 = $entity_list->GetMobID($entid3);
  my $mob4 = $entity_list->GetMobID($entid4);
  my $mob5 = $entity_list->GetMobID($entid5);
 
  if ($timer eq "depop") {
    quest::stoptimer("depop");
    if ($mob1) {
      my $mobnpc1 = $mob1->CastToNPC();
      $mobnpc1->Depop();
    }
    if ($mob2) {
      my $mobnpc2 = $mob2->CastToNPC();
      $mobnpc2->Depop();
    }
    if ($mob3) {
      my $mobnpc3 = $mob3->CastToNPC();
      $mobnpc3->Depop();
    }
    if ($mob4) {
      my $mobnpc4 = $mob4->CastToNPC();
      $mobnpc4->Depop();
    }
    if ($mob5) {
      my $mobnpc5 = $mob5->CastToNPC();
      $mobnpc5->Depop();
    }
    quest::depop();
  }
}
 
# Quest by mystic414