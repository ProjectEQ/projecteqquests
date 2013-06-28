sub EVENT_SPAWN {
    quest::setnexthpevent(61);
    quest::signal(204069);     # Tell any targetable treants still alive to depop after Deyid respawns (18 minutes)
}

#During the fight he summons a ring of Corrupt Treants ID 204068 in PEQ
# By the time you kill deyid they are upon you and attacking you.
#when Deyid Dies you have succeeded, you are not required to kill the spawns.
sub EVENT_HP {

    if ($hpevent == 61) {
    quest::spawn2(204068,0,0,922,1028,280);
    quest::spawn2(204068,0,0,947,1117,200);
    quest::spawn2(204068,0,0,1031,1164,276);
    quest::spawn2(204068,0,0,1121,1154,277);
    quest::spawn2(204068,0,0,1206,1067,280);
    quest::spawn2(204068,0,0,1237,887,272);
    quest::settimer(1,30)     # Timer to spawn targetable treants 30 seconds after untargetables are spawned
    }  
}
sub EVENT_TIMER {
	if ($timer == 1) {
		quest::signal(204068);	# Despawn untargetable treants
		# Spawn the targetable treants
		quest::spawn2(204069,0,0,922,1028,280);
		quest::spawn2(204069,0,0,947,1117,200);
		quest::spawn2(204069,0,0,1031,1164,276);
		quest::spawn2(204069,0,0,1121,1154,277);
		quest::spawn2(204069,0,0,1206,1067,280);
		quest::spawn2(204069,0,0,1237,887,272);
	}
}

sub EVENT_DEATH_COMPLETE {
    quest::emote("An eerie silence settles onto the forest as Deyid the Twisted slumps over, defeated");
    quest::signalwith(204047, 5, 1);    # Send signal # 5 to Seilaen 1 second after death
    quest::stoptimer(1);     # Prevent treants from respawning as targetable if killed quickly
    quest::signal(204068);     # If Deyid is dead before the targetable treants have spawned, tell them to depop
}