#Pie Throw used in Halloween quest Toxxulia Pie Fling on scarecrows

sub EVENT_SPELL_EFFECT_NPC {
$random_result = int(rand(10));
$Client_ = $entity_list->GetClientByID($caster_id);
$NPCTypeID = $npc->GetNPCTypeID();
$PRace = $Client_->GetRace();
	if($PRace == 82){
		if($NPCTypeID == 38175 || $NPCTypeID == 38176 || $NPCTypeID == 38177){
	 		if($random_result > 3) {
				$Client_->Message(0,"SPLAT! Your victim is covered in a warm gooey squash pie.");
              		$Client_->SignalClient($Client_, 666);
				$npc->Kill();
			}
			else {
				$Client_->Message(0,"Your pie misses, and your target prepares to return fire! A squash pie is flung at you, run away to dodge it!");
				$npc->CastSpell(11575,$caster_id);
				$npc->FaceTarget($Client_);
			}
        	}
		elsif($NPCTypeID == 202387){
			$Client_->Message(0,"SPLAT! Your victim is covered in a warm gooey squash pie.");
			$npc->CastSpell(11575,$caster_id);
			$npc->FaceTarget($Client_);
			quest::signal(202387);
		}
		else {
			$npc->BuffFadeBySpellID(11575);
		}
	}
	else {
		$Client_->Message(0,"You must be in costume before you can throw pies!");
		$npc->BuffFadeBySpellID(11575);
	}
}

sub EVENT_SPELL_EFFECT_CLIENT {
$Caster = $entity_list->GetClientByID($caster_id);
$TZone = $client->GetZoneID();
$TRace = $client->GetRace();
	if(!$Caster){
		$client->Message(0,"SPLAT! You are covered in warm gooey squash pie, better go clean up!");
		$client->SignalClient($client, 667);
	}
	else {
	$PRace = $Caster->GetRace();
		if($PRace == 82){
			if($TRace == 82){
				if($TZone == 38){
					$client->Message(0,"SPLAT! You are covered in warm gooey squash pie, better go clean up!");
					$client->SignalClient($client, 667);
					$Caster->Message(0,"SPLAT! Your victim is covered in a warm gooey squash pie.");
					$Caster->SignalClient($Caster, 666);
				}
				else {
					$Caster->Message(0,"SPLAT! Your victim is covered in a warm gooey squash pie.");
					$client->Message(0,"SPLAT! You are covered in warm gooey squash pie, better go clean up!");
				}
			}
			else {
				$Caster->Message(0,"Your target is not in costume so you cannot throw a pie at them!");
				$client->BuffFadeBySpellID(11575);
			}
		}
		else {	
			$Caster->Message(0,"You must be in costume before you can throw pies!");
			$client->BuffFadeBySpellID(11575);
		}
	}	
}