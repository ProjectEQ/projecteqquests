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


sub EVENT_AGGRO {
   quest::settimer(1,45);
}

sub EVENT_TIMER {
  if($timer == 1) {
   $entid1 = quest::spawn2(quest::ChooseRandom(284098,284107),0,0,-170,-884,3,114); # NPC(s): #Rav_Pizak (284098), #Rav_Pizak (284107)
   $entid2 = quest::spawn2(quest::ChooseRandom(284098,284107),0,0,-167,-792,3,136); # NPC(s): #Rav_Pizak (284098), #Rav_Pizak (284107)
   $entid3 = quest::spawn2(quest::ChooseRandom(284098,284107),0,0,-170,-884,3,114); # NPC(s): #Rav_Pizak (284098), #Rav_Pizak (284107)
   $entid4 = quest::spawn2(quest::ChooseRandom(284098,284107),0,0,-167,-792,3,136); # NPC(s): #Rav_Pizak (284098), #Rav_Pizak (284107)

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
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::stoptimer(1);
}

sub EVENT_COMBAT {
  if($combat_state == 0) {
    quest::stoptimer(1);
    quest::depopall(284098);
    quest::depopall(284107);
  }
}
