sub EVENT_ITEM {

		plugin::try_tome_handins(\%itemcount, $class, 'Bard');
		plugin::return_items(\%itemcount);
		quest::say("I don't need this.");
	}