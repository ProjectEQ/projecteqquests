# Death Tracker - Mobs currently being tracked are Hraashna the Warder, Nanzata the Warder, Tukaarak the Warder, Ventani the Warder, The Final Arbiter, The Final Arbiter, Master of the Guard, Master of the Guard, The Progenitor, The Progenitor, Kerafyrm and Kerafyrm.

sub EVENT_DEATH_ZONE {

	
	if ($killed_npc_id == 128093 or $killed_npc_id == 128090 or $killed_npc_id == 128092 or $killed_npc_id == 128091 or $killed_npc_id == 128143 or $killed_npc_id == 128045 or $killed_npc_id == 128145 or $killed_npc_id == 128054 or $killed_npc_id == 128144 or $killed_npc_id == 128053 or $killed_npc_id == 128095 or $killed_npc_id == 128089) {
		my $bucket_key = $killed_npc_id . "-death-count";
		if (!defined($killed_npc_id . "-death-count") == 1) {
			quest::set_data($bucket_key, 0);
			quest::set_data($bucket_key, quest::get_data($bucket_key) + 1);
		} else {
			quest::set_data($bucket_key, quest::get_data($bucket_key) + 1);
		}
	}

	# Define the NPC IDs in a hash for quick lookups
	my %npc_ids = map { $_ => 1 } (128132); # npc: Aaryonar for NTOV
	my $dz_name = "Sleepers Tomb";

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