#90%: Pixtt Xxeric Kex (flurries; spawns four ukun adds immediately) 
#80%: Pixtt Kretv Krakxt (mitigated AE rampage; spawns four ikaav hatchling adds if you take too long) 
#70%: Pixtt Riel Tavas (unstable construct adds if you take too long) CHECK
#60%: Zun`Muram Kvxe Pirik (single-target rampage; straight melee) 
#50%: Zun`Muram Yihst Vor (single-target rampage; straight melee) 
#40%: Zun`Muram Mordl Delt (single-target rampage; flurries; two "Zun`Muram Mordl Delt" adds) 
#30%: Zun`Muram Shaldn Boc (single-target rampage; straight melee - may AE rampage rarely..) 
#20%: Tunat`Muram Cuu Vauax (single-target rampage; AEs "Wave of Rage") 

sub EVENT_SPAWN {
$npc->SetHP($npc->GetMaxHP() * .4);
quest::setnexthpevent(31);
quest::spawn2(298153,0,0, $x+15, $y+15, $z, 185);
quest::spawn2(298153,0,0, $x-15, $y-15, $z, 185);
}

sub EVENT_COMBAT {

  if ($combat_state == 1) {
}

if (($combat_state == 0) &&  (!defined($qglobals{TunatOne_Dead})) ) {
quest::emote("calms down");
$npc->WipeHateList();
quest::depopall(298153);
quest::depopall(298112);
quest::spawn2(298114,0,0, 463.8, -170.8, 26.6, 54.9);
quest::depop();
}


if (($combat_state == 0) &&  (defined($qglobals{TunatOne_Dead})) ){
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
quest::depopall(298153);
quest::depopall(298112);;
$npc->WipeHateList();
quest::depopall(298112);
quest::spawn2(298155,0,0, 309, -170.8, 21.3, 59.4);
quest::depop();
}

}

sub EVENT_HP  { 

if ($hpevent == 31) {
quest::spawn2(298216,0,0, $x, $y, $z, $h);
quest::depopall(298153);
quest::depop();
}
}


