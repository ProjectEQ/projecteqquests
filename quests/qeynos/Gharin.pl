#Gharin.pl
#Gharin's Note (Good)

sub EVENT_SAY {
	if($text=~/Hail/i)   {
		quest::say("Good day! I see they have good stock for the future armies of Qeynos. I, myself, wish to be a soldier one day instead of doing this [job].");
	}
	
	if($text=~/job/i)   {
		quest::say("I am a [messenger] for Antonius Bayle. Not big enough to fight, but light enough to run all the way to the [Jaggedpine] tomorrow morning. I sort of wish I did not have to go. I'd rather be at the Lion's Mane.");
	}
	
	if($text=~/Jaggedpine/i)   {
		quest::say("I will be taking a private note to the head druid of the Jaggedpine Treefolk. Matter of fact, I am carrying the note right now. But enough about that, if it were not for the mission tomorrow, I could be doing something at the [Lion's Mane].");
	}
	
	if($text=~/Lion's Mane/i)   {
		quest::say("Ahh. The Lion's Mane. If I were there, I would be enjoying a stein of Crow's [special brew]. They are expecting their first shipment of the brew. I believe if I had a few or more of those lagers, I would be very ill. I would probably have to have someone else deliver the note for me. Still, I wish I had one of those fine brews.");
	}
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 13799 => 4)) { #4x Crows Special Brew 
		quest::say("Oh! That's tasty. I guess I could handle a few more.");
		quest::say("Oh! That's tasty. I guess I could handle a few more.");
		quest::say("Oh! That's tasty. I guess I could handle a few more.");
		quest::say("Oohhh! My head. Stop the pub from spinning. I cannot make it to the Jaggedpine feeling like this. Please take this note to Te'Anara of the Treefolk. Here is a little silver for the favor. Thanks. Ooohhhh..");
		quest::summonitem(18807);#Sealed Letter [Note To Jaggedpine - real]
		quest::faction(135, 10);#Guards of Qeynos
		quest::faction(9, 10);#Antonius Bayle
		quest::faction(33, -20);#Circle Of Unseen Hands
		quest::faction(53, -20);#Corrupt Qeynos Guards
		quest::faction(217, 10);#Merchants of Qeynos
		quest::exp(8000);
		quest::givecash(0, 1, 0, 0);#1sp
	}
	
	else {
		plugin::return_items(\%itemcount);
	}
}

#End of File zone:qeynos ID: 1081 -- Gharin.pl