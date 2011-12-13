sub EVENT_AGGRO {
	quest::emote("of decay seems to be moving with you.");
	$npc->Depop(1);
}