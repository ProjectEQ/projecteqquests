#Ronar_Flametip.pl
#Alternate Access: Tower of Solusek Ro

sub EVENT_SAY
{
	if ($text=~/Hail/i) {
		quest::say("Greetings travelers! Though the blessing Karana bestowed upon me seems to be waning, I was at least able to portend your arrival here and the role you would play in the [events] I shall soon inform you of.");
	}
	
	if ($text=~/events/i) {
		quest::say("My gift normally allows me to peer into other realms. I have used it many times to protect Norrath from dangerous outside forces. Now, however, I have lost the ability to peer into the planes under the domain of Fennin Ro. I suspect that his son, Solusek, may play a hand in these events, although I know not how. I fear that he has managed to somehow [move the portal] into the Plane of Fire for reasons that are not completely clear to me.");
	}
	
	if ($text=~/move the portal/i) {
		quest::say("Yes, and by doing so he has blocked my sight and access into the plane itself. Yet before I completely lost the ability to see into his realm, I glimpsed a giant stream of mystical fire coming from his tower and shooting upwards into the sky. Once the clouds had parted, another more sinister torrent of magic returned from the sky back to his tower. I believe that Solusek may have an accomplice for whatever he has planned. Though I much prefer subtlety, I fear the time for that has passed. No, you must simply stop Solusek from completing his plans and you must discover who his accomplice is lest he manages to continue their vile plans. Will you [fulfill the call of destiny]?");
	}
	
	if ($text=~/fulfill the call of destiny/i) {
		quest::say("Before you can gain access to Solusek's tower, you will need an enchantment to protect you from the searing heat that is contained within its walls. On my own I do not have the ability to grant such protection but I can still aid thee nonetheless. In the frigid landscapes of the Western Wastes there is a particularly powerful [efreeti] that wanders a path that only the mad would follow.");
	}
	
	if ($text=~/efreeti/i) {
		quest::say("Banished by his own kind for cruelty not even they could tolerate, he roams the wasteland forever searching for the entrance back to his home, an entrance forever denied to him. You must destroy this abomination and bring me the fiery heart that burns inside of him. Only then will you be able to survive the blistering environment in Solusek Ro's tower. Once inside though, you will need to gain access to his inner sanctum by getting his sanctum key. I know little of this but always be on the lookout for help for you never know when the gods may choose to aid you. Once you have destroyed Solusek, return to me with any information you find.");
	}
}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 36568 => 1)) {#Banished Efreeti Heart
		quest::say("Very good $name. With this I can create an enchantment powerful enough to protect you from the searing heat within Solusek's Tower.' Ronar plunges the heart into the nearby pool of water and begins to chant in a low monotonous tone. The water around his claw begins to boil and swirl faster and faster as his chanting grows louder till he finally pulls out his now-empty claw. He gently touches your forehead and though you hear your flesh sizzle as he inscribes a rune upon it, you feel nothing. 'Now you may freely enter Solusek's Tower and complete your task.");
		#Flag for solro tower
		#Alternate access qglobal
		quest::setglobal("pop_alt_access_solrotower",1,5,"F");
		$client->Message(15, "You have received a character flag!");
	}
   
	else {
		plugin::return_items(\%itemcount); #return items if not the ones required
	}
}#END of FILE Zone:draniksscar ID:302047 --Vorskahn.pl