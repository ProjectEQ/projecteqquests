#Inktuta #curse_trigger NPCID 296017

sub EVENT_SPAWN {
	quest::settimer(1,15);  #timer for event completion check
	quest::settimer("spawn_cursebearer",20);
}

sub EVENT_TIMER {
	if($timer == 1) {
		#check to see if any of the six cursecallers are up
		if (!$entity_list->GetMobByNpcTypeID(296053) && !$entity_list->GetMobByNpcTypeID(296054) && !$entity_list->GetMobByNpcTypeID(296055) && !$entity_list->GetMobByNpcTypeID(296056) && !$entity_list->GetMobByNpcTypeID(296057) && !$entity_list->GetMobByNpcTypeID(296058)) {
			quest::stoptimer(1);
			quest::signalwith(296070,296017); #signal zone_status we win
			quest::depopall(296059); #depop cursebearers
			quest::depopall(296060);
			quest::depopall(296061);
			quest::depopall(296062);
			quest::depopall(296063);
			quest::depopall(296064);
			quest::depop();
		}
	} elsif ($timer eq "spawn_cursebearer") {
		quest::spawn2(quest::ChooseRandom(296059,296060,296061,296062,296063,296064),0,0,7,-912,-126,0);
	}
}