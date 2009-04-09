#Emporer Ssraeshza Event Trigger

sub EVENT_SPAWN {
   quest::unique_spawn(162208, 0, 0, 950.0, -139.0, 403.7);
}

sub EVENT_SIGNAL {
	if ($signal == 96) {   
		quest::depop();
	}
}

#zone: ssratemple ID: 162260 NPC: #Blood_Spawner
