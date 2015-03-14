#Inktuta #curse_trigger NPCID 296017

my $count;
my $initial;
my @curse_callers = qw(296053 296054 296055 296056 296057 296058);
my @curse_bearers = qw(296059 296060 296061 296062 296063 296064);


sub EVENT_SPAWN {
	$initial = 0;
	quest::settimer("win_check",5); 
	quest::settimer("initial_bearers",15);
}

sub EVENT_SIGNAL {
	#fail/wipe check - signal 2 means one of the callers lost aggro, for loop to make sure none have aggro, depop all callers and bearers, spawn noqufiel to reset event
	if ($signal == 2) {
		my @hate_list;
		my $hate_list;
		my $hate_count = 0;
		for ($count = 0; $count <= 5; $count++) {
			if ($entity_list->IsMobSpawnedByNpcTypeID($curse_callers[$count])) {
				@hate_list = $entity_list->GetNPCByNPCTypeID($curse_callers[$count])->GetHateList();
				$hate_list = @hate_list;
					if ($hate_list) {
						$hate_count++;
					}
			}
		}
		if (!$hate_count) { #no callers have aggro
			quest::stopalltimers();
			for ($count = 0; $count <= 5; $count++) {
				quest::depopall($curse_callers[$count]);
				quest::depopall($curse_bearers[$count]);
			}
			quest::spawn2(296052,0,0,$x,$y,$z,$h); #Noqufiel
			quest::depop();
		}
		$hate_count = 0;
	}
}

sub EVENT_TIMER {
	if($timer eq "initial_bearers") {
		quest::spawn2($curse_bearers[$initial],0,0,42,-912,-126,195);
		if($initial == 5) {
			quest::stoptimer("initial_bearers");
			quest::settimer("spawn_cursebearer",15);
		}
		$initial += 1;
	} elsif($timer eq "win_check") {
		#check to see if any of the six cursecallers are up
		if (!$entity_list->IsMobSpawnedByNpcTypeID(296053) && !$entity_list->IsMobSpawnedByNpcTypeID(296054) && !$entity_list->IsMobSpawnedByNpcTypeID(296055) && !$entity_list->IsMobSpawnedByNpcTypeID(296056) && !$entity_list->IsMobSpawnedByNpcTypeID(296057) && !$entity_list->IsMobSpawnedByNpcTypeID(296058)) {
			quest::stoptimer(1);
			quest::signalwith(296070,296017); #signal zone_status we win
			for ($count = 0; $count <= 5; $count++) {
				quest::depopall($curse_bearers[$count]);
			}
			quest::depop();
		}
	} elsif ($timer eq "spawn_cursebearer") {
		#if the cursecaller is still up, and his cursebearer isn't, he needs to summon another one
		#only spawn one per timer hit
		my $spawned_one = 0;
		for ($count = 0; $count <= 5; $count++) {
			if ($entity_list->IsMobSpawnedByNpcTypeID($curse_callers[$count])) {
				if(!$entity_list->IsMobSpawnedByNpcTypeID($curse_bearers[$count]) && $spawned_one == 0) {
					quest::spawn2($curse_bearers[$count],0,0,42,-912,-126,195);
					$spawned_one = 1;
				}		
			} else {
				quest::depopall($curse_bearers[$count]);
			}
		}
		$spawned_one = 0;
	}
}