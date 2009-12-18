##Event_Execution_Control.pl
#Trial of Execution
#Modified from Wiz's version by Kilelen


my $mob_death_count = 0;
my $spawn_ex = 1;

sub EVENT_SIGNAL {

	if ($signal == 1) {
		quest::settimer("execution_wave1", 30);
		#Spawn the prisoner
		quest::spawn2(201424, 0, 0, 165, -1156, 80, 61);
	}
	
	elsif ($signal == 2) {
		#It's over, one way or another.
		quest::stoptimer("execution_wave1");
		quest::stoptimer("execution_wave2");
		quest::stoptimer("execution_wave3");
		quest::stoptimer("execution_wave4");
		quest::stoptimer("execution_boss");
		#Despawn executioner
		quest::signalwith(201439, 1, 5);
		#Despawn prisoner
		quest::signalwith(201424, 1, 5);
		#Depawn trial trash
		quest::signalwith(201427, 0, 5);
		quest::signalwith(201428, 0, 5);
		quest::signalwith(201429, 0, 5);
		quest::signalwith(201430, 0, 5);
		quest::signalwith(201431, 0, 5);
		quest::signalwith(201432, 0, 5);
		#Despawn the boss if he's up
		quest::signalwith(201433, 0, 5);
		#Tell the tribunal it's over
		quest::signalwith(201078, 0, 5);
		#Despawn myself
		quest::depop();
	}
	
	elsif ($signal == 3) {
		$mob_death_count++;
		if ($mob_death_count > 3) {
			#Depop executioner
			quest::signalwith(201439, 1, 5);
			#Set an executioner to repop on next wave.
			$spawn_ex = 1;
		}
	}
	
	elsif ($signal == 4) {
		#Executioner up, don't spawn another
	}
}

sub EVENT_TIMER {
	if ($timer eq "execution_wave1") {
		quest::stoptimer("execution_wave1");
		SpawnExecutionMobs();
		quest::settimer("execution_wave2", 60);
	}
	
	elsif ($timer eq "execution_wave2") {
		quest::stoptimer("execution_wave2");
		SpawnExecutionMobs();
		quest::settimer("execution_wave3", 55);
	}
	
	elsif ($timer eq "execution_wave3") {
		quest::stoptimer("execution_wave3");
		SpawnExecutionMobs();
		quest::settimer("execution_wave4", 50);
	}
	
	elsif ($timer eq "execution_wave4") {
		quest::stoptimer("execution_wave4");
		SpawnExecutionMobs();
		quest::settimer("execution_boss", 45);
	}
	
	elsif ($timer eq "execution_boss") {
		quest::stoptimer("execution_boss");
		#Prime_Executioner_Vathoch (201433)
		quest::spawn2(201433,46,0,232,-1048,74,180);
	}
}

sub SpawnExecutionMobs {
	#For our loop
	my $count = 1;
	
	#Locations to spawn mobs at
	my @locX = qw(168 168 224 224);
	my @locY = qw(-1121 -1071 -1071 -1121);
	my @locZ = qw(73 73 73 73);
	my @locH = qw(180 180 180 180);
	
	#Loop and spawn, baby.
	for ($count = 0; $count <= 3; $count++) {
		my $test = rand(99);
		
		if (($test >= 0) && ($test <=19)) {
			quest::spawn2(201427, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]);
		}
		
		elsif (($test >= 20) && ($test <=39)) {
			quest::spawn2(201429, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]);
		}
		
		elsif (($test >= 40) && ($test <=64)) {
			quest::spawn2(201430, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]);
		}
		
		elsif (($test >= 65) && ($test <=91)) {
			quest::spawn2(201428, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]);
		}
		
		elsif (($test >= 92) && ($test <=95)) {
			quest::spawn2(201431, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]);
		}
		
		else {
			quest::spawn2(201432, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]);
		}
		
		if ($spawn_ex == 1) {
			#Spawn An_Executioner (201439)
			quest::spawn2(201439,0,0,232,-1048,74,180);
			$spawn_ex = 0;
			$mob_death_count = 0;
		}
	}
}