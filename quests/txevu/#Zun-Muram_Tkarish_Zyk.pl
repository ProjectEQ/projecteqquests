# Zun`Muram Tkarish Zyk NPCID 297150

my $banished_pc;
my $init_engage = 0;
my $add_timer = 30;

sub EVENT_SPAWN {
	$banished_pc = 0;
	$init_engage = 0;
	$add_timer = 30;
	SPAWN_EVENT();
}

sub EVENT_COMBAT {
	if ($combat_state == 1) {
		quest::settimer("banishHateTop", 45);
		quest::settimer("spawn_add", $add_timer);
		if (!$init_engage) {
			#30 minutes to finish or the entire event resets
			quest::settimer("fail_check", 1800);
			$init_engage = 1;
		}
	} elsif ($combat_state == 0) {
		quest::stoptimer("banishHateTop");
		quest::stoptimer("spawn_add");
		quest::signalwith(297147, 297150); #tell Ritualists I lost agro
		$banished_pc = 0;
	}
}

sub EVENT_TIMER {
	if ($timer eq "ghost_check") {
		if ($banished_pc) {
			if ($banished_pc->GetX() >= 1410 && $banished_pc->GetX() <= 1501 && $banished_pc->GetY() >= 178 && $banished_pc->GetY() <= 237) {
				#Spawn north jail ghosts. 
				# a_vengeful_apparition
				$banished_pc->Message(7,"Angered by your presence here, apparitions step through the nearby walls.  A bone chilling cold fills the room as they reach for your throat.");
				quest::spawn2(297152,0,0,1500, 180, -328, 198);
				quest::spawn2(297152,0,0,1500, 234, -328, 154);
				quest::spawn2(297152,0,0,1469, 236, -328, 130);
				quest::spawn2(297152,0,0,1449, 235, -328, 118);
				quest::spawn2(297152,0,0,1413, 234, -328, 100);	
				quest::spawn2(297152,0,0,1412, 207, -328, 69);
			} elsif ($banished_pc->GetX() >= 1410 && $banished_pc->GetX() <= 1501 && $banished_pc->GetY() >= -237 && $banished_pc->GetY() <= -178) {
				#spawn south jail ghosts
				# a_vengeful_apparition
				$banished_pc->Message(7,"Angered by your presence here, apparitions step through the nearby walls.  A bone chilling cold fills the room as they reach for your throat.");
				quest::spawn2(297152,0,0,1500, -180, -328, 198);
				quest::spawn2(297152,0,0,1500, -234, -328, 230);
				quest::spawn2(297152,0,0,1469, -236, -328, 255);
				quest::spawn2(297152,0,0,1449, -235, -328, 255);
				quest::spawn2(297152,0,0,1413, -234, -328, 36);	
				quest::spawn2(297152,0,0,1412, -207, -328, 67);
			}
		}
		quest::stoptimer("ghost_check");
	} elsif ($timer eq "banishHateTop") {
		$banished_pc = $npc->GetHateTop();
		if ($banished_pc) {
			$banished_pc->Message(7,"Zun`Muram Tkarish Zyk tells you, 'I grow tired of your insolence.  Rot in your new home!'");
			$npc->SetHate($banished_pc,1,1);
			my $MoveName = $entity_list->GetClientByName($banished_pc->GetName());
			#randomly north or south jail
			$MoveName->MovePC(297, 1475, quest::ChooseRandom(205, -205), -327, 192);
			#if they don't open the door and get out within 20 seconds, the ghosts spawn
			quest::settimer("ghost_check", 20);
			#live emotes for jail
			# An unearthly moan echoes through the small room.
			# Faint whispers can be heard all around you
		}
	} elsif ($timer eq "spawn_add") {
		#Ritualist adds - slow down as there are less Ritualists
		my $which_add = quest::ChooseRandom(297159, 297161, 297161, 297029, 297029, 297128, 297128);
		my $which_loc = quest::ChooseRandom(1,2,3,4);
		if ($which_loc == 1) {
			quest::spawn2($which_add,0,0,1330, 0, -304, 64);
		} elsif ($which_loc == 2) {
			quest::spawn2($which_add,0,0,1305, 27, -304, 0);
		} elsif ($which_loc == 3) {
			quest::spawn2($which_add,0,0,1305, -27, -304, 128);
		} elsif ($which_loc == 4) {
			quest::spawn2($which_add,0,0,1276, 0, -304, 192);
		}
		quest::settimer("spawn_add", $add_timer);
	} elsif ($timer eq "fail_check") {
		#respawn the whole event
		quest::depopall(297147);
		quest::depopall(297148);
		quest::depopall(297149);
		quest::depopall(297159);
		quest::depopall(297161);
		quest::depopall(297029);
		quest::depopall(297128);
		$add_timer = 30;
		$banished_pc = 0;
		$init_engage = 0;
		quest::stopalltimers();
		quest::spawn2(297150,0,0,1506,2,-285,187); #myself, which also will trigger Spawn_Event()
		quest::depop();
	}
}

sub EVENT_SIGNAL {
	#signal is from Ritualists when they die - slow down add spawns
	$add_timer = $add_timer + 30;
}

sub SPAWN_EVENT {
	# 4 Ikaav Ritualist and the two Inquisitor goats.
	quest::spawn2(297147,0,0,1353, 0, -305, 192);
	quest::spawn2(297147,0,0,1305, 45, -305, 128);
	quest::spawn2(297147,0,0,1305, -45, -305, 0);
	quest::spawn2(297147,0,0,1260, 0, -305, 64);
	quest::spawn2(297148,0,0,1528, 30, -285, 192);
	quest::spawn2(297149,0,0,1528, -30, -285, 192);
}