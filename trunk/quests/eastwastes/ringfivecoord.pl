# Coordinator mob for Coldain Ring 5 quest
 
my $entid1;
my $entid2;
my $entid3;
my $entid4;
my $entid5;
 
sub EVENT_SIGNAL {
  # made these locs up, but they work
  $entid1 = quest::spawn2(116568, 0, 0, -650, -2744, 180, 45);
  $entid2 = quest::spawn2(116546, 0, 0, -654, -2723, 180, 45);
  $entid3 = quest::spawn2(116546, 0, 0, -643, -2768, 180, 45);
  $entid4 = quest::spawn2(116544, 0, 0, -681, -2739, 180, 45);
  $entid5 = quest::spawn2(116544, 0, 0, -673, -2766, 180, 45);
 
  quest::settimer("move", 10);
  quest::settimer("depop", 600);
}
 
sub EVENT_TIMER {
 
  my $mob1 = $entity_list->GetMobID($entid1);
  my $mob2 = $entity_list->GetMobID($entid2);
  my $mob3 = $entity_list->GetMobID($entid3);
  my $mob4 = $entity_list->GetMobID($entid4);
  my $mob5 = $entity_list->GetMobID($entid5);
 
  if ($timer eq "move") {
    quest::stoptimer("move");
    if ($mob1) {
      my $mobnpc1 = $mob1->CastToNPC();
      $mobnpc1->SaveGuardSpot(0);
      $mobnpc1->MoveTo(-369, -2628, 180);
    }
    if ($mob2) {
      my $mobnpc2 = $mob2->CastToNPC();
      $mobnpc2->SaveGuardSpot(0);
      $mobnpc2->MoveTo(-383, -2615, 180);
    }
    if ($mob3) {
      my $mobnpc3 = $mob3->CastToNPC();
      $mobnpc3->SaveGuardSpot(0);
      $mobnpc3->MoveTo(-369, -2652, 180);
    }
    if ($mob4) {
      my $mobnpc4 = $mob4->CastToNPC();
      $mobnpc4->SaveGuardSpot(0);
      $mobnpc4->MoveTo(-400, -2640, 183);
    }
    if ($mob5) {
      my $mobnpc5 = $mob5->CastToNPC();
      $mobnpc5->SaveGuardSpot(0);
      $mobnpc5->MoveTo(-389, -2649, 183);
    }
  }
 
  elsif ($timer eq "depop") {
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