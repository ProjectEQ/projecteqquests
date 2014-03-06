#90%: Pixtt Xxeric Kex (flurries; spawns four ukun adds immediately) CHECK
#80%: Pixtt Kretv Krakxt (mitigated AE rampage; spawns four ikaav hatchling adds if you take too long) 
#70%: Pixtt Riel Tavas (unstable construct adds if you take too long) 
#60%: Zun`Muram Kvxe Pirik (single-target rampage; straight melee) 
#50%: Zun`Muram Yihst Vor (single-target rampage; straight melee) 
#40%: Zun`Muram Mordl Delt (single-target rampage; flurries; two "Zun`Muram Mordl Delt" adds) 
#30%: Zun`Muram Shaldn Boc (single-target rampage; straight melee - may AE rampage rarely..) 
#20%: Tunat`Muram Cuu Vauax (single-target rampage; AEs "Wave of Rage") 

sub EVENT_SPAWN {
$npc->SetHP($npc->GetMaxHP() * .8);
quest::setnexthpevent(71);
}

sub EVENT_COMBAT {

  if ($combat_state == 1) {
quest::settimer("Soul",15);
quest::settimer("Adds",60);
quest::settimer("Rampage",10);
}

if (($combat_state == 0) &&  (!defined($qglobals{TunatOne_Dead})) ) {
quest::emote("calms down");
$npc->WipeHateList();
quest::depopall(298141);
quest::depopall(298142); 
quest::depopall(298143);
quest::depopall(298144);
quest::depopall(298112);
quest::spawn2(298114,0,0, 463.8, -170.8, 26.6, 54.9);
quest::depop();
}

if (($combat_state == 0) &&  (defined($qglobals{TunatOne_Dead})) ){
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
$npc->WipeHateList();
quest::depopall(298141);
quest::depopall(298142); 
quest::depopall(298143);
quest::depopall(298144);
quest::depopall(298112);
quest::spawn2(298155,0,0, 309, -170.8, 21.3, 59.4);
quest::depop();
}

}

sub EVENT_HP  { 

if ($hpevent == 71) {
quest::spawn2(298212,0,0, $x, $y, $z, $h);
quest::depopall(298141);
quest::depopall(298142); 
quest::depopall(298143);
quest::depopall(298144);
quest::depop();
}
}



sub EVENT_TIMER {

	if ($timer eq "Soul") {
		my $TimeA = quest::ChooseRandom(25,26,27,28,29,30,31,32,33,34,35);
		quest::stoptimer("Soul");
		quest::settimer("Soul", $TimeA);
		my $b = $npc->GetTarget();
		if ($b)
		{
			my $a = 0; if ($b) { $a = $b->GetID(); }
			plugin::CastOnTarget(852);
			#Soul Consump
		}
	}

if ($timer eq "Adds") {
quest::stoptimer("Adds");
quest::spawn2(298149,0,0, 349.297302246094, -213.105529785156, 21.4144954681396 , 225.125);
quest::spawn2(298149,0,0, 360.507293701172, -159.274215698242, 21.4144954681396 , 190); 
quest::spawn2(298149,0,0, 331.863159179688, -110.501838684082, 21.4144954681396 , 140.375); 
quest::spawn2(298149,0,0, 303.64501953125, -236.793533325195, 21.4144973754883 , 252.5);
  }

if ($timer eq "Rampage") {
quest::stoptimer("Rampage");
my $TimeRA = quest::ChooseRandom(12,15,17,20,25);
quest::settimer("getclients", $TimeRA);
  }

#####################################
##########AE RAMPAGE#################
#####################################
  if ($timer eq "getclients") {
  $entity_list->MessageClose($npc, 1, 200, 13, "Pixxt Kretv Krakxt Vor goes on a RAMPAGE");
#  quest::stoptimer("getclients");
  
   
  my $list_check = 0;

  for ($list_check = 0; $list_check < 1502; $list_check++) {

  $client_search = $entity_list->GetClientByID($list_check);
     
  if ($client_search) {
  my $distanceCHK = $client_search->CalculateDistance($x, $y, $z);
#  quest::shout("Distance is $distanceCHK ");
        if ($distanceCHK <= 30) {
        my $rampage = quest::ChooseRandom(4241, 4321,4477,4632,4712,4842, 4912, 5020, 5122, 5317, 5451, 5555, 5820);
        $client_search->Damage($npc, $rampage, 7477, 1, 1, -1, 0);
        $client_search->Message(13, "Pixxt Kretv Krakxt hits YOU for $rampage points of damage" );
                            }

}
}
}
############################################################    
############################################################    
############################################################ 
}



