sub EVENT_SAY {
$npc->CastSpell(3087,$charid); # Spell: Cazic Touch
quest::shout("SILENCE IN THE LIBRARY!");

}