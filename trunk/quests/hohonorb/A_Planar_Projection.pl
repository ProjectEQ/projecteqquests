sub EVENT_SPAWN

{
quest::settimer(1,600);
}

sub EVENT_SAY {

if($text=~/hail/i)
	{
	quest::setglobal("pop_hohb_marr", 1, 5, "F");
	$client->Message(4,"You receive a character flag!");
	}
}


sub EVENT_TIMER {

if($timer == 1)
	{
	quest::depop();
	}
}
