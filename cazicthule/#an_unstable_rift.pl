# RoF Event

my $avatar_of_fear_spell_id = 2128;

my $avatar_of_fear_id = 48238;

# npcId = 48253
sub EVENT_SPAWN {
    # spawn Avatar of Fear
    quest::spawn2($avatar_of_fear_id, 86,0, 587, 1090, -94, 360);
    quest::emote("glows, and then dissipates");

    $npc->CastSpell($avatar_of_fear_spell_id, 48253);

    quest::ze(1, "You struggle with the desire to flee in terror!");

    quest::ze(1, "A piercing, disembodied scream echos from deep within the temple. Your body begins to tremble uncontrollably with fear.");

    

    quest::depop();
}
