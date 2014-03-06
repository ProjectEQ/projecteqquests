#90%: Pixtt Xxeric Kex (flurries; spawns four ukun adds immediately) 
#80%: Pixtt Kretv Krakxt (mitigated AE rampage; spawns four ikaav hatchling adds if you take too long) 
#70%: Pixtt Riel Tavas (unstable construct adds if you take too long) CHECK
#60%: Zun`Muram Kvxe Pirik (single-target rampage; straight melee) 
#50%: Zun`Muram Yihst Vor (single-target rampage; straight melee) 
#40%: Zun`Muram Mordl Delt (single-target rampage; flurries; two "Zun`Muram Mordl Delt" adds) 
#30%: Zun`Muram Shaldn Boc (single-target rampage; straight melee - may AE rampage rarely..) 
#20%: Tunat`Muram Cuu Vauax (single-target rampage; AEs "Wave of Rage") 

sub EVENT_SPAWN {
$npc->SetHP($npc->GetMaxHP() * .3);
quest::setnexthpevent(21);
}

sub EVENT_COMBAT {

  if ($combat_state == 1) {
}

if (($combat_state == 0) &&  (!defined($qglobals{TunatOne_Dead})) ) {
quest::emote("calms down");
$npc->WipeHateList();
quest::depopall(888618);
quest::depopall(297012);
quest::spawn2(297014,0,0, 463.8, -170.8, 26.6, 54.9);
quest::depop();

if (($combat_state == 0) &&  (defined($qglobals{TunatOne_Dead})) ){
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
quest::depopall(888618);
quest::stoptimer("Dot");
$npc->WipeHateList();
quest::depopall(297012);
quest::spawn2(297055,0,0, 309, -170.8, 21.3, 59.4);
quest::depop();
}

}
}

sub EVENT_HP  { 

if ($hpevent == 21) {
quest::spawn2(888617,0,0, $x, $y, $z, $h);
quest::depop();
}
}




