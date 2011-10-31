sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::emote("curls his lip and draws his blades in a professional, intimidating quickness, 'You will soon know to regret teh arrogance of your ways, little one -- and how unfortunate that your regret will be so short lived in the last seconds of your life.'");
	}
}

sub EVENT_DEATH {
	quest::emote("drops his weapons and gives a brief, muffled growl that sprays a light mist of blood from his lips as he falls dead to the ground.");
}
