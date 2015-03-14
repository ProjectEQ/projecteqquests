# Tricksy_Treetor
# Buff lvl 31-50 with Aego

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name. Are you here to help us? We recieved word that an undead army is planning an attack on Freeport, and we are here to hold them off. If you need any [defensive magics] cast on you, do not hesitate to ask.");
	}
	
	if ($text=~/defensive/i) {
		quest::say("For those of you new to Norrath, Jack will be able to improve your [valor]. For those who have lasted more than 30 seasons, I can protect you with an [aegolism]. For the rest of you, Eve can bestow upon you a greater [virtue]");
	}
	
	if ($text=~/aegolism/i) {
		if ($ulevel>30) {
			$npc->CastSpell($userid,1447);
		} else {
			quest::say("You are not ready for what I have to offer");
		}
	}
}