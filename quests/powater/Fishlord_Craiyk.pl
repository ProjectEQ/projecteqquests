# Fishlord Event - PoWater
#
# The Fishlord event is a farm fest for any bored parties. There is no minimum player's required or a maximum. They summon NPC's on a set timer for a duration 
# of 3 hours. Mini Named spawn every so often with a final named at the very end.
#
# Written by Reno
#
my $spawnLoc;
my $spawnNpc;
my $spawnNpcID;
my $trashCount;
my $numSpawned;
my $miniNamedCount = 0;

sub EVENT_SPAWN {
	$spawnLoc = 0;
	$spawnNpc = 0;
	$spawnNpcID = 0;
	$trashCount = 0;
	$numSpawned = 0;
	$miniNamedCount = 0;
}

sub EVENT_SAY {
	if($text=~/Hail/i) {
		quest::say("Be like the water $name. The water spirits have fortold of your coming. I am a fishlord, summoner of the [dwellers] of the deep.");
	} 
	elsif($text=~/dwellers/i) {
		quest::say("These are great creatures that dwell in the nether reaches of this reef. For 100 platinum I will summon them forth.");
	}
}

sub EVENT_ITEM {
	if($platinum == 100 && !defined$qglobals{fishlord}) {
		quest::say("Very well, I will summon forth the creatures of the deep. They do not like being disturbed so you must protect me from harm. I am very vulnerable when summoning the dwellers of the deep. If death claims me the summoning will be finished. During the course of the summoning many powerful dwellers will appear. You must watch for them.");
		
		#This timer controls the spawn rate of our trash mob's
		quest::settimer("Trash", 860);
		
		#This timer controls the spawn rate of our mini named
		quest::settimer("MiniNamed", 2400);
		
		#This timer controls the final NPC and the end of the event
		quest::settimer("FinalNamed", 21600);
		
		#Set a glboal to prevent doing two events at once since there is two fishlord's
		quest::setglobal("fishlord", 1, 3, "H4");
		
		#Move to the end of our tunnel where it will all happen
		quest::moveto(-269.7, 120.7, -370);
	}
}

#I chose to use seperate timer's for each specific type of NPC, Trash, Mini, Named because Allah's had a few posts describing that it appeared this way on live.
sub EVENT_TIMER {
	#This is our trash timer
	if($timer eq "Trash") {
		quest::say("Listen oh spirits of water! I summon forth the dwellers of the deep.' He then begins to hum softly closing his eyes and seemingly settling into a deep focus. Suddenly he shouts a mystical chant saying, 'XAX XAX tomae tomae XAX podiggle podiggle XAX AZKHAZKKKY!");
		
		#Get a random number of trash to spawn, up to 4
		$trashCount = int(rand(3));
		
		#Spawn our trash at one of 6 random locations
		while($numberSpawned <= $trashCount) {
			#This next small bit of code will figure out which trash NPC we are going to spawn. We have 4 to choose from.
			
			#Get a random value to decide which NPC we will spawn
			$spawnNpc = int(rand(4));
			
			#Assign an NPC ID based off the random int we just got.
			#NOTE: I wish PERL had switch statements
			if($spawnNpc == 1) {
				$spawnNpcID = int(216085);#a reef anglerfish
			}
			elsif($spawnNpc == 2) {
				$spawnNpcID = int(216079);#a fierce anglerfish
			}
			elsif($spawnNpc == 3) {
				$spawnNpcID = int(216078);#a ferocious anglerfish
			}
			elsif($spawnNpc == 4) {
				$spawnNpcID = int(216081);#a furious anglerfish
			}
			
			
			#Now that we have an NPC to spawn, we will put him at one of the 6 predefined locations for potential spawns.
			#NOTE: This may have better been put into it's own sub, as it will get used again, but I was on a roll
			
			#Get a random value to use to decide which spawn location we will use
			$spawnloc = int(rand(6));
			
			#Use our generated value to determine a spawn location. I toiled with the idea of random locations but most info I found leaned towards
			# a set of specific spawn locations so I went with a set of 6 specific locations and generated randomly from within them.
			if($spawnLoc == 1) {
				quest::spawn2($spawnNpcID, 0, 0, -285.6, 125.1, -369.7, $h);
			}
			elsif($spawnLoc == 2) {
				quest::spawn2($spawnNpcID, 0, 0, -267, 120.7, -368, $h);
			}
			elsif($spawnLoc == 3) {
				quest::spawn2($spawnNpcID, 0, 0, -272.5, 214.6, -368.5, $h);
			}
			elsif($spawnLoc == 4) {
				quest::spawn2($spawnNpcID, 0, 0, -252.4, 220.1, -370.9, $h);
			}
			elsif($spawnLoc == 5) {
				quest::spawn2($spawnNpcID, 0, 0, -273, 44, -361.7, $h);
			}
			elsif($spawnLoc == 6) {
				quest::spawn2($spawnNpcID, 0, 0, -259.5, 48.4, -367.3, $h);
			}
		}
		
		#Increase our counter so we know how many have been spawned so far.
		$numberSpawned = $numberSpawned + 1;
	}
	
	#This is our timer for the Mini-Named
	elsif($timer eq "miniNamed") {
		#There is only a total of 9 mini's during the course of the event
		if($miniNamedCount <= 9) {
			quest::say("A dweller of some power comes, prepare yourself.");
			
			
			#Allah's say's that these spawn in a specific order. I used the order they gave. Should we discover that they are inf act random, 
			# it will need to be adjusted accordingly. 
			
			#Here we will get which of the mini-named we are on.
			#NOTE: PERL needs a switch statement
			if($miniNamedCount == 1) {
				$spawnNpcID = int(216082);#a hungry anglerfish
			}
			elsif($miniNamedCount == 2) {
				$spawnNpcID = int(216086);#a stringy anglerfish
			}
			elsif($miniNamedCount == 3) {
				$spawnNpcID = int(216090);#a wicked anglerfish
			}
			elsif($miniNamedCount == 4) {
				$spawnNpcID = int(216089);#a toughened agnlerfish
			}
			elsif($miniNamedCount == 5) {
				$spawnNpcID = int(216080);#a foul anglerfish
			}
			elsif($miniNamedCount == 6) {
				$spawnNpcID = int(216077);#a dark anglerfish
			}
			elsif($miniNamedCount == 7) {
				$spawnNpcID = int(216087);#a superior agnlerfish
			}
			elsif($miniNamedCount == 8) {
				$spawnNpcID = int(216083);#a prime anglerfish
			}
			elsif($miniNamedCount == 9) {
				$spawnNpcID = int(216084);#a prismatic anglerfish
			}
			
			
			#Now that we have an NPC to spawn, we will put him at one of the 6 predefined locations for potential spawns.
			#NOTE: This may have better been put into it's own sub, as it will get used again, but I was on a roll
			
			#Get a random value to use to decide which spawn location we will use
			$spawnloc = int(rand(6));
			
			#Use our generated value to determine a spawn location. I toiled with the idea of random locations but most info I found leaned towards
			# a set of specific spawn locations so I went with a set of 6 specific locations and generated randomly from within them.
			if($spawnLoc == 1) {
				quest::spawn2($spawnNpcID, 0, 0, -285.6, 125.1, -369.7, $h);
			}
			elsif($spawnLoc == 2) {
				quest::spawn2($spawnNpcID, 0, 0, -267, 120.7, -368, $h);
			}
			elsif($spawnLoc == 3) {
				quest::spawn2($spawnNpcID, 0, 0, -272.5, 214.6, -368.5, $h);
			}
			elsif($spawnLoc == 4) {
				quest::spawn2($spawnNpcID, 0, 0, -252.4, 220.1, -370.9, $h);
			}
			elsif($spawnLoc == 5) {
				quest::spawn2($spawnNpcID, 0, 0, -273, 44, -361.7, $h);
			}
			elsif($spawnLoc == 6) {
				quest::spawn2($spawnNpcID, 0, 0, -259.5, 48.4, -367.3, $h);
			}
			
			#Increase our mini-named counter
			$miniNamedCount = $miniNamedCount + 1;
		}
		
		#If by some miracle we are at 10, we have spawned 9 alreadya nd should not spawn another. THis should prevent the final NPC from spawning with a mini-named
		elsif($miniNamedCount >= 10) {
			quest::stoptimer("miniNamed");
		}
	}
	#This is the final NPC timer and the end of our event
	elsif($timer eq "FinalNamed") {
		quest::say("I sense a creature of immense power has been summoned forth. My job here is finished. You all have done very well for mortals.");
		
		#Spawn our final NPC
		quest::spawn2(216088, 0, 0, $x, $y, $z, $h);#A supreme anglerfish
		
		#Go away to clear out variables
		quest::depop();
	}
}