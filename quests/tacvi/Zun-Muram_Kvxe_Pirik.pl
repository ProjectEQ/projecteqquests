sub EVENT_AGGRO_SAY {

if (($text =~/gmclear/i) && ($name =~/Kayen/i)) {
$client->Message(15, "GM function $qglobals{ZunMMD} completed");

}

if (($text =~/hail/i) && ($name =~/Kayen/i)) {
quest::say("aggro $combat_state x ");
$client->Message(15, "Debug: New stats $AtkHit , $HasteHit , $NewAC, $MaxHit and $TooLow x $TooHigh x $OkHigh x $OkLow");
quest::say("Balance check: Defense is $qglobals{Balance_of_Defense} ");
quest::say("Balance check: Rage is $qglobals{Balance_of_Rage} ");
quest::say("Balance check: Fury is $qglobals{Balance_of_Fury} ");
quest::say("Balance check: Speed is $qglobals{Balance_of_Speed} ");
$client->Message(15, "GM function $qglobals{ZunMKP} completed");
}


}

sub EVENT_SAY {

if (($text =~/hail/i) && ($name =~/Kayen/i)) {
quest::say("NO aggro $combat_state x ");
$client->Message(15, "Debug: New stats $AtkHit , $HasteHit , $NewAC, $MaxHit and $TooLow x $TooHigh x $OkHigh x $OkLow");
quest::say("Balance check: Defense is $qglobals{Balance_of_Defense} ");
quest::say("Balance check: Rage is $qglobals{Balance_of_Rage} ");
quest::say("Balance check: Fury is $qglobals{Balance_of_Fury} ");
quest::say("Balance check: Speed is $qglobals{Balance_of_Speed} ");
$client->Message(15, "GM function $qglobals{ZunMKP} completed");
}
}


sub EVENT_SPAWN {
quest::delglobal("ZKP_Door");
quest::setglobal("ZKP_DoorExit", 1, 7, "F");
quest::delglobal("ZunMKP");
quest::spawn2(298125,0,0, 313.9, -728.7, -6.5, 61.9);
quest::spawn2(298128,0,0, 314, -642, -6.5, 59.9);
quest::spawn2(298127,0,0, 412, -646, -2.3, 1236);
quest::spawn2(298126,0,0, 427, -728, -6.5, 188);
#quest::settimer("Check", 1);
$NewAC = 1800;
quest::modifynpcstat("ac", 1800);
$MaxHit = 8800;
quest::modifynpcstat("max_hit", 8800);
$AtkHit = 2000;	#was 3500
quest::modifynpcstat("atk", 2000);	#was 3500
$HasteHit = -27;
quest::modifynpcstat("attack_speed", -27);
#quest::shout("Debug: New stats $AtkHit , $HasteHit , $NewAC, $MaxHit");
}

sub EVENT_COMBAT {
 
  if (($combat_state == 1) &&  (!defined($qglobals{ZunMKP})) ) {
quest::say("Come you fools! Show me your strongest warrior and I will show you my first victim");
$npc->SetOOCRegen(0);
quest::setnexthpevent(98);
}

if (($combat_state == 0) && (!defined($qglobals{ZunMKP})) ) {
quest::delglobal("ZKP_Door");
$npc->SetOOCRegen(0);
quest::delglobal("ZunMKP");
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
quest::stoptimer("CheckBalance"); 
quest::stoptimer("CheckBalanceB"); 
quest::stoptimer("CheckBalanceC"); 
$npc->WipeHateList();
quest::depop(298126);
quest::depop(298127);
quest::depop(298128); 
quest::depop(298125);
#quest::spawn2(298129,0,0, $x, $y, $z, $h);
#quest::depop();
quest::settimer("RepopAdds", 5);
}

if (($combat_state == 0) && (defined($qglobals{ZunMKP})) && ($MedState == 0) ) {
quest::delglobal("ZKP_Door");
$npc->SetOOCRegen(0);
quest::delglobal("ZunMKP");
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
quest::stoptimer("CheckBalance"); 
quest::stoptimer("CheckBalanceB"); 
quest::stoptimer("CheckBalanceC"); 
$npc->WipeHateList();
quest::depop(298126);
quest::depop(298127);
quest::depop(298128); 
quest::depop(298125);
quest::settimer("RepopAdds", 5);
#quest::spawn2(298129,0,0, $x, $y, $z, $h);
#quest::depop();
}


}

sub EVENT_HP  { 

if ($hpevent == 98) {
quest::setnexthpevent(91);
quest::setglobal("ZKP_Door", 1, 7, "F");
$NewAC = 1800;
quest::modifynpcstat("ac", 1800);
$MaxHit = 8800;
quest::modifynpcstat("max_hit", 8800);
$AtkHit = 2000;	#was 3500
quest::modifynpcstat("atk", 2200);	#was 3700
$HasteHit = -27;
quest::modifynpcstat("attack_speed", -33);
}

if ($hpevent == 91) {
quest::setnexthpevent(81);
quest::setglobal("ZunMKP", 1, 7, "M60");
quest::signalwith(298126,2,0);
quest::signalwith(298127,2,0);
quest::signalwith(298128,2,0);
quest::signalwith(298125,2,0);
quest::emote("enters a state of battle meditation.");
$npc->NPCSpecialAttacks("ABH", 0);
$npc->WipeHateList();
$npc->SetOOCRegen(0);
quest::settimer("CheckBalance", 40);
$TooHigh = 92;
$TooLow = 88;
$OkHigh = 91;
$OkLow = 89;
$MedState = 1;
}

if ($hpevent == 81) {
quest::setnexthpevent(71);
quest::setglobal("ZunMKP", 2, 7, "M60");
quest::signalwith(298126,2,0);
quest::signalwith(298127,2,0);
quest::signalwith(298128,2,0);
quest::signalwith(298125,2,0);
quest::emote("enters a state of battle meditation.");
$npc->NPCSpecialAttacks("ABH", 0);
$npc->WipeHateList();
$npc->SetOOCRegen(0);
quest::settimer("CheckBalance", 40);
$TooHigh = 82;
$TooLow = 78;
$OkHigh = 81;
$OkLow = 79;
$MedState = 1;
}

if ($hpevent == 71) {
quest::setnexthpevent(61);
quest::setglobal("ZunMKP", 3, 7, "M60");
quest::signalwith(298126,2,0);
quest::signalwith(298127,2,0);
quest::signalwith(298128,2,0);
quest::signalwith(298125,2,0);
quest::emote("enters a state of battle meditation.");
$npc->NPCSpecialAttacks("ABH", 0);
$npc->WipeHateList();
$npc->SetOOCRegen(0);
quest::settimer("CheckBalance", 40);
$TooHigh = 72;
$TooLow = 68;
$OkHigh = 71;
$OkLow = 69;
$MedState = 1;
}

if ($hpevent == 61) {
quest::setnexthpevent(51);
quest::setglobal("ZunMKP", 4, 7, "M60");
quest::signalwith(298126,2,0);
quest::signalwith(298127,2,0);
quest::signalwith(298128,2,0);
quest::signalwith(298125,2,0);
quest::emote("enters a state of battle meditation.");
$npc->NPCSpecialAttacks("ABH", 0);
$npc->WipeHateList();
$npc->SetOOCRegen(0);
quest::settimer("CheckBalance", 40);
$TooHigh = 62;
$TooLow = 58;
$OkHigh = 61;
$OkLow = 59;
$MedState = 1;
}

if ($hpevent == 51) {
quest::setnexthpevent(41);
quest::setglobal("ZunMKP", 5, 7, "M60");
quest::signalwith(298126,2,0);
quest::signalwith(298127,2,0);
quest::signalwith(298128,2,0);
quest::signalwith(298125,2,0);
quest::emote("enters a state of battle meditation.");
$npc->NPCSpecialAttacks("ABH", 0);
$npc->WipeHateList();
$npc->SetOOCRegen(0);
quest::settimer("CheckBalance", 40);
$TooHigh = 52;
$TooLow = 48;
$OkHigh = 51;
$OkLow = 49;
$MedState = 1;
}

if ($hpevent == 41) {
quest::setnexthpevent(31);
quest::setglobal("ZunMKP", 6, 7, "M60");
quest::signalwith(298126,2,0);
quest::signalwith(298127,2,0);
quest::signalwith(298128,2,0);
quest::signalwith(298125,2,0);
quest::emote("enters a state of battle meditation.");
$npc->NPCSpecialAttacks("ABH", 0);
$npc->WipeHateList();
$npc->SetOOCRegen(0);
quest::settimer("CheckBalance", 40);
$TooHigh = 42;
$TooLow = 38;
$OkHigh = 41;
$OkLow = 39;
$MedState = 1;
}

if ($hpevent == 31) {
quest::setnexthpevent(21);
quest::setglobal("ZunMKP", 7, 7, "M60");
quest::signalwith(298126,2,0);
quest::signalwith(298127,2,0);
quest::signalwith(298128,2,0);
quest::signalwith(298125,2,0);
quest::emote("enters a state of battle meditation.");
quest::settimer("CheckBalance", 40);
$npc->NPCSpecialAttacks("ABH", 0);
$npc->WipeHateList();
$npc->SetOOCRegen(0);
$TooHigh = 32;
$TooLow = 28;
$OkHigh = 31;
$OkLow = 29;
$MedState = 1;
}

if ($hpevent == 21) {
quest::setnexthpevent(0);
quest::emote("enters a state of seething rage as he accelerates his combat speed.");
$HasteHit = $HasteHit - 4;
quest::modifynpcstat("attack_speed", $HasteHit);
}

}



sub EVENT_TIMER {

if ($timer eq "Check") {
quest::stoptimer("Check");
if ( (defined($qglobals{ZunMKP})) && ($combat_state == 0) ) {
$npc->SetOOCRegen(0);
quest::delglobal("ZunMKP");
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
quest::stoptimer("CheckBalance"); 
quest::stoptimer("CheckBalanceB"); 
quest::stoptimer("CheckBalanceC"); 
$npc->WipeHateList();
quest::depop(298126);
quest::depop(298127);
quest::depop(298128); 
quest::depop(298125);
quest::settimer("RepopAdds", 5);
#quest::spawn2(298129,0,0, $x, $y, $z, $h);
#quest::depop();
  }
}

if ($timer eq "RepopAdds") {
quest::stoptimer("RepopAdds");
quest::spawn2(298125,0,0, 313.9, -728.7, -6.5, 61.9);
quest::spawn2(298128,0,0, 314, -642, -6.5, 59.9);
quest::spawn2(298127,0,0, 412, -646, -2.3, 1236);
quest::spawn2(298126,0,0, 427, -728, -6.5, 188);
$NewAC = 1800;
quest::modifynpcstat("ac", 1800);
$MaxHit = 8800;
quest::modifynpcstat("max_hit", 8800);
$AtkHit = 2000;	#was 3500
quest::modifynpcstat("atk", 2000); #was 3500
$HasteHit = -27;
quest::modifynpcstat("attack_speed", -27);
quest::emote("gazes inward");
  }


if ($timer eq "CheckBalance") {
quest::stoptimer("CheckBalance");
quest::settimer("CheckBalanceB", 15);
quest::signalwith(298126,1,0);
quest::signalwith(298127,1,0);
quest::signalwith(298128,1,0);
quest::signalwith(298125,1,0);
  }

if ($timer eq "CheckBalanceB") {
quest::stoptimer("CheckBalanceB");
quest::settimer("CheckBalanceC", 15);
quest::signalwith(298126,1,0);
quest::signalwith(298127,1,0);
quest::signalwith(298128,1,0);
quest::signalwith(298125,1,0);
  }

if ($timer eq "CheckBalanceC") {
quest::stoptimer("CheckBalanceC");
quest::settimer("FinalCheck", 5);
quest::signalwith(298126,1,0);
quest::signalwith(298127,1,0);
quest::signalwith(298128,1,0);
quest::signalwith(298125,1,0);
  }

if ($timer eq "FinalCheck") {
quest::stoptimer("FinalCheck");
quest::settimer("Revert", 2);
	if ($Defense == 0) {
       $NewAC = $NewAC + 150;
       quest::modifynpcstat("ac", $NewAC);
       $entity_list->MessageClose($npc, 1, 500, 7, "Your failure to balance the scales has added to Kvxe's already impressive skills."); 
       }
	if ($Rage == 0) {
       $MaxHit = $MaxHit + 400;
       quest::modifynpcstat("max_hit", $MaxHit);
       $entity_list->MessageClose($npc, 1, 500, 7, "Your failure to balance the scales has added to Kvxe's already impressive skills."); 
	}
	if ($Fury == 0) {
       $AtkHit = $AtkHit + 150;	#was 300
       quest::modifynpcstat("atk", $AtkHit);
	$entity_list->MessageClose($npc, 1, 500, 7, "Your failure to balance the scales has added to Kvxe's already impressive skills."); 
       }
	if ($Speed == 0) {
       $HasteHit = $HasteHit - 3;
	$entity_list->MessageClose($npc, 1, 500, 7, "Your failure to balance the scales has added to Kvxe's already impressive skills."); 
       quest::modifynpcstat("attack_speed", $HasteHit);
       }
}
if ($timer eq "Revert") {
quest::stoptimer("Revert");
quest::signalwith(298126,3,0);
quest::signalwith(298127,3,0);
quest::signalwith(298128,3,0);
quest::signalwith(298125,3,0);
$npc->NPCSpecialAttacks("SERFQMCNIfD", 0);
quest::emote("state of battle meditation comes to an end.");
$MedState = 0;
$npc->CastSpell(3230, $mobid);
#quest::shout("Debug: New stats $AtkHit , $HasteHit , $NewAC, $MaxHit");
  }


if ($timer eq "Stats") {
quest::stoptimer("Stats");
	if (( $qglobals{Balance_of_Defense} >= $TooHigh) || ( $qglobals{Balance_of_Defense} <= $TooLow)) {
	$entity_list->MessageClose($npc, 1, 500, 15, "Balance of Defense is falling out of balance"); 
       $Defense = 0;
	}
       if (( $qglobals{Balance_of_Defense} <= $OkHigh) && ( $qglobals{Balance_of_Defense} >= $OkLow)) {
	$entity_list->MessageClose($npc, 1, 500, 15, "Balance of Defense seems to be tipping in your favor.");
       $Defense = 1;
	}
            

	if (( $qglobals{Balance_of_Rage} >= $TooHigh) || ( $qglobals{Balance_of_Rage} <= $TooLow)) {
	$entity_list->MessageClose($npc, 1, 500, 15, "Balance of Rage is falling out of balance"); 
       $Rage = 0;
	}
       if (( $qglobals{Balance_of_Rage} <= $OkHigh) && ( $qglobals{Balance_of_Rage} >= $OkLow)) {
	$entity_list->MessageClose($npc, 1, 500, 15, "Balance of Rage seems to be tipping in your favor.");
       $Rage = 1;
	}


	if (( $qglobals{Balance_of_Fury} >= $TooHigh) || ( $qglobals{Balance_of_Fury} <= $TooLow)) {
	$entity_list->MessageClose($npc, 1, 500, 15, "Balance of Fury is falling out of balance"); 
       $Fury = 0;
	}
       if (( $qglobals{Balance_of_Fury} <= $OkHigh) && ( $qglobals{Balance_of_Fury} >= $OkLow)) {
	$entity_list->MessageClose($npc, 1, 500, 15, "Balance of Fury seems to be tipping in your favor.");
       $Fury = 1;
	}


       if (( $qglobals{Balance_of_Speed} >= $TooHigh) || ( $qglobals{Balance_of_Speed} <= $TooLow)) {
	$entity_list->MessageClose($npc, 1, 500, 15, "Balance of Speed is falling out of balance"); 
       $Speed = 0;
	}
       if (( $qglobals{Balance_of_Speed} <= $OkHigh) && ( $qglobals{Balance_of_Speed} >= $OkLow)) {
	$entity_list->MessageClose($npc, 1, 500, 15, "Balance of Speed seems to be tipping in your favor.");
       $Speed = 1;
	}
  }

}
 
sub EVENT_SIGNAL {

if ($signal == 1) {
#quest::shout("Balance check: Defense is $qglobals{Balance_of_Defense} ");
#quest::shout("Balance check: Rage is $qglobals{Balance_of_Rage} ");
#quest::shout("Balance check: Fury is $qglobals{Balance_of_Fury} ");
#quest::shout("Balance check: Speed is $qglobals{Balance_of_Speed} ");
#quest::shout(" $TooLow x $TooHigh x $OkHigh x $OkLow ");
quest::settimer("Stats", 2);

}
}

sub EVENT_DEATH {
quest::delglobal("ZKP_Door");
quest::delglobal("ZKP_DoorExit");
quest::say ("Your spirit has been judged and its existence deemed unfit to continue");
quest::delglobal("ZunMKP");
$timestamp = localtime(time);
quest::write("text_files/Tacvi.txt","[$timestamp]:$mname was killed by $name the $class.");
quest::depop(298126);
quest::depop(298127);
quest::depop(298128); 
quest::depop(298125);
}


