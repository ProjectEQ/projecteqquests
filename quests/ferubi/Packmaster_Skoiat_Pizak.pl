my $mob1;
my $mob2;
my $entid1;
my $entid2;
my $mobnpc1;
my $mobnpc2;


sub EVENT_AGGRO {
   quest::settimer(1,60);
}

sub EVENT_TIMER {
  if($timer == 1) {
   $entid1 = quest::spawn2(284098,0,0,-170,-884,3,57);
   $entid2 = quest::spawn2(284098,0,0,-167,-792,3,68);

   $mob1 = $entity_list->GetMobID($entid1);
   $mob2 = $entity_list->GetMobID($entid2);

   $mobnpc1 = $mob1->CastToNPC();
   $mobnpc2 = $mob2->CastToNPC();

   $mobnpc1->AddToHateList($npc->GetHateTop()); 
   $mobnpc2->AddToHateList($npc->GetHateTop());

  }
}
sub EVENT_DEATH {
  quest::stoptimer(1);
}

sub EVENT_COMBAT {
  if($combat_state ==0) {
  quest::stoptimer(1);
  quest::depopall(284098);
  }
  }
