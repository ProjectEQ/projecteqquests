sub EVENT_DEATH_ZONE {
	# Define the NPC IDs in a hash for quick lookups
	my %npc_ids = map { $_ => 1 } (158014, 158010, 158015, 158012, 158013, 158007, 158008, 158011, 158009); # npc: Aaryonar for NTOV
	my $dz_name = "Vex Thal";

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
