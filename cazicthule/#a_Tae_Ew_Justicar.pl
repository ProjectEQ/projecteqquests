# RoF Event

my $tragedy_at_cazic_thule_spell_id = 2127;

my $unstable_rift_id = 48253;

# npcId = 48029
sub EVENT_SPAWN {
    
}

sub EVENT_SIGNAL {
    # signal 1 = emote and blow up lizards
    if ($signal == 1) {
        quest::emote("looks paniced as planar forces shoot through it's body.");

        $npc->CastSpell($tragedy_at_cazic_thule_spell_id, e.self:GetID());

        quest::settimer(1, 15);

    }
}

sub EVENT_TIMER {

    # timer 1 = waiting for Justicars to finish casting
    if ($timer == 1) {
        quest::stoptimer(1);

        # spawn unstable rift
        quest::spawn2($unstable_rift_id, 0,0, 587, 1090, -98, 180);

        quest:depopall(e.self:GetID());
    }
}