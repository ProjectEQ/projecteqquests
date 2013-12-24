sub EVENT_SPAWN

{
quest::settimer(1,600);
}

sub EVENT_SAY {

if($text=~/hail/i)
	{
	quest::setglobal("pop_bot_agnarr", 1, 5, "F");
	$client->Message(4,"You receive a character flag!");
        $client->Message(4,"Very good mortal... visit Karana upstairs.");
	}
{
$pop_bot_agnarr = undef;
}
}


sub EVENT_TIMER {

if($timer == 1)
	{
	quest::depop();
	}
}
