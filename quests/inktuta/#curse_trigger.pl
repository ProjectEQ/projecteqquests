#Inktuta #curse_trigger NPCID 296017

my $count;
my @curse_callers = qw(296053 296054 296055 296056 296057 296058);
my @curse_bearers = qw(296059 296060 296061 296062 296063 296064);
my @hate_list;
my $hate_list;
my $hate_count = 0;

sub EVENT_SPAWN {
	quest::settimer(1,15);  #timer for event completion check
	quest::settimer("spawn_cursebearer",20);
}

sub EVENT_SIGNAL {
	#fail/wipe check - signal 2 means one of the callers lost aggro, for loop to make sure none have aggro, depop all callers and bearers, spawn noqufiel to reset event
	if ($signal == 2) {
		for ($count = 0; $count <= 5; $count++) {
			@hate_list = $entity_list->GetNPCByNPCTypeID($curse_callers[$count])->GetHateList();
			$hate_list = @hate_list;
			if ($hate_list) {
				$hate_count++;
			}
		}
		if (!$hate_count) { #no callers have aggro
			quest::stoptimer("spawn_cursebearer");
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
	if($timer == 1) {
		#check to see if any of the six cursecallers are up
		if (!$entity_list->GetMobByNpcTypeID(296053) && !$entity_list->GetMobByNpcTypeID(296054) && !$entity_list->GetMobByNpcTypeID(296055) && !$entity_list->GetMobByNpcTypeID(296056) && !$entity_list->GetMobByNpcTypeID(296057) && !$entity_list->GetMobByNpcTypeID(296058)) {
			quest::stoptimer(1);
			quest::signalwith(296070,296017); #signal zone_status we win
			for ($count = 0; $count <= 5; $count++) {
				quest::depopall($curse_bearers[$count]);
			}
			quest::depop();
		}
	} elsif ($timer eq "spawn_cursebearer") {
		quest::spawn2(quest::ChooseRandom(296059,296060,296061,296062,296063,296064),0,0,7,-912,-126,0);
	}
}