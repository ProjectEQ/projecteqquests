sub EVENT_SPAWN {
	quest::settimer("follow", 1);
}

sub EVENT_TIMER{
	if ($timer eq "follow"){
		my $OpponentID = 30061;
		my $getmobbynpctype = $entity_list->GetMobByNpcTypeID($OpponentID);
		my $follow_target = $getmobbynpctype->GetID();
		quest::follow($follow_target);
		quest::stoptimer("follow");
	}
}

sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("Grrroarrr !!");
		quest::signalwith(30061,1);
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 12221 => 1)) {
		quest::emote("growls with happiness and licks your face.  Just enough time to swipe the sweaty shirt from his collar!!  Iceberg then runs off to enjoy his lion delight!!");
		quest::signalwith(30061,2);
		quest::ding();
		quest::faction( 361, 5);
		quest::faction( 294, 5);
		quest::faction( 213, 5);
		quest::faction( 311, 5);
		quest::exp(1000);
		quest::summonitem(12226);  # sweaty shirt
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:everfrost  ID:30046 -- Iceberg 

