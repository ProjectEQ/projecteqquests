sub EVENT_SAY {
	if ($text=~/hail/i) {
    		quest::say("Hello $name. Come to take a look at the crystal geode? The geode has some very strong magic inside of it that can help you. I can bring out the magic of the geode for you, but a gnome has to make a living! Even if he's stuck in this little hole in the wall all the time. Not that I'm bitter. Each of the crystals I sell is linked to a location in our world. If you give me one of the crystals I can focus the geode to let you and your companions travel there in the blink of an eye!"); 
  	}
}

sub EVENT_ITEM {
	
	if(plugin::check_handin(\%itemcount, 10092 => 1)){
		quest::setglobal("ghport$uguild_id",10092,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 10094 => 1)){
		quest::setglobal("ghport$uguild_id",10094,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 64191 => 1)){
		quest::setglobal("ghport$uguild_id",64191,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 76000 => 1)){
		quest::setglobal("ghport$uguild_id",76000,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 76001 => 1)){
		quest::setglobal("ghport$uguild_id",76001,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 76002 => 1)){
		quest::setglobal("ghport$uguild_id",76002,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 76003 => 1)){
		quest::setglobal("ghport$uguild_id",76003,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 76004 => 1)){
		quest::setglobal("ghport$uguild_id",76004,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 76005 => 1)){
		quest::setglobal("ghport$uguild_id",76005,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 76006 => 1)){
		quest::setglobal("ghport$uguild_id",76006,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 76007 => 1)){
		quest::setglobal("ghport$uguild_id",76007,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 76009 => 1)){
		quest::setglobal("ghport$uguild_id",76009,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 76010 => 1)){
		quest::setglobal("ghport$uguild_id",76010,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 76011 => 1)){
		quest::setglobal("ghport$uguild_id",76011,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 76012 => 1)){
		quest::setglobal("ghport$uguild_id",76012,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 76070 => 1)){
		quest::setglobal("ghport$uguild_id",76070,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 88735 => 1)){
		quest::setglobal("ghport$uguild_id",88735,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 88736 => 1)){
		quest::setglobal("ghport$uguild_id",88736,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 88737 => 1)){
		quest::setglobal("ghport$uguild_id",88737,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 88738 => 1)){
		quest::setglobal("ghport$uguild_id",88738,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 88739 => 1)){
		quest::setglobal("ghport$uguild_id",88739,3,"H24");
		sub EVENT_PORTTEXT;
	}
	elsif(plugin::check_handin(\%itemcount, 88740 => 1)){
		quest::setglobal("ghport$uguild_id",88740,3,"H24");
		sub EVENT_PORTTEXT;
	}
	else {
		quest::say("I have no use for this, $name.");
		plugin::return_items(\%itemcount);
	}

}

sub EVENT_PORTTEXT {
	quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
}