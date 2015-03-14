#90%: Pixtt Xxeric Kex (flurries; spawns four ukun adds immediately) 
#80%: Pixtt Kretv Krakxt (mitigated AE rampage; spawns four ikaav hatchling adds if you take too long) 
#70%: Pixtt Riel Tavas (unstable construct adds if you take too long) CHECK
#60%: Zun`Muram Kvxe Pirik (single-target rampage; straight melee) 
#50%: Zun`Muram Yihst Vor (single-target rampage; straight melee) 
#40%: Zun`Muram Mordl Delt (single-target rampage; flurries; two "Zun`Muram Mordl Delt" adds) 
#30%: Zun`Muram Shaldn Boc (single-target rampage; straight melee - may AE rampage rarely..) 
#20%: Tunat`Muram Cuu Vauax (single-target rampage; AEs "Wave of Rage") 

sub EVENT_SPAWN {
$npc->SetHP($npc->GetMaxHP() * .5);
quest::setnexthpevent(41);
}

sub EVENT_COMBAT {

  if ($combat_state == 1) {
quest::settimer("Rampage", 20);
}

if (($combat_state == 0) &&  (!defined($qglobals{TunatOne_Dead})) ) {
quest::emote("calms down");
$npc->WipeHateList();
quest::depopall(298218);
quest::depopall(298112);
quest::spawn2(298114,0,0, 463.8, -170.8, 26.6, 54.9);
quest::depop();
}

if (($combat_state == 0) &&  (defined($qglobals{TunatOne_Dead})) ){
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
quest::stoptimer("Silence"); 
quest::stoptimer("Discord");
quest::stoptimer("Gaze");
quest::stoptimer("Haste");
quest::stoptimer("Dot");
$npc->WipeHateList();
quest::depopall(298112);
quest::spawn2(298155,0,0, 309, -170.8, 21.3, 59.4);
quest::depop();
}

}

sub EVENT_HP  { 

if ($hpevent == 41) {
quest::spawn2(298215,0,0, $x, $y, $z, $h);
quest::depop();
}
}

sub EVENT_TIMER {
if ($timer eq "Rampage") {
quest::stoptimer("Rampage");
my $TimeRA = quest::ChooseRandom(11,15,18,19,20,21,22,23,25);
quest::settimer("getclients", $TimeRA);
$entity_list->MessageClose($npc, 1, 200, 15, "Zun'Muram Yihst Vor enters into a blind rage");
  }

#####################################
##########AE RAMPAGE#################
#####################################
  if ($timer eq "getclients") {
  $entity_list->MessageClose($npc, 1, 200, 13, "Zun'Muram Yihst Vor goes on a RAMPAGE");
#  quest::stoptimer("getclients");
  
   
  my $list_check = 0;

  for ($list_check = 0; $list_check < 2000; $list_check++) {

  $client_search = $entity_list->GetClientByID($list_check);
     
  if ($client_search) {
  my $distanceCHK = $client_search->CalculateDistance($x, $y, $z);
#  quest::shout("Distance is $distanceCHK ");
        if ($distanceCHK <= 30) {
        my $rampage = quest::ChooseRandom(4241, 4321,4477,4632,4712,4842, 4912, 5020, 5122, 5317, 5451, 5555, 5820);
        $client_search->Damage($npc, $rampage, 7477, 1, 1, -1, 0);
        $client_search->Message(13, "Zun'Muram Yihst Vor hits YOU for $rampage points of damage" );
                            }

}
}
}
############################################################    
############################################################    
############################################################ 
}

