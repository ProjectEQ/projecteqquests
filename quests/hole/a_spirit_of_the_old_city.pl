sub EVENT_AGGRO {
	my $mgender = $npc->GetBaseGender();
	my $mclass = $npc->GetClass();
	if($mlevel==51) {
		quest::say("We will protect our city at all costs.");
	}
	if(($mclass==1) && ($mgender==0) && ($mlevel !=51)){
		quest::say("You fail to understand our devotion to this ruined city!");
	}
	if(($mclass==3) && ($mgender==0) && ($mlevel !=51)){
		quest::say("You will not leave here alive!  You should not have come.");
	}
	if(($mclass==3) && ($mgender==1) && ($mlevel !=51)){	
		quest::emote("glides forward with a ferocious hiss.");
	}
	if(($mclass==1) && ($mgender==1) && ($mlevel !=51)){	
		quest::say("There are no invitations to our city!");
	}
}

sub EVENT_DEATH {
	my $mgender = $npc->GetBaseGender();
	my $mclass = $npc->GetClass();
	if($mlevel==51) {
		quest::emote("attempts to grab your throat as its ghostly form fades into nothingness.");
	}
	if(($mclass==1) && ($mgender==0) && ($mlevel !=51)){	
		quest::emote("slowly drops into a translucent heap on the ground.");
	}
	if(($mclass==3) && ($mgender==0) && ($mlevel !=51)){
		quest::emote("drifts to the ground and dissipates");
	}
	if(($mclass==3) && ($mgender==1) && ($mlevel !=51)){
		quest::emote("disappears into the air with an echoing cry.");
	}
	if(($mclass==1) && ($mgender==1) && ($mlevel !=51)){		
		quest::emote("fights to keep lies to the mortal realm and fails.");
	}
}