sub EVENT_SPAWN

{
quest::settimer(1,600);
}

sub EVENT_SAY {

if($text=~/Hail/)
	{
	quest::setglobal("eartha_arbitor_projection", 1, 5, "F");
	$client->Message(4,"You receive a character flag!");
	}
}


sub EVENT_TIMER {

if($timer == 1)
	{
	quest::depop;
	}
}
