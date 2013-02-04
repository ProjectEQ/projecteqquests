sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Mmmph!!  Who you?  Oh. you $name.  You supposed to be promising Craknek.  Me need you.  There bad things in swamp.  You want [help Crakneks] or you [want Guntrik bash your face]!!?");
	}
	if($text=~/what help crakneks/i){
		quest::say("Crakneks warriors!!  They be far back.  Through last caves.  They smash and bash.  They no like Greenbloods.  Bouncers keep thems from bashing.");
	}
	if($text=~/want gruntrik to bash my face/i){
		quest::say("OK!! Me bash!!  You hurt!!");
	}
	if ($text=~/help crakneks/i) {
		quest::say("Go to swamps. Find noble hunters of humans and elves. All have house crests. Return to me and I give things. If you find special item says where hunters sleep, give to me. If meat founded then give to Clurg's cook. She make fine stew and give coins for meat.");
	}
}

sub EVENT_ITEM { 
	if (plugin::check_handin(\%itemcount, 18787 => 1)) {
		quest::say("Ahh..  good..  good..  here. take..  Now you Craknek! You bash good. Bash lizards. Bash froggies. Bash mushrooms. Remember. you no help Greenbloods. Crakneks stronger than Greenbloods. When you [want to help crakneks] you tell Guntrik.");
		quest::summonitem(13525);
		quest::ding();
		quest::faction(57,5);  # Craknek Warrior
		quest::faction(46,5);  # Clurg
		quest::faction(128,-10); # Green Blood Knight
		quest::exp(100);
	}
	if (plugin::check_handin(\%itemcount, 13361 => 1)) {
		quest::say("One less trouble. Hunhuh!! You do good work. Keep up. Remember to bring any special things to Guntrik. Here junk for good work. Go away now.");
		quest::summonitem(quest::ChooseRandom(5032,5029, 5033, 5031, 13355));
	} 
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
		plugin::return_items(\%itemcount);
	}
}

#END of FILE Zone:oggok  ID:49043 -- Guntrik 

