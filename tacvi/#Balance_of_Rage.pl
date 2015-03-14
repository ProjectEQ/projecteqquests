#quest::delglobal("Pixtt_Kretv_Krakxt");
sub EVENT_SPAWN {
quest::setnexthpevent(99);
}

sub EVENT_HP  { 
if($hpevent == (99)) {
$nexthp = $hpevent - 1;
quest::setnexthpevent($nexthp);
}
if (($hpevent == (91)) && ($qglobals{ZunMKP} == 1)) {
$entity_list->MessageClose($npc, 1, 500, 15, "Balance of Rage seems to be tipping in your favor.");
}

if (($hpevent == (81)) && ($qglobals{ZunMKP} == 2)){
$entity_list->MessageClose($npc, 1, 500, 15, "Balance of Rage seems to be tipping in your favor.");
}

if (($hpevent == (71)) && ($qglobals{ZunMKP} == 3)) {
$entity_list->MessageClose($npc, 1, 500, 15, "Balance of Rage seems to be tipping in your favor.");
}

if (($hpevent == (61)) && ($qglobals{ZunMKP} == 4)) {
$entity_list->MessageClose($npc, 1, 500, 15, "Balance of Rage seems to be tipping in your favor.");
}

if (($hpevent == (51)) && ($qglobals{ZunMKP} == 5)) {
$entity_list->MessageClose($npc, 1, 500, 15, "Balance of Rage seems to be tipping in your favor.");
}

if (($hpevent == (41)) && ($qglobals{ZunMKP} == 6)) {
$entity_list->MessageClose($npc, 1, 500, 15, "Balance of Rage seems to be tipping in your favor.");
}

if (($hpevent == (31)) && ($qglobals{ZunMKP} == 7)) {
$entity_list->MessageClose($npc, 1, 500, 15, "Balance of Rage seems to be tipping in your favor.");
}

if ($hpevent == (11)) {
$entity_list->MessageClose($npc, 1, 500, 15, "Balance of Rage is restored.");
$npc->SetHP($npc->GetMaxHP() * 1);
}
if($hpevent == ($nexthp)) {
$nexthp = $hpevent - 1;
quest::setnexthpevent($nexthp);
}
}
sub EVENT_SIGNAL {

if ($signal == 1) {
quest::setglobal("Balance_of_Rage", $nexthp, 7, "M30");
quest::signalwith(298129,1,0);

}

if ($signal == 2) {
quest::delglobal("Balance_of_Rage");
$npc->NPCSpecialAttacks("TfD", 0);
$npc->SetHP($npc->GetMaxHP() * 1);
}
if ($signal == 3) {
quest::delglobal("Balance_of_Rage");
$npc->NPCSpecialAttacks("ABH", 0);
$npc->WipeHateList();
$npc->SetOOCRegen(0);
}
}
