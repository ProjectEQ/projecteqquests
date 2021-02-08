#Kaza_Raj.pl
#Ghulam Armor
#I saw no mention of experience or faction hits in the quest on Alla's.
#After writing this, I saw that someone else already had.  I merged my work and theirs, whoever it was.  They had better dialogue information than I did.  -Kilelen
# items: 2476, 2453, 2460, 2452, 2477, 2454, 2478, 2455, 2479, 2456, 2480, 2457, 2481, 2459

sub EVENT_SAY { 
	if($text=~/Hail/i) {
		quest::say("Ah. greetings!  I am Kaza Raj, trainer of young Vah'shir!  Bring me the items I ask and I will reward you with pieces of armor to protect you in your travels.  I have a fine pair of [gloves] available now if you're interested.");
	}
	
	if($text=~/gloves/i) {
		quest::say("Great!  Let's start with the gloves then, shall we?  Gloves, yes indeed - I will give them to you if you go out and kill Cht'Thk Bloodlings.  Bring me four Sharp Bloodling Mandibles as proof of your deeds.");
	}
	
	if($text=~/bracer/i) {
		quest::say("Ah yes, a  Bracer. I'm sure I have one here somewhere.  I'll look for it while you do me a service.  Skeletal Brigands and Hunters have been endangering our young ones, seek them out and bring me four Broken Skulls!");
	}
	
	if($text=~/boots/i) {
		quest::say("You are doing fine work. I'm so pleased to have met you!  I'm confident you can help me again if you're interested.  The guards have mentioned a problem with Shades roaming too near the city.  I'd like to see if we can do something about that. Go and kill Lesser Shades, and bring me four Shadowed Claws and I will give you some boots as a reward!");
	}
	
	if($text=~/sleeves/i) {
		quest::say("Have you seen the Loda Kai in your explorations?  They are a great menace, oh very bad indeed!  They're nothing but criminals and brigands, ooooh how I hate them.. Fetch me four Loda Kai earrings and I shall give you some fine sleeves for your trouble!");
	}
	
	if($text=~/cap/i) {
		quest::say("Excellent work dispatching those Brigands! Now seek out Loda Kai thugs and return with four Insignia, I shall give you a useful cap if you serve me well!");
	}
	
	if($text=~/tunic/i) {
		quest::say("A breastplate shall complete your set! Bring me four carapaces from Cht'Thk Bloodbulks and I will give you a wonderful tunic!");
	}
	if($text=~/pant/i) {
		quest::say("Hmm, you are growing more mighty as time passes - Kill Saurek Claw Beasts and bring me four fangs, I have most excellent pants if you succeed.");
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 2476 => 4)){#Broken Brigand Skull  x4
		quest::say("Excellent! Here are your Bracer! Would you like to get some [Boots]?");
		quest::summonitem(2453);#Ghulam Bracer
	}
	
	elsif(plugin::check_handin(\%itemcount, 2460 => 4)){#Sharp Bloodling Mandible  x4
		quest::say("Excellent! Here are your Gloves! Would you like to get a [Bracer]?");
		quest::summonitem(2452);#Ghulam Gloves
	}
	
	elsif(plugin::check_handin(\%itemcount, 2477 => 4)){#Shadowed Claw  x4
		quest::say("Excellent! Here are your Boots! Would you like to get some [Sleeves]?");
		quest::summonitem(2454);#Ghulam Boots
	}

	elsif(plugin::check_handin(\%itemcount, 2478 => 4)){#Loda Kai Earring  x4
		quest::say("Excellent! Here are your Sleeves! Would you like to get a [Cap]?");
		quest::summonitem(2455);#Ghulam Armguards
	}

	elsif(plugin::check_handin(\%itemcount, 2479 => 4)){#Loda Kai Insignia  x4
		quest::say("Excellent! Here is your Cap! Would you like to get some [Pants]?");
		quest::summonitem(2456);#Ghulam Cap 
	}

	elsif(plugin::check_handin(\%itemcount, 2480 => 4)){#Saurek Fang  x4
		quest::say("Excellent! Here are your Pants! Would you like to get a [Tunic]?");
		quest::summonitem(2457);#Ghulam Legplates 
	}

	elsif(plugin::check_handin(\%itemcount, 2481 => 4)){#Bloodbulk Carapace  x4
		quest::say("Excellent! Here is your Tunic!");
		quest::summonitem(2459);#Ghulam Tunic
	}
  	
	plugin::return_items(\%itemcount);
}#END of FILE Zone:shadeweaver  ID:165117--Kaza_Raj.pl
