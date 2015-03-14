my $instid = 0;

sub EVENT_SPAWN {
	quest::set_proximity($x-20,$x+20,$y-30,$y+20);
}

sub EVENT_ENTER {
	$instid = quest::GetInstanceID('uqua',0);
	quest::ze(15,"From somewhere behind the walls there is a deep rumbling.");
	quest::settimer(1,20);
}

sub EVENT_TIMER {
	if(defined($qglobals{$instid."_gaschmb1complete"})) {
		quest::delglobal($instid."_gaschmb1complete");
		quest::spawn2(292010,0,0,-288,-940,-24,65);
		quest::spawn2(292007,0,0,-264,-940,-24,193);
		quest::depop_withtimer();
	} else {
		quest::ze(15,"From somewhere behind the walls there is a deep rumbling.");
		quest::ze(15,"Out of the corner of your eye you perceive movement. Within the recession on the door a mechanical lock rotated counter-clockwise. It was visible for only a fraction of a second, but that was long enough to make an educated guess to which key it now accepts.");
		@list = $entity_list->GetClientList();
		$size = @list;
		$index = int(rand($size)) - 1;
		$player = @list[$index];
		$ranmessage = int(rand(4)) + 1;
	}
	if ($ranmessage == 1) {
		$player->Message(15,"The Cracked Key must unlock the door to the next room.");
		quest::setglobal($instid."_gaschmb1",1,3,"M5"); 
	}
	if ($ranmessage == 2) {
		$player->Message(15,"The Dusty Key must unlock the door to the next room."); 
		quest::setglobal($instid."_gaschmb1",2,3,"M5");
	}
	if ($ranmessage == 3) {
		$player->Message(15,"The Polished Key must unlock the door to the next room.");
		quest::setglobal($instid."_gaschmb1",3,3,"M5");
	}
	if ($ranmessage == 4) {
		$player->Message(15,"The Jagged Key must unlock the door to the next room."); 
		quest::setglobal($instid."_gaschmb1",4,3,"M5");
	}
}