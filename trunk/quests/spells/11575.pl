#Pie Throw used in Halloween quest Toxxulia Pie Fling on scarecrows

sub EVENT_SPELL_EFFECT_NPC {
$random_result = int(rand(10));
$ClientID = $entity_list->GetClientByID($caster_id);
$NPCTarget = $ClientID->GetTarget();
$NPCTypeID = $NPCTarget->GetNPCTypeID();
$PRace = $ClientID->GetRace();
	if($PRace == 82){
		if($NPCTypeID == 38175 || $NPCTypeID == 38176 || $NPCTypeID == 38177){
	 		if($random_result < 8) {
				$ClientID->Message(0,"SPLAT! Your victim is covered in a warm gooey squash pie.");
              		$ClientID->SignalClient($ClientID, 666);
				$npc->Kill();
			}
			else {
				$ClientID->Message(0,"Your pie misses, and your target prepares to return fire! A squash pie is flung at you, run away to dodge it!");
			}
        	}
	}
	else {
		$ClientID->Message(0,"You must be in costume before you can throw pies!");
	}
}

sub EVENT_SPELL_EFFECT_CLIENT {
$ClientID = $entity_list->GetClientByID($caster_id);
$MobID = $entity_list->GetMobByID($caster_id);
$ClientTarget = $ClientID->GetTarget();
$PRace = $ClientID->GetRace();
$TRace = $ClientTarget->GetRace();
$TZone = $ClientTarget->GetZoneID();
	if($ClientID){
		if($PRace == 82) {
			if($TRace == 82){
				if($TZone == 38){
					$ClientID->Message(0,"SPLAT! Your victim is covered in a warm gooey squash pie.");
					$ClientTarget->Message(0,"SPLAT! You are covered in warm gooey squash pie, better go clean up!");
					$ClientID->SignalClient($ClientID, 666);
					$ClientTarget->SignalClient($ClientTarget, 667);
				}
				else {
					$ClientID->Message(0,"SPLAT! Your victim is covered in a warm gooey squash pie.");
					$ClientTarget->Message(0,"SPLAT! You are covered in warm gooey squash pie, better go clean up!");
				}
			}
			else {
				$ClientID->Message(0,"Your target is not in costume so you cannot throw a pie at them!");
			}
		}
		else {
			$ClientID->Message(0,"You must be in costume before you can throw pies!");
		}
	}
	elsif($MobID){
		if($TRace == 82){
			$ClientTarget->Message(0,"SPLAT! You are covered in warm gooey squash pie, better go clean up!");
			$ClientTarget->SignalClient($ClientTarget, 667);
		}
	}
}
