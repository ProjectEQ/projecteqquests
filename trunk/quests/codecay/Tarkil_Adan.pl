sub EVENT_SPAWN

{
quest::settimer(1,600);
}

sub EVENT_SAY {

if($text=~/Hail/)
	{
        quest::emote("lets out a groan and then whimpers saying, 'Yes great ones yesss I was king once I wasss. ' The creature then mutters under his breath and passes you a small glowing bone fragment etched in runes. Then speaks again saying, 'The tortured ones oh the tortured ones, you must go to the depths of Lxanvom and free them. Go to the bone throne at the ruins entrance there you will find access to the depths.' He then goes back to whimpering and rocking back and forth.");
	quest::setglobal("pop_cod_preflag", 1, 5, "F");
	$client->Message(4,"You receive a character flag!");
	}
{
#pop_cod_preflag = undef;
}
}


sub EVENT_TIMER {

if($timer == 1)
	{
	quest::depop();
	}
}