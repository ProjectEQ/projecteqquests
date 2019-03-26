sub EVENT_SPAWN {
	quest::settimer("onset",60);
	quest::settimer("readygo",150);
}

sub EVENT_TIMER {
	if($timer=="onset") {
		quest::moveto(-4341,-748,-183,-2,1);
		quest::stoptimer("onset");
	}
	if(($timer=="readygo") && ($x==-4341 && $y==-748)) {
		quest::say("Onward men, the eyes of Zek are upon us.");
		quest::stoptimer("readygo");
		quest::signalwith(119167,1,300); # NPC: Berzerker_Voldak
		quest::signalwith(119166,1,300); # NPC: Berzerker_Dolvad
		quest::signalwith(119169,1,300); # NPC: Disciple_Atharm
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 5) {
		quest::say("Hold here squad");
		quest::signal(119050,300); # NPC: Lieutenant_Krofer
	}
}

sub EVENT_SAY {
	if(($text=~/troop attack/i) && ($x==-225 && $y==1725)) {
		quest::shout("Destroy them!!");
		quest::me("Suddenly, all around the Sifaye village, several beings phase into reality.  Their eyes glow with the golden light of divinity, obviously sent from a higher plane of existence.  The Kromzek assault squad is surely doomed. You decided to withdraw and report what you have found, perhaps the Lieutenant will understand.");
		quest::signalwith(119167,2,300); # NPC: Berzerker_Voldak
	}
}

sub EVENT_SIGNAL {
	if ($signal == 1) {
		quest::start(23);
	}
	if ($signal == 2) {
		quest::say("Grraaaggh! AMBUSH!! Die well!");  
		quest::spawn2(119174,0,0,-146,1703,-192,374);  # a_sifaye_defender
		quest::spawn2(119174,0,0,-149,1731,-192,374);  # a_sifaye_defender
		quest::spawn2(119174,0,0,-162,1738,-192,374);  # a_sifaye_defender
		quest::spawn2(119174,0,0,-172,1758,-192,364);  # a_sifaye_defender
	}
}



