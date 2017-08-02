# RoF Event

my $greater_rejuv_spell_id = 2093;

my $rune_of_faceless_id = 8234;

# npcId = 48030
sub EVENT_SPAWN {
    # Spawns and then sits
    plugin::SetAnim(dead);
}

sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, $rune_of_faceless_id => 1)) {
        
        quest::say("Wonderful! This Is precisely what I am seeking. May my magic heal your mind and body.");

        $npc->CastSpell($greater_rejuv_spell_id, 48030);
    }
}

sub EVENT_SIGNAL {
    # signal 1 = RoF Won 
    if ($signal == 1) {
        quest::say("My rescuers, you have recovered the runes I need and my magic has been depleted. I shall take my leave now. May your forces stand against the corruption of the temple.");
        quest:depopall(48030);
    }
}


