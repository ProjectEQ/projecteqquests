sub EVENT_AGGRO {
	my $mgender = $npc->GetBaseGender();
	my $mclass = $npc->GetClass();
	if(($mclass==1) && ($mgender==0)){
		quest::emote("I will peel your skin with my claws for this intrusion!");
	}
	if(($mclass==3) && ($mgender==0)){
		quest::emote("drifts threateningly toward its enemies.");
	}
	if(($mclass==3) && ($mgender==1)){	
		quest::say("You will be enveloped by the arms of death!");
	}
	if(($mclass==1) && ($mgender==1)){	
		quest::emote("attacks with her arms outstretched.");
	}
}

sub EVENT_DEATH_COMPLETE {
	my $mgender = $npc->GetBaseGender();
	my $mclass = $npc->GetClass();
	if(($mclass==1) && ($mgender==0)){
		quest::emote("floats to the floor as her spirit perishes");
	}
	if(($mclass==3) && ($mgender==0)){
		quest::emote("wails as his corpse is torn free.");
	}
	if(($mclass==3) && ($mgender==1)){
		quest::emote("twists and rolls as her dark soul passes on.");
	}
	if(($mclass==1) && ($mgender==1)){	
		quest::emote("feels her spirit ebbing and shrieks with fear.");
	}
}