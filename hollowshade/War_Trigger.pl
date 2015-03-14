#BEGIN File: hollowshade/War_Trigger.pl (166257)
#Quest file for Hollowshade Moor - Hollowshade War

#This is an implementation of the Hollowshade War.
#
# key aspects:
#
# Random attacks occur based on a timer "RandomWar"
#
# PC's can initiate an attack by killing one of the camp named.
# PHs and smaller named do not trigger an attack
# 
# All invaders are indiff to PCs
#
# Attacker pathing isn't pretty.
#
# ATM, to win, all defenders must die and the invaders must reach a set point
# and do this in 450 seconds.

my $attacker = "";
my $attacker_id = 0;
my $defender = "";
my $defender_id = 0;
my $event = 0;
my $winner = 0;
my $defenders_down = 0;
my $attackers_arrived = 0;
my $takeover_in_progress = 0;
my $RandomWar = plugin::RandomRange(720, 3600);
my %HollowshadeRace = (1 => "Owlbears", 2 => "Sonic Wolves", 3 => "Grimlings");
my %Camp = (1 => "North", 2 => "East", 3 => "South");
my %DirectionalCamp = (1 => "northern caves", 2 => "eastern swamp", 3 => "southern shores");
my %AttackerText = (
  "Owlbear" => "Somewhere in the distance, the Owlbear sharpen their claws on boulders. The unsettling scraping noise spreads to every corner of the moor.",
  "Sonic Wolves" => "Frenzied howling fills the air, the sound taking on every aspect of an angry wail. The sonic wolves are mounting an offensive.",
  "Grimlings" => "Hollowshade is abuzz with activity as the Grimlings make preparations to invade their enemy."
);
my %DefenderText = (
  1 => "frantically prepare for the assault",
  2 => "seem disoriented",
  3 => "nervously scurry about"
);
my %VictoryText = (
  "Owlbear" => "The Owlbear chase off any remaining survivors as they lay claim to the ",
  "Sonic Wolves" => "Sonic wolves howl in celebration, having overrun the inhabitants of the ",
  "Grimlings" => "NEED GRIMLING VICTORY TEXT"
);

sub EVENT_SPAWN
	{
	quest::setglobal("DeadDefenderCount", 0, 7, "F"); # how many 
	quest::setglobal("WarDefender", "NOWAR", 7, "F"); # Who is defending.
	if (!defined($qglobals{HollowshadeNorth}) || 
		!defined($qglobals{HollowshadeEast}) || 
		!defined($qglobals{HollowshadeSouth}))
		{
		RESET_GLOBALS();
		}
	RESET_ZONE();
	}

sub EVENT_TIMER {
	if (($timer eq "RandomWar") && ($event == 0)) 
		{
		#Set WarDefender to keep a PC war from starting
		quest::setglobal("WarDefender","RANDOM", 7, "F"); # Who is defending.
		quest::stoptimer("RandomWar");
		START_WAR("","");
		}
	elsif ($timer eq "StartPCWar")
		{
		quest::stoptimer("StartPCWar");
		# Event set the $attacker
		START_WAR($attacker, $defender);
		}
	elsif ($timer eq "ResetPause") 
		{
		quest::stoptimer("ResetPause");
		LOAD_SPAWNS();
		}
	elsif ($timer eq "SpawnNewOwners")
		{
		quest::setglobal("WarDefender", "NOWAR", 7, "F"); # Who is defending.
		quest::stoptimer("SpawnNewOwners");
		quest::depopall($attacker_id);
		quest::spawn_condition($zonesn, $winner, 1);

		if ($event == 0)
			{
			# If event not zero - we already emoted zone takeover.
			#quest::ze(15, "$HollowshadeRace{$qglobals{$attacker}} make themselves comfortable in $defender.");

			# Can spawn another random war if there are still multiple factions
			quest::settimer("RandomWar", $RandomWar);
			}
		$takeover_in_progress=0;
		}
	elsif ($timer eq "Attack") 
		{
		#quest::ze(15, "The $HollowshadeRace{$qglobals{$defender}} have successfully defended $defender!");
		quest::stoptimer("Attack");
		quest::depopall($attacker_id);
		quest::depopall($defender_id);
		quest::settimer("RandomWar", $RandomWar);
		quest::setglobal("DeadDefenderCount", 0, 7, "F"); #Reset killed defender
		quest::setglobal("WarDefender", "NOWAR", 7, "F"); # Who is defending.
		}
}

sub EVENT_SIGNAL 
	{
	if ($signal == 1)
		{
		$defenders_down = 1;
		#quest::ze(15, "The $HollowshadeRace{$qglobals{$defender}} line of defense is down!  The time is now to seize $defender!");
		}

	if ($attackers_arrived==0 && $signal == 6)
		{
		$attackers_arrived = 1;
		#quest::ze(15, "The $HollowshadeRace{$qglobals{$attacker}} have penetrated deep into $defender defenses.  Victory is near!");
		}

	if (($qglobals{HollowshadeNorth} == $qglobals{HollowshadeEast}) &&
	   ($qglobals{HollowshadeNorth} == $qglobals{HollowshadeSouth}))
		{
		# Zone in conquered state, only listen to signal 5.
		if ($signal == 5) 
			{ #Boss Dead
			$event=0;
			RESET_GLOBALS();
			quest::repopzone();
			}
		}
	elsif ($takeover_in_progress == 0 &&
			(($signal == 1 && $attackers_arrived==1) ||
			($signal == 6 && $defenders_down==1)))
		{
		$takeover_in_progress=1;
		quest::stoptimer("Attack");
		quest::setglobal("DeadDefenderCount", 0, 7, "F"); # Reset to 0

		if ($defender eq "HollowshadeNorth") 
			{ # North Camp Overrun
			#Despawn Loser
			quest::spawn_condition($zonesn,$qglobals{HollowshadeNorth},0);

			# Set Winner
			quest::setglobal("HollowshadeNorth",$qglobals{$attacker},0,"F");
			$winner = $qglobals{$attacker};

			if ($qglobals{HollowshadeEast} == $qglobals{HollowshadeSouth}) 
				{
				TAKE_OVER($qglobals{$attacker});
				}
			}

		if ($defender eq "HollowshadeEast") 
			{ # East Camp Overrun

			#Despawn Loser
			quest::spawn_condition($zonesn, $qglobals{HollowshadeEast} + 3, 0);

			# Set Winner
			quest::setglobal("HollowshadeEast", $qglobals{$attacker}, 0, "F");
			$winner = $qglobals{$attacker}+3;

			if ($qglobals{HollowshadeNorth} == $qglobals{HollowshadeSouth}) 
				{
				TAKE_OVER($qglobals{$attacker});
				}
			}

		if ($defender eq "HollowshadeSouth") 
			{ # South Camp Overrun

			#Despawn Loser
			quest::spawn_condition($zonesn,$qglobals{HollowshadeSouth} + 6, 0);

			# Set Winner
			quest::setglobal("HollowshadeSouth", $qglobals{$attacker}, 0, "F");
			$winner = $qglobals{$attacker} + 6;

			if ($qglobals{HollowshadeNorth} == $qglobals{HollowshadeEast}) 
				{
				TAKE_OVER($qglobals{$attacker});
				}
			}

		# Set a timer to spawn new owners.  Gives PCs a chance to react.
		quest::settimer("SpawnNewOwners", 12);
		}
	elsif ($event==0 && $qglobals{WarDefender} eq "NOWAR" && $signal >= 2 && $signal <=4)
		{
		# No random war, PCs starting one.
		quest::stoptimer("RandomWar");
		

		if ($signal == 2)
			{
			# North is weak.
			$defender="HollowshadeNorth";

			if ($qglobals{HollowshadeNorth} == $qglobals{HollowshadeEast})
				{
				# East has same race, send South to attack.
				$attacker="HollowshadeSouth";
				}
			elsif ($qglobals{HollowshadeNorth} == $qglobals{HollowshadeSouth})
				{
				# South has same race, send East to attack.
				$attacker="HollowshadeEast";
				}
			else
				{
				# Pick a random attacker from E/S
				$attacker = 
					quest::ChooseRandom("HollowshadeEast", "HollowshadeSouth");
				}
			}
		elsif ($signal == 3)
			{
			# East is weak.
			$defender="HollowshadeEast";

			if ($qglobals{HollowshadeEast} == $qglobals{HollowshadeNorth})
				{
				# North has same race, send South to attack.
				$attacker="HollowshadeSouth";
				}
			elsif ($qglobals{HollowshadeEast} == $qglobals{HollowshadeSouth})
				{
				# South has same race, send North to attack.
				$attacker="HollowshadeNorth";
				}
			else
				{
				# Pick a random attacker from N/S
				$attacker = 
					quest::ChooseRandom("HollowshadeNorth","HollowshadeSouth");
				}
			# Add line to cause War.
			}
		elsif ($signal == 4)
			{
			#South is weak.
			$defender="HollowshadeSouth";

			if ($qglobals{HollowshadeSouth} == $qglobals{HollowshadeEast})
				{
				# East has same race, send North to attack.
				$attacker="HollowshadeNorth";
				}
			elsif ($qglobals{HollowshadeSouth} == $qglobals{HollowshadeNorth})
				{
				# North has same race, send East to attack.
				$attacker="HollowshadeEast";
				}
			else
				{
				# Pick a random attacker from E/N
				$attacker = 
					quest::ChooseRandom("HollowshadeEast", "HollowshadeNorth");
				}
			}
		
		#Trigger PC induced war. $attacker used by subroutine.
		quest::setglobal("WarDefender", $defender, 7, "F"); # Who is defending.
		quest::settimer("StartPCWar", 12);
		}
	elsif ($signal >= 2 && $signal <= 4 && $qglobals{WarDefender} ne "NOWAR")
		{
		#quest::ze(15,"The current invaders are undeterred in their course of action!");
		}	
	}

sub RESET_GLOBALS {
  quest::setglobal("HollowshadeNorth", 1, 0, "F"); #Owlbear in the North
  quest::setglobal("HollowshadeEast",  2, 0, "F"); #Sonic Wolves in the East
  quest::setglobal("HollowshadeSouth", 3, 0, "F"); #Grimlings in the South
}

sub RESET_ZONE {
  #quest::ze(15, "Zone resetting now.");
  quest::setglobal("DeadDefenderCount", 0, 7, "F"); # how many dead
  $attacker = "";
  $defender = "";
  $takeover_in_progress=0;
  quest::spawn_condition($zonesn, 1, 0);
  quest::spawn_condition($zonesn, 2, 0);
  quest::spawn_condition($zonesn, 3, 0);
  quest::spawn_condition($zonesn, 4, 0);
  quest::spawn_condition($zonesn, 5, 0);
  quest::spawn_condition($zonesn, 6, 0);
  quest::spawn_condition($zonesn, 7, 0);
  quest::spawn_condition($zonesn, 8, 0);
  quest::spawn_condition($zonesn, 9, 0);
  quest::spawn_condition($zonesn, 11, 0);
  quest::spawn_condition($zonesn, 12, 0);
  quest::spawn_condition($zonesn, 13, 0);
  quest::settimer("ResetPause", 5);
}

sub LOAD_SPAWNS {
  quest::spawn_condition($zonesn, $qglobals{HollowshadeNorth}    , 1);
  quest::spawn_condition($zonesn, $qglobals{HollowshadeEast}  + 3, 1);
  quest::spawn_condition($zonesn, $qglobals{HollowshadeSouth} + 6, 1);
  quest::settimer("RandomWar", $RandomWar);
}

sub TAKE_OVER {
	local($champion);		#  Make local variables
	($champion) = ($_[0]);	# Assign values

	$event=1;
	#quest::ze(15, "The $HollowshadeRace{$champion} have taken over Hollowshade and march toward the Vah Shir camp.");

	#Notify the Vah Shir!!

    quest::signalwith(166078, 5, 1);
    quest::signalwith(166079, 5, 1);
    quest::signalwith(166080, 5, 1);
    quest::signalwith(166081, 5, 1);
    quest::signalwith(166082, 5, 1);
    quest::signalwith(166083, 5, 1);
    quest::signalwith(166084, 5, 1);

	# Spawn Appropriate named & his Crew

  	quest::spawn_condition($zonesn, $champion+10 , 1);
}

sub START_WAR 
	{
	local($aa, $dd);				#  Make local variables
	($aa, $dd) = ($_[0], $_[1]);	# Assign values

	quest::setglobal("DeadDefenderCount", 0, 7, "F"); # how many 
	$defenders_down=0;
	$attackers_arrived=0;

	#quest::ze(15, "Calling for a WAR: A: $attacker D: $defender");

	if ($aa eq "")
		{
		#Select attacker
		$attacker = quest::ChooseRandom("HollowshadeNorth", 
									"HollowshadeEast", "HollowshadeSouth");
		#quest::ze(15, "Random Attacker Selected for WAR: A: $attacker");
		}

	if ($dd eq "")
		{
		#Select defender

		# First if N & E are allies
		if ($qglobals{HollowshadeNorth} == $qglobals{HollowshadeEast})
			{
			if (($attacker eq "HollowshadeNorth") || 
					($attacker eq "HollowshadeEast")) 
				{
				$defender = "HollowshadeSouth";
				}
			else
				{
				$defender=quest::ChooseRandom("HollowshadeNorth","HollowshadeEast");
				}
			}
		# Or if N & S are allies
		elsif ($qglobals{HollowshadeNorth} == $qglobals{HollowshadeSouth})
			{
			if (($attacker eq "HollowshadeNorth") || 
					($attacker eq "HollowshadeSouth")) 
				{
				$defender = "HollowshadeEast";
				}
			else 
				{
				$defender=quest::ChooseRandom("HollowshadeNorth",
														"HollowshadeSouth");
				}
			}
		# Or if S & E are allies
		elsif ($qglobals{HollowshadeSouth} == $qglobals{HollowshadeEast}) 
			{
			if (($attacker eq "HollowshadeEast") || 
					($attacker eq "HollowshadeSouth"))
				{
				$defender = "HollowshadeNorth";
				}
			else 
				{
				$defender=quest::ChooseRandom("HollowshadeEast","HollowshadeSouth");
				}
			}
		# Or all are at war.
		else 
			{
			if ($attacker eq "HollowshadeNorth")
				{
				$defender=quest::ChooseRandom("HollowshadeEast","HollowshadeSouth");
				}
			elsif ($attacker eq "HollowshadeEast") 
				{
				$defender=quest::ChooseRandom("HollowshadeNorth",
															"HollowshadeSouth");
				}
			else
				{
				$defender=quest::ChooseRandom("HollowshadeNorth","HollowshadeEast");
				}
			}
		#quest::ze(15, "Random Defender Selected for WAR: D: $attacker");
		}

	quest::setglobal("WarDefender", $defender, 7, "F"); # Who is defending.

	#Spawn attackers
	if (($qglobals{$attacker} % 3) == 1)	# North is 1,4,7
		{ 
		$attacker_id = 166139; #a_furious_owlbear
		}
	elsif (($qglobals{$attacker} % 3) == 2)	# North East 2,5,8
		{
		$attacker_id = 166091; #a_sonic_fiend
		}
	else 									# South
		{
		$attacker_id = 166266; #a_grimling_invader
		}

	SPAWN_ARMY($attacker_id, $attacker,"A");

	#Spawn defenders
	if (($qglobals{$defender} % 3) == 1)	# North is 1,4,7
		{
		$defender_id = 166242; #an_owlbear_defender
		}
	elsif (($qglobals{$defender} % 3) == 2)	# South is 2,5,8
		{
		$defender_id = 166264; #a_sonic_defender
		}
	else
		{
		$defender_id = 166279; #a_grimling_defender
		}

	SPAWN_ARMY($defender_id, $defender,"D");


	#quest::ze(4, "$AttackerText{$HollowshadeRace{$qglobals{$attacker}}}");
	#quest::ze(4, "$HollowshadeRace{$qglobals{$defender}} in $defender $DefenderText{$qglobals{$defender}}.");
	quest::settimer("Attack", 500); #Time Allotment
	}

#Spawn a set of invaders or defenders.
sub	SPAWN_ARMY
	{

	local($npc, $location, $atype);				#  Make local variables
	($npc, $location, $atype) = ($_[0], $_[1], $_[2]);	# Assign values

	if ($location eq "HollowshadeNorth")	#spawn northern army
		{
		quest::spawn2($npc,0,0,1103,2134,137,182);
		quest::spawn2($npc,0,0,1137,2109,143,178);
		quest::spawn2($npc,0,0,1129,2166,143,187);
		quest::spawn2($npc,0,0,1175,2175,170,172);
		quest::spawn2($npc,0,0,1185,2121,167,180);
		if ($atype eq "A")
			{
			quest::spawn2($npc,0,0,1140,2191,170,172);
			quest::spawn2($npc,0,0,1150,2098,165,180);
			}
		}
	elsif ($location eq "HollowshadeEast")	#spawn eastern army
		{
		quest::spawn2($npc,0,0,-2704,541,46,39);
		quest::spawn2($npc,0,0,-2730,592,48,60);
		quest::spawn2($npc,0,0,-2714,571,47,57);
		quest::spawn2($npc,0,0,-2747,498,51,43);
		quest::spawn2($npc,0,0,-2719,514,46,65);
		if ($atype eq "A")
			{
			quest::spawn2($npc,0,0,-2738,590,50,50);
			quest::spawn2($npc,0,0,-2709,555,50,46);
			}
		}
	else									#spawn southern army
		{
		quest::spawn2($npc,0,0,-621,-2753,55,252);
		quest::spawn2($npc,0,0,-602,-2764,60,242);
		quest::spawn2($npc,0,0,-633,-2773,60,239);
		quest::spawn2($npc,0,0,-644,-2794,68,254);
		quest::spawn2($npc,0,0,-591,-2794,69,252);
		if ($atype eq "A")
			{
			quest::spawn2($npc,0,0,-611,-2760,61,240);
			quest::spawn2($npc,0,0,-600,-2780,61,251);
			}
		}
	}

#END File: hollowshade/War_Trigger (166257)
