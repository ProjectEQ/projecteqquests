
sub EVENT_SPAWN {
quest::delglobal("ZYV_Door");
quest::setglobal("ZYV_DoorExit", 1, 7, "F");
}

sub EVENT_COMBAT {

  if ($combat_state == 1) {
#quest::say("text");
quest::emote("raises his blade in battle");
quest::setnexthpevent(98);
quest::settimer("CharmWorkAround", 3);

}

if ($combat_state == 0) {
quest::delglobal("ZYV_Door");
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
quest::stoptimer("CharmWorkAround"); 
quest::stoptimer("Rampage");
quest::stoptimer("getclients");
$npc->WipeHateList();
quest::depopall(298208);
quest::depopall(298207); 
quest::depopall(298206);
#quest::spawn2(298208,0,0, 125.2, -165.3, -6.5, 189.1);
#quest::depop();
quest::settimer("DEPOPCHECK", 6);
}
}

sub EVENT_HP  { 

if ($hpevent == 98) {
quest::setnexthpevent(31);
quest::setglobal("ZYV_Door", 1, 7, "F");
}


if ($hpevent == 31) {
quest::setnexthpevent(0);
quest::settimer("Rampage", 1);
}

}



sub EVENT_TIMER {

if ($timer eq "DEPOPCHECK") {
quest::stoptimer("DEPOPCHECK");
$npc->WipeHateList();
quest::depopall(298208);
quest::depopall(298207); 
quest::depopall(298206);
}

if ($timer eq "CharmWorkAround") {
my $TimeC = quest::ChooseRandom(25,30,45,50,60);
quest::stoptimer("CharmWorkAround");
quest::settimer("CharmWorkAround", $TimeC);
my $rand = quest::ChooseRandom(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,25);
if ($rand == 1){quest::spawn2(298208,0,0, 307.454895019531, -490.046813964844, -6.58549547195435 , 127.125); }
if ($rand == 2){quest::spawn2(298208,0,0, 315.551025390625, -530.761657714844, -6.58549499511719 , 120.125); }
if ($rand == 3){quest::spawn2(298208,0,0, 341.977081298828, -534.34619140625, -6.58549451828003 , 69.75); }
if ($rand == 4){quest::spawn2(298208,0,0, 368.897308349609, -537.997802734375, -6.58549499511719 , 69.75); }
if ($rand == 5){quest::spawn2(298208,0,0, 390.290374755859, -540.900939941406, -6.58549642562866 , 69.75); }
if ($rand == 6){quest::spawn2(298208,0,0, 412.591491699219, -543.925048828125, -6.58549642562866 , 69.75); }
if ($rand == 7){quest::spawn2(298208,0,0, 430.079040527344, -527.278259277344, -6.58549642562866 , 33.25); }
if ($rand == 8){quest::spawn2(298208,0,0, 430.815460205078, -502.303436279297, -6.58549499511719 , 0.25); }
if ($rand == 9){quest::spawn2(298208,0,0, 430.815460205078, -469.967224121094, -6.58549451828003 , 0.25); }
if ($rand == 10){quest::spawn2(298208,0,0, 430.815460205078, -438.46240234375, -6.58549404144287 , 0.25); }
if ($rand == 11){quest::spawn2(298208,0,0, 412.538238525391, -431.668548583984, -6.58549499511719 , 206.625); }
if ($rand == 12){quest::spawn2(298208,0,0, 381.634765625, -435.093017578125, -6.58549451828003 , 187.875); }
if ($rand == 13){quest::spawn2(298208,0,0, 340.725036621094, -439.628021240234, -6.58549642562866 , 187.875); }
if ($rand == 14){quest::spawn2(298208,0,0, 323.007110595703, -457.134796142578, -6.58549499511719 , 136); }
if ($rand == 15){quest::spawn2(298208,0,0, 349.317718505859, -477.447204589844, -6.58549499511719 , 132.75); }
if ($rand == 16){quest::spawn2(298208,0,0, 345.255798339844, -514.062927246094, -6.58549642562866 , 132.75); }
if ($rand == 17){quest::spawn2(298208,0,0, 370.873199462891, -513.121643066406, -6.58549499511719 , 62.5); }
if ($rand == 18){quest::spawn2(298208,0,0, 407.691986083984, -511.763610839844, -6.58549642562866 , 62.5); }
if ($rand == 19){quest::spawn2(298208,0,0, 411.024047851562, -489.333618164062, -6.58549642562866 , 6.25); }
if ($rand == 20){quest::spawn2(298208,0,0, 413.691528320312, -462.215545654297, -6.58549451828003 , 4.125); }
if ($rand == 21){quest::spawn2(298208,0,0, 370.089538574219, -455.881469726562, -6.58549499511719 , 182.625); }
if ($rand == 22){quest::spawn2(298208,0,0, 368.176300048828, -481.808441162109, -6.58549642562866 , 131.125); }
if ($rand == 23){quest::spawn2(298208,0,0, 366.826416015625, -500.156097412109, -6.58549499511719 , 131.125); }
if ($rand == 24){quest::spawn2(298208,0,0, 383.021820068359, -489.043579101562, -6.58549499511719 , 6); }
}

if ($timer eq "Rampage") {
quest::stoptimer("Rampage");
my $TimeRA = quest::ChooseRandom(7);
quest::settimer("getclients", $TimeRA);
$entity_list->MessageClose($npc, 1, 200, 15, "Zun'Muram Yihst Vor enters into a blind rage");
  }

#####################################
##########AE RAMPAGE#################
#####################################
	if ($timer eq "getclients")
	{
		$entity_list->MessageClose($npc, 1, 200, 13, "Zun'Muram Yihst Vor goes on a RAMPAGE");
#		quest::stoptimer("getclients");
	  
	   
		my $list_check = 0;
	
		for ($list_check = 0; $list_check < 1502; $list_check++)
		{
			$client_search = $entity_list->GetClientByID($list_check);

			if ($client_search)
			{
				my $distanceCHK = $client_search->CalculateDistance($x, $y, $z);
				my $b = $npc->GetTarget();
				if ($b)
				{
					my $TargID = $b->GetID();
					my $ClID = $client_search->GetID();
		#			quest::shout("Distance is $distanceCHK ");
					if (($distanceCHK <= 31) && ($TargID != $ClID))
					{
						my $rampage = quest::ChooseRandom(4241, 4321,4477,4632,4712,4842, 4912, 5020, 5122, 5317, 5451, 5555, 5820,5902,6020,6303,6410,6702,7102,7302,7403);
						$client_search->Damage($npc, $rampage, 7477, 1, 1, -1, 0);
						$client_search->Message(13, "Zun'Muram Yihst Vor hits YOU for $rampage points of damage" );
					}
				}
			}
		}
	}
############################################################    
############################################################    
############################################################ 
}
  

sub EVENT_DEATH {
quest::delglobal("ZYV_Door");
quest::delglobal("ZYV_DoorExit");
#quest::say ("text");
#quest::emote ("text");
$timestamp = localtime(time);
quest::write("text_files/Tacvi.txt","[$timestamp]:$mname was killed by $name the $class.");
}



