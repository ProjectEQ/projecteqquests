#Agent_of_The_Tribunal.pl
#All Trials
#Kilelen

#Variable to stop them from leaving.
my $hold_them = 0;

sub EVENT_SAY {
	if ($text =~ /Hail/i) {
		quest::say("Do you wish to [return]?");
	}
	
	elsif($text =~ /return/) {
		if ($hold_them == 0) {
			quest::say("Very well.");
			quest::movepc(201,456,825,9);
		}
		else {
			quest::say("You have gotten this far, mortal, you must finish this or die trying.");#Text made up
		}
	}
 }
 
 sub EVENT_SIGNAL {
	my $x = int($npc->GetX());
	my $y = int($npc->GetY());
	
	#Trial of Execuction boss up
	if ($signal == 1) {
		quest::say("Boss up.");
		quest::say("$x");
		quest::say("$y");
		if (($x == 141) && ($y == -1045)) {
			$hold_them = 1;
			quest::say("Return locked");
		}
	}
	#Trial of Flame boss up
	elsif ($signal == 2) {
		if (($x == 911) && ($y == -794)) {
			$hold_them = 1;
		}
	}
	#Trial of Hanging boss up
	elsif ($signal == 3) {
		if (($x == 490) && ($y == -1047)) {
			$hold_them = 1;
		}
	}
	#Trial of Lashing boss up
	elsif ($signal == 4) {
		if (($x == 1343) && ($y == -1138)) {
			$hold_them = 1;
		}
	}
	#Trial of Stoning boss up
	elsif ($signal == 5) {
		if (($x == -149) && ($y == -1196)) {
			$hold_them = 1;
		}
	}
	#Trial of Torture boss up
	elsif ($signal == 6) {
		if (($x == 772) && ($y == -1148)) {
			$hold_them = 1;
		}
	}
	#Trial of Execuction boss down
	elsif ($signal == 11) {
		if (($x == 141) && ($y == -1045)) {
			$hold_them = 0;
		}
	}
	#Trial of Flame boss down
	elsif ($signal == 12) {
		if (($x == 911) && ($y == -794)) {
			$hold_them = 0;
		}
	}
	#Trial of Hanging boss down
	elsif ($signal == 13) {
		if (($x == 490) && ($y == -1047)) {
			$hold_them = 0;
		}
	}
	#Trial of Lashing boss down
	elsif ($signal == 14) {
		if (($x == 1343) && ($y == -1138)) {
			$hold_them = 0;
		}
	}
	#Trial of Stoning boss down
	elsif ($signal == 15) {
		if (($x == -149) && ($y == -1196)) {
			$hold_them = 0;
		}
	}
	#Trial of Torture boss down
	elsif ($signal == 16) {
		if (($x == 772) && ($y == -1148)) {
			$hold_them = 0;
		}
	}
}