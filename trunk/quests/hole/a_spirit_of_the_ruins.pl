sub EVENT_AGGRO {
	my $mgender = $npc->GetBaseGender();
	my $mclass = $npc->GetClass();
	if($mlevel==45) {
		quest::say("You had best prepare yourself for the fury of the heretics!");
	}
	if(($mclass==1) && ($mgender==0) && ($mlevel !=45)){
		quest::emote("glares with soulful hatred at the invaders of the ruins.");
	}
	if(($mclass==3) && ($mgender==0) && ($mlevel !=45)){
		quest::emote("aims to touch its victim with deadly harm.");
	}
	if(($mclass==3) && ($mgender==1) && ($mlevel !=45)){	
		quest::emote("awakens the magic it has not used for some time.");
	}
	if(($mclass==1) && ($mgender==1) && ($mlevel !=45)){	
		quest::emote("raises her spectral arms and attacks.");
	}
}

sub EVENT_DEATH {
	my $mgender = $npc->GetBaseGender();
	my $mclass = $npc->GetClass();
	if($mlevel==45) {
		quest::say("Even with my death, you will never take the city from us!");
	}
	if(($mclass==1) && ($mgender==0) && ($mlevel !=45)){
		quest::emote("shrieks as his hollow ghostly form falls gently to the ground.");
	}
	if(($mclass==3) && ($mgender==0) && ($mlevel !=45)){
		quest::emote("comfortably laughs at his own impending death.");
	}
	if(($mclass==3) && ($mgender==1) && ($mlevel !=45)){
		quest::emote("releases her mana and soul into the air around you.");
	}
	if(($mclass==1) && ($mgender==1) && ($mlevel !=45)){	
		quest::emote("looks dazed as her bound spirit escapes.");
	}
}