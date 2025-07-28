# Death Tracker - Mobs currently being tracked are Aaryonar, Lord Vyemm, Lord Feshlak, Dagarn the Destroyer, Lord Kreizenn, Lord Koi`Doken, Lady Nevederia, Jorlleag, Sevalak, Zlexak and Cekenar.

sub EVENT_DEATH_ZONE {

	
	if ($killed_npc_id ==  124010 or $killed_npc_id ==   124017 or $killed_npc_id ==  124008 or $killed_npc_id ==  124011 or $killed_npc_id ==  124074 or $killed_npc_id ==  124103 or $killed_npc_id ==  124076 or $killed_npc_id ==  124072 or $killed_npc_id ==  124075 or $killed_npc_id ==  124073 or $killed_npc_id ==  124071) {
		my $bucket_key = $killed_npc_id . "-death-count";
		if (!defined($killed_npc_id . "-death-count") == 1) {
			quest::set_data($bucket_key, 0);
			quest::set_data($bucket_key, quest::get_data($bucket_key) + 1);
		} else {
			quest::set_data($bucket_key, quest::get_data($bucket_key) + 1);
		}
	}

	# Define the NPC IDs in a hash for quick lookups
	my %npc_ids = map { $_ => 1 } (124010); # npc: Aaryonar for NTOV
	my $dz_name = "Temple of Veeshan";

	# Check if $killed_npc_id exists in the hash
	if (exists $npc_ids{$killed_npc_id}) {
		my $dz = quest::get_expedition();
		if ($dz) {
		$dz->AddLockout("Replay Timer", 259200); # 3 day lockout
		}
	}

	if (exists $npc_ids{$killed_npc_id}) {
		my $dz = quest::get_expedition();
		if ($dz) {
		$dz->AddLockout($dz_name, 259200); # 3 day lockout
		}
	}
	
}

