#Jheron_Felkis.pl
#Gem Inlaid Gauntlets

sub EVENT_SAY {
	if($text=~/Hail/i)   {
		quest::say("Ah, greetings, traveler! Settled into one of these rooms, have you? Well, this room is mine, so get out! Hey, wait! You aren't here to deliver a [shipment of books] to me, are you?");
	}
	
	if($text=~/shipment of books/i)   {
		quest::say("Oh, I typically receive monthly shipments of books from Umvera Dekash. I hear he has recently been promoted to senior librarian in Erudin. What a vaulted position! I could only aspire. I'm not going to be binding books forever, you know!");
	}
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18508 => 1)) { #Tesch Val Compilation
		quest::say("So you are from Umvera! What is this? Oh my! INtersting! I'll bind them right away! A little snip here..a little snip there.. All done! That didn't take long, did it? I won't be doing this forever, you know. After the milita burned down my father's home, he could not afford to send me through proper schooling. Ah well, such is life!");
		quest::summonitem(18510);#Pawbook
		quest::exp(8000);
	}
	
	else {
		plugin::return_items(\%itemcount);
	}
}

#End of File zone:freporte ID: 10130 -- Jheron_Felkis.pl