#Edvard_Tommels.pl
#Tesch Val Scrolls
#http://www.runen.co.uk/Everquest/Zones/Quests/SQeynos/EdvardTommels.htm is my source - Kilelen

sub EVENT_SAY {
	if($text=~/Hail/i)   {
		quest::say("Greetings, $name . Thank you for stopping by. Had you heard I was looking for any and all information regarding the Tesch Val incursion? Perhaps you have come to help me gather knowledge? I seek the [Tesch Val scrolls]!");
	}
	
	if($text=~/Tesch Val scrolls/i)   {
		quest::say("Oh good! I can add them to my collection. We are preparing to make books you know. Bring me any of the scrolls you find in the old Splitpaw lair, and I would be happy to reward you handsomely.");
	}
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18504 => 1, 18505 => 1, 18506 => 1, 18507 => 1)) { #Tanned Split Paw Skin, volumes 1-4
		quest::say("Why thank you, $name. If you do happen to come across any more of these, please bring them to me.");
		quest::summonitem(12076);#Karana's Tear, oldschool original, not the PoP version.
		quest::faction(434, 30);#Some Qeynos Citizen faction.
		#Random amount of money
		my $pp = int(rand(6));
		my $gp = int(rand(20));
		my $sp = int(rand(60));
		my $cp = int(rand(100));
		quest::givecash($cp, $sp, $gp, $pp);
	}
	
	#Any one of the scrolls, alone, is still worth something.  Doesn't get an earring, though.  Trying to emulate live behavior here.
	elsif ((plugin::check_handin(\%itemcount, 18504 => 1)) || (plugin::check_handin(\%itemcount, 18505 => 1)) || (plugin::check_handin(\%itemcount, 18506 => 1)) || (plugin::check_handin(\%itemcount, 18507 => 1))) {
		quest::say("Why thank you, $name. If you do happen to come across any more of these, please bring them to me.");
		quest::faction(434, 10);#Some Qeynos Citizen faction.
		#Random amount of money
		my $pp = int(rand(3));
		my $gp = int(rand(10));
		my $sp = int(rand(30));
		my $cp = int(rand(50));
		quest::givecash($cp, $sp, $gp, $pp);
	}
	
	else {
		plugin::return_items(\%itemcount);
	}
}

#End of File zone:qeynos ID: 1134 -- Edvard_Tommels