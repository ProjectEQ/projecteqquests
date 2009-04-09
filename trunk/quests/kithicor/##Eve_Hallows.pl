# Eve_Hallows
# Buff 51-65 with Virtue

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name. Are you here to help us? We recieved word that an undead army is planning an attack on Freeport, and we are here to hold them off. If you need any [defensive magics] cast on you, do not hesitate to ask.");
	}
	
	if ($text=~/defensive/i) {
		quest::say("For those of you new to Norrath, Jack will be able to improve your [valor]. For those who have lasted more than 30 seasons, Tricksy can protect you with an [aegolism]. For the rest of you, I can bestow upon you a greater [virtue]");
	}
	
	if ($text=~/virtue/i) {
		if ($ulevel>50) {
			$npc->CastSpell($userid,3467);
		} else {
			quest::say("You are not ready for what I have to offer");
		}
	}
}