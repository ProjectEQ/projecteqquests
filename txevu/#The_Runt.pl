# #The_Runt (297209)

my $count;
my @arena_mobs = qw(297033 297034 297035 297036 297037 297038 297039 297040 297041 297042 297043 297044 297131 297132 297133 297177);

sub EVENT_SPAWN {
	quest::moveto(25,0,-437.5, -1, 1);
}

sub EVENT_COMBAT {
	if ($combat_state == 1) {
		quest::settimer("aggro_check",1);
	} else {
		quest::stoptimer("aggro_check");
	}
}

sub EVENT_TIMER {
	if ($timer eq "aggro_check") {
		#make sure only 1 person on hate list
		@hate_list = $npc->GetHateList();
		$hate_list = @hate_list;
		if ($hate_list > 1) {
			#make all arena mobs go active
			for ($count = 0; $count <= 15; $count++) {
				quest::signalwith($arena_mobs[$count], 297209);
			}
		}
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::signalwith(297034, 297209); #let Champion know I died
	quest::spawn2(297211,0,0,20,-2,-435,112); #Ixt_Hsek_Syat
}
