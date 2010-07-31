my $mob1;
my $mob2;
my $mob3;
my $mob4;
my $entid1;
my $entid2;
my $entid3;
my $entid4;
my $mobnpc1;
my $mobnpc2;
my $mobnpc3;
my $mobnpc4;


sub EVENT_AGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($timer == 1) {
   $entid1 = quest::spawn2(284093,0,0,1254,-563,106,35);
   $entid2 = quest::spawn2(284094,0,0,1256,-419,106,102);
   $entid3 = quest::spawn2(284095,0,0,1402,-418,106,164);
   $entid4 = quest::spawn2(284096,0,0,1400,-565,106,227);

   $mob1 = $entity_list->GetMobID($entid1);
   $mob2 = $entity_list->GetMobID($entid2);
   $mob3 = $entity_list->GetMobID($entid3);
   $mob4 = $entity_list->GetMobID($entid4);

   $mobnpc1 = $mob1->CastToNPC();
   $mobnpc2 = $mob2->CastToNPC();
   $mobnpc3 = $mob3->CastToNPC();
   $mobnpc4 = $mob4->CastToNPC();

   $mobnpc1->AddToHateList($npc->GetHateTop()); 
   $mobnpc2->AddToHateList($npc->GetHateTop());
   $mobnpc3->AddToHateList($npc->GetHateTop()); 
   $mobnpc4->AddToHateList($npc->GetHateTop()); 
   quest::stoptimer(1);
  }
}
sub EVENT_DEATH {
  quest::signalwith(284074,1,1);
}

sub EVENT_COMBAT {
  if($combat_state ==0) {
  quest::depopall(284093);
  quest::depopall(284094);
  quest::depopall(284095);
  quest::depopall(284096);
  quest::depop();
  }
  }






 