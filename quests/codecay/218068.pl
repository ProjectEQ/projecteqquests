sub EVENT_SPAWN

{
quest::settimer(1,600);
}

sub EVENT_SAY {

if($text=~/Hail/)
	{
	quest::setglobal("pop_cod_bertox", 1, 5, "F");
	$client->Message(4,"You receive a character flag!");
	}
{
$pop_cod_bertox=undef;

}
}


sub EVENT_TIMER {

if($timer == 1)
	{
	quest::depop;
	}
}