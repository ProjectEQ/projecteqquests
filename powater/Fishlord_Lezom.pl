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
	$miniNamedCount = 1;
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
		
		quest::settimer("Trash", 420);
		
		quest::settimer("MiniNamed", 2400);
		
		quest::settimer("FinalNamed", 21600);
		
		quest::setglobal("fishlord", 1, 3, "H4");
		
		quest::moveto(143.8, 131.5, -377.9);
	}
}

sub EVENT_TIMER {
	if($timer eq "Trash") {
		quest::say("Listen oh spirits of water! I summon forth the dwellers of the deep.' He then begins to hum softly closing his eyes and seemingly settling into a deep focus. Suddenly he shouts a mystical chant saying, 'XAX XAX tomae tomae XAX podiggle podiggle XAX AZKHAZKKKY!");
		
		$trashCount = int(rand(3));

		while($numSpawned <= $trashCount) {
			$spawnNpc = int(rand(4));
			
			if($spawnNpc == 1) {
				$spawnNpcID = 216085;#reef 
			}
			elsif($spawnNpc == 2) {
				$spawnNpcID = 216079;#fierce 
			}
			elsif($spawnNpc == 3) {
				$spawnNpcID = 216078;#ferocious 
			}
			elsif($spawnNpc == 4) {
				$spawnNpcID = 216081;#furious 
			}
			
			$spawnLoc = int(rand(6));
			
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
		
		$numSpawned = $numSpawned + 1;

                }
               
                $numSpawned = 0;
	}
	
	elsif($timer eq "MiniNamed") {
		if($miniNamedCount <= 9) {
			quest::say("A dweller of some power comes, prepare yourself.");
			
			if($miniNamedCount == 1) {
				$spawnNpcID = 216082;#hungry
			}
			elsif($miniNamedCount == 2) {
				$spawnNpcID = 216086;#stringy
			}
			elsif($miniNamedCount == 3) {
				$spawnNpcID = 216090;#wicked
			}
			elsif($miniNamedCount == 4) {
				$spawnNpcID = 216089;#toughened
			}
			elsif($miniNamedCount == 5) {
				$spawnNpcID = 216080;#foul
			}
			elsif($miniNamedCount == 6) {
				$spawnNpcID = 216077;#dark
			}
			elsif($miniNamedCount == 7) {
				$spawnNpcID = 216087;#superior
			}
			elsif($miniNamedCount == 8) {
				$spawnNpcID = 216083;#prime
			}
			elsif($miniNamedCount == 9) {
				$spawnNpcID = 216084;#prismatic
			}
			
			$spawnLoc = int(rand(6));
			
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
			
			$miniNamedCount = $miniNamedCount + 1;
		}
		
		elsif($miniNamedCount >= 10) {
			quest::stoptimer("MiniNamed");
		}
	}
	elsif($timer eq "FinalNamed") {
		quest::say("I sense a creature of immense power has been summoned forth. My job here is finished. You all have done very well for mortals.");
		
		quest::spawn2(216088, 0, 0, $x, $y, $z, $h);#supreme
		quest::depop_withtimer();
	}
}
