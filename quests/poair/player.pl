sub EVENT_CLICKDOOR { 
	#Xegony's Island door is ID 1.
	#If they have a key, move them in
	if($doorid == 1 && plugin::check_hasitem($client, 28638) && !defined $qglobals{Xegkey}) {
		#move the player in to Xegony's island
		quest::movepc(215,-599.6,3.5,1447.5);
		
		#If the global isn't set, we need to set it as it's 1 key per raid and we ahve no moveraid function
		if(!defined $qglobals{Xegkey}) {
			quest::setglobal("Xegkey",1,3,"M5");
		}
	}
	
	#A person with a key ahs used the door recently, we can all use it now.
	elsif($doorid == 1 && defined $qglobals{Xegkey}) {
		quest::movepc(215,-599.6,3.5,1447.5);
	}
} 