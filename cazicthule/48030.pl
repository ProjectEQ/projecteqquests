# RoF Event

my $unstable_rift_id = 48253;

my $greater_rejuv_spell_id = 2093;

my $rune_of_faceless_id = 8234;

# npcId = 48030
sub EVENT_SPAWN {
    quest::settimer(1, 12);
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
        quest::depopall(48030);
        quest::depopall(48045); --depop warders
        quest::depopall(48099); --depop warders
    }
}

sub EVENT_TIMER {
    if ($timer == 1) {
        quest::stoptimer(1);

        quest::spawn2($unstable_rift_id, 0,0, 587, 1090, -98, 360);

        plugin::SetAnim(sit);
    }
}

