#Stun-DA add
sub EVENT_SPAWN {
quest::settimer("Depop", 10);
}

sub EVENT_AGGRO {
quest::settimer("Go", 1);
}

sub EVENT_TIMER {

	if ($timer eq "Go")
	{
		quest::stoptimer("Go");
		$b = $npc->GetTarget();
		if ($b)
		{
			$a = 0; if ($b) { $a = $b->GetID(); }
			$PName = $b->GetName();
			$QQ = $entity_list->GetClientByID($a);
			if ($QQ) { return; }
			#quest::shout("$b x $a $QQ ");
			plugin::CastOnTarget(1071);
			$c_x = $QQ->GetX();
			$c_y = $QQ->GetY();
			$c_z = $QQ->GetZ();
			$GenX = $QQ->GetBaseGender();
			#quest::shout("$c_x $c_y x $c_z x $GenX ");
			quest::setglobal("NightmareSize", $QQ->GetSize(), 7, "F");
			quest::setglobal("NightmareGender", $QQ->GetBaseGender(), 7, "F");
			quest::setglobal("NightmareRace", $QQ->GetBaseRace(), 7, "F");
			$GetPlClass = $QQ->GetClass();
			
			if  (($GetPlClass == 1) ||  ($GetPlClass == 2) || ($GetPlClass == 3) ||($GetPlClass == 5) || ($GetPlClass == 8) )
			{
				quest::setglobal("NightmareTxt", 3, 7, "F");
			}
			if  (($GetPlClass == 4) ||  ($GetPlClass == 9) || ($GetPlClass == 10) || ($GetPlClass == 16))
			{
				quest::setglobal("NightmareTxt", 2, 7, "F");
			}
			if  (($GetPlClass == 11) ||  ($GetPlClass == 12) || ($GetPlClass == 13) || ($GetPlClass == 14))
			{
				quest::setglobal("NightmareTxt", 14, 7, "F");
			}
			if  (($GetPlClass == 6) ||  ($GetPlClass == 7) || ($GetPlClass == 15))
			{
				quest::setglobal("NightmareTxt", 1, 7, "F");
			}
			
			#quest::shout("CHeck. $GetPlClass $qglobals{NightmareSize} , $qglobals{NightmareGender}, $qglobals{NightmareRace}, $qglobals{NightmareTxt}");
			quest::spawn2(298206,0,0, $c_x, $c_y, $c_z , 1);
			$QQ->Message(6, "Zun'Muram Yihst Vor swipes his blade in your direction. You feel your soul begin to tear from your body." );
			$entity_list->MessageClose($npc, 1, 200, 15, "$PName 's soul is torn from his body");
			quest::depop();
		}
	}

if ($timer eq "Depop") {
quest::stoptimer("Depop");
quest::depop();
}
}

