##Event_Burning_Control.pl
#Trial of Flame
#Kilelen

sub EVENT_SIGNAL {
	if ($signal == 1) {
		#Signal to start the AEs a'roastin, the spawns a'spawnin
		#First AE after 30 seconds
		quest::settimer("flame_dd", 30);
		quest::settimer("flame_wave1", 90);
	}
	
	elsif ($signal == 2) {
		#It's over, one way or another.
		quest::stoptimer("flame_dd");
		quest::stoptimer("flame_dot");
		quest::stoptimer("flame_wave1");
		quest::stoptimer("flame_wave2");
		quest::stoptimer("flame_wave3");
		quest::stoptimer("flame_wave4");
		quest::stoptimer("flame_boss");
		quest::signalwith(201420, 1, 5); # NPC: #a_fiery_aggressor
		quest::signalwith(201447, 1, 5); # NPC: A_Burning_Nemesis
		quest::signalwith(201446, 1, 5); # NPC: Punisher_of_Flame
		quest::signalwith(201418, 1, 5); # NPC: spirit_of_flame
		quest::signalwith(201426, 1, 5); # NPC: fiend_of_flame
		quest::signalwith(201434, 0, 5); # NPC: The_Tribunal Flame Trial
		quest::depop();
	}
}

sub EVENT_TIMER {
	if ($timer eq "flame_dd") {
		quest::stoptimer("flame_dd");
		#AE Fiery Death
		$npc->CastSpell(951, 201417); # Spell: Fiery Death
		#Timer for next AE
		quest::settimer("flame_dot", 30);
	}
	
	elsif ($timer eq "flame_dot") {
		quest::stoptimer("flame_dot");
		#AE Wave of Heat, DoT version
		$npc->CastSpell(1131, 201417); # Spell: Wave of Heat
		#Timer for next AE
		quest::settimer("flame_dd", 30);
	}
	
	elsif ($timer eq "flame_wave1") {
		quest::stoptimer("flame_wave1");
		SpawnFlameMobs();
		quest::settimer("flame_wave2", 90);
	}
	
	elsif ($timer eq "flame_wave2") {
		quest::stoptimer("flame_wave2");
		SpawnFlameMobs();
		quest::settimer("flame_wave3", 90);
	}
	
	elsif ($timer eq "flame_wave3") {
		quest::stoptimer("flame_wave3");
		SpawnFlameMobs();
		quest::settimer("flame_wave4", 90);
	}
	
	elsif ($timer eq "flame_wave4") {
		quest::stoptimer("flame_wave4");
		SpawnFlameMobs();
		quest::settimer("flame_boss", 90);
	}
	
	elsif ($timer eq "flame_boss") {
		quest::stoptimer("flame_boss");
		#Punisher of Flame, the boss.
		quest::spawn2(201446,0,0,880,-805,55,0); # NPC: Punisher_of_Flame
	}
}

sub SpawnFlameMobs {
	#For our loop
	my $count = 1;
	
	#Locations to spawn mobs at
	my @locX = qw(880 811 880 953);
	my @locY = qw(-800 -730 -653 -730);
	my @locZ = qw(60 60 60 60);
	my @locH = qw(0 190 128 64);
	
	#Loop and spawn, baby.
	for ($count = 0; $count <= 3; $count++) {
		my $test = rand(99);
		
		if ($test < 10) {
			#Fiery Agressor, rare mob
			quest::spawn2(201420, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]); # NPC: #a_fiery_aggressor
		}
		
		elsif (($test >= 10) && ($test < 20)) {
			#Burning nemesis, rare
			quest::spawn2(201447, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]); # NPC: A_Burning_Nemesis
		}
		elsif ($test >= 20) {
			quest::spawn2(quest::ChooseRandom(201426,201418), 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]); # spirit of flame / fiend of flame common mobs
		}
	}
}
