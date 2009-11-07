sub EVENT_CLICKDOOR { 
	my $d_id = ($doorid % 256);
	if($d_id == 1)
	{
		if($client->KeyRingCheck(28638))
		{
			quest::movepc(215,-599.6,3.5,1447.5);
			$client->Message(15, "You got the door open!");
			quest::setglobal("Xegkey",1,2,"M5");
		}
		elsif(plugin::check_hasitem($client, 28638))
		{
			$client->KeyRingAdd(28638);
			quest::movepc(215,-599.6,3.5,1447.5);
			$client->Message(15, "You got the door open!");
			quest::setglobal("Xegkey",1,2,"M5");
		}
		elsif(defined $qglobals{Xegkey})
		{
			quest::movepc(215,-599.6,3.5,1447.5);
			$client->Message(15, "You got the door open!");
		}
	}
}