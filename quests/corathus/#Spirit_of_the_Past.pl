sub EVENT_SAY
{
	if($text=~ /Hail/i)
	{
		if(quest::istaskactive(142))
		{
			if(quest::istaskactivityactive(142, 0))
			{
				$client->Message(257, "Spirit of the Past whispers, 'You might think in death I am defeated, but alas I am free now. My mind no longer belongs to him, for this I thank you. I know you seek Wilfred, know this: he wont appear until he feels he has no other choice. Destroy his machines and lieutenants and eventually he will show himself.'");
				quest::updatetaskactivity(142, 0, 1);
			}
		}
	}
}