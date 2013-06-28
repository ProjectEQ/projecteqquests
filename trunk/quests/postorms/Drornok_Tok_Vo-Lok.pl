#On aggro, will spawns 4 adds every 2 minutes,  Adds will aggro the tank
#After 30 minutes the event will depop along with all the frogs it adds.

my $entid1;
my $entid2;
my $entid3;
my $entid4;
my $mob1;
my $mob2;
my $mob3;
my $mob4;
my $mobnpc1;
my $mobnpc2;
my $mobnpc3;
my $mobnpc4;
my $frogid = 210246;

sub EVENT_AGGRO {
  quest::settimer(1,1800); # 30 minutes to depop
  quest::settimer(2,120); # 2 minutes to spawns
}

sub EVENT_TIMER {
  if ($timer == 1) {
    STOPFIGHT();
  }
  if ($timer == 2) {
    SPAWNADDS();
  }
}

sub EVENT_COMBAT {
  if($combat_state == 0) {
    quest::stoptimer(2);
    quest::depopall($frogid);
  }
}

sub SPAWNADDS {
  # Z+5 hills in the area - Don't want frogs stuck underground
  $entid1 = quest::spawn2($frogid,0,0,$x+5,$y+5,$z+5,$h);
  $entid2 = quest::spawn2($frogid,0,0,$x+5,$y-5,$z+5,$h);
  $entid3 = quest::spawn2($frogid,0,0,$x-5,$y+5,$z+5,$h);
  $entid4 = quest::spawn2($frogid,0,0,$x-5,$y-5,$z+5,$h);
  $mob1 = $entity_list->GetMobID($entid1);
  $mob2 = $entity_list->GetMobID($entid2);
  $mob3 = $entity_list->GetMobID($entid3);
  $mob4 = $entity_list->GetMobID($entid4);
  $mobnpc1 = $mob1->CastToNPC();
  $mobnpc2 = $mob2->CastToNPC();
  $mobnpc3 = $mob2->CastToNPC();
  $mobnpc4 = $mob2->CastToNPC();
  $mobnpc1->AddToHateList($npc->GetHateTop());
  $mobnpc2->AddToHateList($npc->GetHateTop());
  $mobnpc3->AddToHateList($npc->GetHateTop());
  $mobnpc4->AddToHateList($npc->GetHateTop());
}

sub STOPFIGHT {
  quest::stoptimer(1);
  quest::stoptimer(2);
  quest::depopall($frogid);
  quest::depop(); #Triggered doesn't need a repop timer
}

sub EVENT_DEATH_COMPLETE {
  quest::stoptimer(1);
  quest::stoptimer(2);
  quest::depopall($frogid);
}

#Used snippet from ferubi/Packmaster_Skoiat_Pizak.pl   Didn't see a name but giving credit where it is due
#Event by Chance -  If you break it, you fix it!