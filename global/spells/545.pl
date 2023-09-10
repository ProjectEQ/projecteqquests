sub EVENT_SPELL_EFFECT_CLIENT
{
	if (quest::is_depths_of_darkhollow_enabled()) {
		quest::MovePCInstance(25, 1, -715, -57, 42, 0); # Zone: nektulos
	}
	else {
		quest::movepc(25, -772, 432, 35); # Zone: nektulos
	}
}