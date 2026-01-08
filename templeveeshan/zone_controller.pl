# Death Tracker - Mobs currently being tracked are Aaryonar, Lord Vyemm, Lord Feshlak,
# Dagarn the Destroyer, Lord Kreizenn, Lord Koi`Doken, Lady Nevederia, Jorlleag,
# Sevalak, Zlexak and Cekenar.

sub EVENT_DEATH_ZONE {

    # Only track deaths for these specific NPC IDs
    if (
        $killed_npc_id == 124010 ||  # Aaryonar
        $killed_npc_id == 124017 ||  # Lord Vyemm
        $killed_npc_id == 124008 ||  # Lord Feshlak
        $killed_npc_id == 124011 ||  # Dagarn the Destroyer
        $killed_npc_id == 124074 ||  # Lord Kreizenn
        $killed_npc_id == 124103 ||  # Lord Koi`Doken
        $killed_npc_id == 124076 ||  # Lady Nevederia
        $killed_npc_id == 124072 ||  # Jorlleag
        $killed_npc_id == 124075 ||  # Sevalak
        $killed_npc_id == 124073 ||  # Zlexak
        $killed_npc_id == 124071     # Cekenar
    ) {
        my $bucket_key   = $killed_npc_id . "-death-count";
        my $current_deaths = quest::get_data($bucket_key);

        # Initialize if undefined
        $current_deaths = 0 if (!defined $current_deaths);

        $current_deaths++;
        quest::set_data($bucket_key, $current_deaths);
    }

    # Lockout code removed as requested – databucket tracking only.
}
