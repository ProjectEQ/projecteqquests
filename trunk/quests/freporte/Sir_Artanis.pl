#last part of sir arium's bridal. Sir arium is in freeport east

sub EVENT_SAY
{
	if($text=~/befallen/i)
	{
		quest::say("You did well to ride swiftly with this news. I must take this directly to Valeron Dushire. If you learn more about this plot that would unleash this monster upon Norrath or wish to someday soon aid the Knights of Truth in putting down this evil, then return to speak to me again at a later time.");
	}
}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount,18474 =>1))
	{
		quest::say("By Marr, what is this? .. Burning Dead .. .. Marnek! By my blade this must be stopped! Where did you find this?");
	}
	if(plugin::check_handin(\%itemcount,31492 => 1))
	{
		quest::say("It was a fine and valiant steed to serve its master beyond the grave, but it looks to be near its end. But I have a fine eye for horses, and I dare say it will serve you one more time.");
		quest::summonitem(31496);
	}
}