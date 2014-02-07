# #Mirror_Image_of_Noqufiel NPCID 296066



sub EVENT_SPAWN {
	quest::settimer("detonate_check",1);
}

sub EVENT_AGGRO {
	quest::signalwith(296075,1); #tell trigger I'm aggro'd
}

sub EVENT_TIMER {
	if ($timer eq "detonate_check") {
		if ($npc->GetHP() < ($npc->GetMaxHP() - 200)) {
			quest::stoptimer("detonate_check");
			quest::emote("shivers violently, as if about to explode");
			quest::settimer("detonate_now", 6);
		}
	} elsif ($timer eq "detonate_now") {
		$npc->CastSpell(2490,$client);
		quest::depop();
	}
}
