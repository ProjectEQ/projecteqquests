my $x;
my $y;
my $z;
my $h;
my $entid1;
my $entid2;
my $entid3;
my $entid4;
my $entid5;
my $mob1;
my $mob2;
my $mob3;
my $mob4;
my $mob5;
my $mobnpc1;
my $mobnpc2;
my $mobnpc3;
my $mobnpc4;
my $mobnpc5;

sub EVENT_SPAWN {
  quest::setnexthpevent(80);
  # quest::settimer(1,2700);
}

# sub EVENT_COMBAT {
#  if ($combat_state == 0){
#   quest::depop_withtimer();
#  }
# } 

sub EVENT_HP {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  $h = $npc->GetHeading();
   
  if ($hpevent == 80) {
    quest::setnexthpevent(50);
    $entid1 = quest::spawn2(126265,0,0,$x+10,$y+10,$z,$h); # rallos puppet
    $entid2 = quest::spawn2(126163,0,0,$x-10,$y-10,$z,$h); # tunare puppet
    $entid3 = quest::spawn2(126153,0,0,$x+5,$y+5,$z,$h); # innoruuk puppet
    $mob1 = $entity_list->GetMobID($entid1);
    $mob2 = $entity_list->GetMobID($entid2);
    $mob3 = $entity_list->GetMobID($entid3);
    $mobnpc1 = $mob1->CastToNPC();
    $mobnpc2 = $mob2->CastToNPC();
    $mobnpc3 = $mob3->CastToNPC();
    $mobnpc1->AddToHateList($npc->GetHateTop(),1);
    $mobnpc2->AddToHateList($npc->GetHateTop(),1);
    $mobnpc3->AddToHateList($npc->GetHateTop(),1);
  }
  if ($hpevent == 50) {
    quest::setnexthpevent(20);
    $entid1 = quest::spawn2(126249,0,0,$x+10,$y+10,$z,$h); # solusek puppet
    $entid2 = quest::spawn2(126163,0,0,$x-10,$y-10,$z,$h); # tunare puppet
    $entid3 = quest::spawn2(126153,0,0,$x+5,$y+5,$z,$h); # innoruuk puppet
    $entid4 = quest::spawn2(126291,0,0,$x-5,$y-5,$z,$h); # erollisi puppet
    $mob1 = $entity_list->GetMobID($entid1);
    $mob2 = $entity_list->GetMobID($entid2);
    $mob3 = $entity_list->GetMobID($entid3);
    $mob4 = $entity_list->GetMobID($entid4);
    $mobnpc1 = $mob1->CastToNPC();
    $mobnpc2 = $mob2->CastToNPC();
    $mobnpc3 = $mob3->CastToNPC();
    $mobnpc4 = $mob4->CastToNPC();
    $mobnpc1->AddToHateList($npc->GetHateTop(),1);
    $mobnpc2->AddToHateList($npc->GetHateTop(),1);
    $mobnpc3->AddToHateList($npc->GetHateTop(),1);
    $mobnpc4->AddToHateList($npc->GetHateTop(),1);
  }
  if ($hpevent == 20) {
    $entid1 = quest::spawn2(126265,0,0,$x+10,$y+10,$z,$h); # rallos puppet
    $entid2 = quest::spawn2(126163,0,0,$x-10,$y-10,$z,$h); # tunare puppet
    $entid3 = quest::spawn2(126153,0,0,$x+5,$y+5,$z,$h); # innoruuk puppet
    $entid4 = quest::spawn2(126291,0,0,$x-5,$y-5,$z,$h); # erollisi puppet
    $entid5 = quest::spawn2(126246,0,0,$x+15,$y-15,$z,$h); # tribunal puppet
    $mob1 = $entity_list->GetMobID($entid1);
    $mob2 = $entity_list->GetMobID($entid2);
    $mob3 = $entity_list->GetMobID($entid3);
    $mob4 = $entity_list->GetMobID($entid4);
    $mob5 = $entity_list->GetMobID($entid5);
    $mobnpc1 = $mob1->CastToNPC();
    $mobnpc2 = $mob2->CastToNPC();
    $mobnpc3 = $mob3->CastToNPC();
    $mobnpc4 = $mob4->CastToNPC();
    $mobnpc5 = $mob5->CastToNPC();
    $mobnpc1->AddToHateList($npc->GetHateTop(),1);
    $mobnpc2->AddToHateList($npc->GetHateTop(),1);
    $mobnpc3->AddToHateList($npc->GetHateTop(),1);
    $mobnpc4->AddToHateList($npc->GetHateTop(),1);
    $mobnpc5->AddToHateList($npc->GetHateTop(),1);
  }
}

# sub EVENT_AGGRO {
#  quest::settimer("engaged",10800); #npc will despawn in 3hrs if not killed to # avoid leaving him up forever
# }

# sub EVENT_TIMER {
#  quest::depop_withtimer();
#  quest::stoptimer("engaged");
#  quest::stoptimer(1);
# }

# sub EVENT_DEATH_COMPLETE {
#  quest::stoptimer("engaged");
# }

# EOF zone: mischiefplane ID: 126160 NPC: #Bristlebane

