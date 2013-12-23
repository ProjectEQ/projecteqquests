#NPCID: 214126 -- #reset_pit
#This is a list of the spawn2 id's of all mobs that spawn in the pit.
my @spawn2list = (44462,44639,44640,44641,44642,44646,44654,44655,44656,44657,44664,44665,44666,44667,44674,44675,44676,44677,44678,44679,44681,44682,44687,44688,44702,44703,44705,44708,44709,44710,44711,44712,44713,44715,44716,44719,44720,44721,44722,44723,44724,44727,44728,44729,44737,44738,44742,44743,44744,44745,44746,44747,44748,44749,44758,44759,44760,44761,44762,44763,44764,44765,44775,44776,44780,44781,44782,44680);

sub EVENT_SPAWN {
	quest::say("Something got borked and a GM spawned me to reset the pit.");
	foreach my $spawn2 (@spawn2list) {   # Depsawn all the mobs in the pit
		# Set pit mobs to respawn in 30 minutes. comment this line out to not set the 30 minute timer for testing.
		quest::updatespawntimer($spawn2,10000);
		#re-enable the spawn2 entry for all the pit mobs.
		quest::enable_spawn2($spawn2);
	}
	quest::depop();
}