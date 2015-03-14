#279020 #Main version
#Waves: 
#90 Ish, 2 Adds - Zun FD's, kite till poof #51
#70 Ish, 3 Adds - Zun FD's, kite till poof #52 
#50 Ish, 4 Adds- Zun FD's, Kite till Poof  #53
#30 Ish, 2 Adds- Zun stays up! Kite adds, kill Zun #51

sub EVENT_AGGRO_SAY {

if (($text =~/hail/i) && ($name =~/Kayen/i)) {
#quest::settimer("PartC",1);
$client->Message(15, "GM function $qglobals{ZunMMD} completed $combat_state AGG");
#quest::settimer("Check", 5);
}
}

sub EVENT_SAY {

if (($text =~/hail/i) && ($name =~/Kayen/i)) {
#quest::settimer("PartC",1);
$client->Message(15, "GM function $qglobals{ZunMMD} completed $combat_state NO AGG");
#quest::settimer("Check", 5);
}
}

sub EVENT_AGGRO {
$AggroState = 1;
#quest::shout("$AggroState");
}


sub EVENT_SPAWN {
quest::delglobal("ZMD_Door");
quest::setglobal("ZMD_DoorExit", 1, 7, "F");
$combat_state = 0;
quest::settimer("Check", 10);
if ($qglobals{ZunMMD} == 1) {
#$npc->SetHP($npc->GetMaxHP() * 0.9);
$npc->SetHP($npc->GetMaxHP() * 1);
quest::setnexthpevent(71);
}
if ($qglobals{ZunMMD} == 2) {
#$npc->SetHP($npc->GetMaxHP() * 0.7);
$npc->SetHP($npc->GetMaxHP() * 1);
quest::setnexthpevent(51);
}
if ($qglobals{ZunMMD} == 3) {
#$npc->SetHP($npc->GetMaxHP() * 0.5);
$npc->SetHP($npc->GetMaxHP() * 1);
quest::setnexthpevent(31);
}
#if ($qglobals{ZunMMD} == 4) {
#$npc->SetHP($npc->GetMaxHP() * 1);
#$npc->SetHP($npc->GetMaxHP() * 0.3);
#}
}

sub EVENT_COMBAT {
 
  if (($combat_state == 1) &&  (!defined($qglobals{ZunMMD})) ) {
quest::emote("looks furious");
quest::setnexthpevent(98);
}

if ($combat_state == 0) {
quest::delglobal("ZMD_Door");
quest::delglobal("ZunMMD");
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
$npc->WipeHateList();
quest::depopall(298151);
quest::depopall(298152);
quest::depopall(298153);
quest::depopall(886005);
quest::spawn2(298120,0,0, $x, $y, $z, $h);
$AggroState = 0;
#quest::shout("Com Zero.");
quest::depop();
}
}

sub EVENT_HP  { 

if ($hpevent == 98) {
quest::setnexthpevent(91);
quest::setglobal("ZMD_Door", 1, 7, "F");
}

if ($hpevent == 91) {
quest::setglobal("ZunMMD", 1, 7, "M30");
quest::spawn2(298150,0,0, 367, 130, -6.7, 185);
quest::spawn2(298150,0,0, 367, 151, -6.7, 197);
quest::spawn2(298205,0,0, $x, $y, $z, $h);
quest::depop();
}

if ($hpevent == 71) {
quest::setglobal("ZunMMD", 2, 7, "M30");
quest::spawn2(298151,0,0, 367, 175, -6.7, 185);
quest::spawn2(298151,0,0, 367, 111, -6.7, 197);
quest::spawn2(298151,0,0, $x, $y, $z, $h);
quest::spawn2(298205,0,0, $x, $y, $z, $h);
quest::depop();
}
if ($hpevent == 51) {
quest::setglobal("ZunMMD", 3, 7, "M30");
quest::spawn2(298152,0,0, 367, 175, -6.7, 185);
quest::spawn2(298152,0,0, 367, 111, -6.7, 197);
quest::spawn2(298152,0,0, 367, 130, -6.7, 185);
quest::spawn2(298152,0,0, 367, 151, -6.7, 197);
quest::spawn2(298205,0,0, $x, $y, $z, $h);
quest::depop();
}
if ($hpevent == 31) {
#quest::setglobal("ZunMMD", 4, 7, "M30");
quest::spawn2(298153,0,0, 367, 130, -6.7, 185);
quest::spawn2(298153,0,0, 367, 151, -6.7, 197);
}

}

sub EVENT_TIMER {

if ($timer eq "Check") {
#quest::shout("a $AggroState XXX.");
quest::stoptimer("Check");
if ( (defined($qglobals{ZunMMD})) && ($combat_state == 0) && ($AggroState == 0)) {
quest::delglobal("ZunMMD");
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down.");
$npc->WipeHateList();
#quest::spawn2(298120,0,0, $x, $y, $z, $h);
#quest::depop();
#quest::shout("b.");
$AggroState = 0;
  }
}

}



sub EVENT_DEATH {
#quest::emote ("text");
#quest::say ("text");
quest::depopall(298153);
quest::delglobal("ZunMMD");
$timestamp = localtime(time);
quest::write("text_files/Tacvi.txt","[$timestamp]:$mname was killed by $name the $class.");
quest::delglobal("ZMD_Door");
quest::delglobal("ZMD_DoorExit");
quest::signalwith(298221,1,0);;
}


